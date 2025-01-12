from flask import *
import oracledb as db
import os
import random
import math
from datetime import datetime

app = Flask(__name__)
app.secret_key = "key"

db.init_oracle_client(r"C:\oracle_instantclient\instantclient_23_6")

conn = db.connect(user="NEXUS", password="NEXUS",
                 host="localhost", port=1521, service_name="XE")

@app.route("/")
def landing():
    return render_template("login.html")

@app.route("/login", methods = ['GET', 'POST'])
def login():

    if request.method == 'GET':
        return render_template("login.html")

    username = request.form['username']
    password = request.form['password']
    cursor = conn.cursor()
    cursor.execute(f"SELECT userid, userpassword from users where username = '{username}'")
    results = cursor.fetchone()
    cursor.close()
    if results and results[1] == password:
        userid = results[0]
        session["user_id"] = userid
        session["username"] = username
        return redirect(url_for("home"))
    else:
        flash("Invalid Username or Password", "error")
        return redirect(url_for("landing"))
    


@app.route("/register", methods = ['GET', 'POST'])
def register():

    if request.method == 'GET':
        return render_template("register.html")

    username = request.form['username']
    email = request.form['email']
    password = request.form['password']
    confirmPass = request.form['confirmPass']
    if(password == confirmPass):
        cursor = conn.cursor()
        cursor.callproc("register_user", [username, password, email])
        flash("User registered successfully", "success")
        return render_template("register.html")
    else:
        flash("Passwords do not match", "error")
        return render_template("register.html")
    

@app.route("/logout")
def logout():
    session.pop('user_id', None)
    session.pop('username', None)
    return redirect(url_for('login'))

@app.route("/home", methods = ['GET'])
def home():
    if request.method == 'GET' and 'user_id' in session:
        userid = session.get("user_id")
        img_path = f"static/images/{userid}.jpg"
        if(os.path.exists(img_path)):
            picture_link = f"/static/images/{userid}.jpg"
        else:
            picture_link = "/static/images/Nexus.png"

        featured = random.sample(range(1, 24), 5)

        return render_template("home.html", picture_link=picture_link, featured=featured, userid = userid)
    else:
        return "No active sessions found. Please log in"
    
@app.route("/profile", methods = ['GET'])
def profile():
    if request.method == 'GET':
        username = session.get("username")
        userid = session.get("user_id")
        img_path = f"static/images/{userid}.jpg"
        if(os.path.exists(img_path)):
            picture_link = f"/static/images/{userid}.jpg"
        else:
            picture_link = "/static/images/Nexus.png"

        cursor = conn.cursor()
        cursor.execute(f"SELECT usercountry, TO_CHAR(datejoined, 'DD/MM/YYYY') FROM users WHERE userid = '{userid}'")
        results = cursor.fetchone()
        country = results[0]
        dateJoined = results[1]
        cursor.execute(f"SELECT COUNT(gameid), SUM(HOURSPLAYED) from userlibrary where userid = '{userid}'")
        results = cursor.fetchone()
        gameCount = results[0]
        hoursPlayed = results[1]
        cursor.close()

        if hoursPlayed is None:
            hoursPlayed = 0

        return render_template("profile.html", picture_link=picture_link, username = username, userid=userid,
                               country = country, dateJoined=dateJoined, gameCount=gameCount, hoursPlayed=hoursPlayed)


@app.route("/delete", methods=['GET', 'POST'])
def delete():
    if request.method == 'GET':
        if 'user_id' in session:
            return render_template("delete.html")
        else:
            return "Invalid Session"
        
    username = request.form['username']
    password = request.form['password']
    confirmPass = request.form['confirmPass']
    if(confirmPass == password):
        cursor = conn.cursor()
        cursor.execute(f"SELECT userid FROM users WHERE username = '{username}' AND userpassword = '{password}'")
        user = cursor.fetchone()
        if(not user):
            flash("Credentials do not match", "error")
            return render_template("delete.html")
        else:
            userid = user[0]
            cursor.execute(f"DELETE FROM USERS WHERE USERID = {userid}")
            return redirect(url_for("landing"))
    else:
        flash("Passwords do not match", "error")
        return render_template("delete.html")


@app.route("/edit", methods = ['GET', 'POST'])
def edit():
    if request.method == 'GET':
        return render_template("edit.html")
    
    userid = session.get("user_id")
    username = request.form["username"]
    email = request.form["email"]
    password = request.form["password"]
    country = request.form["country"]
    
    cursor = conn.cursor()
    cursor.execute(f"SELECT USERPASSWORD FROM USERS WHERE USERID = {userid}")
    results = cursor.fetchone()
    checkPass = results[0]
    if checkPass == password:
        cursor.callproc("update_user", [userid, username, email, country])
        session["username"] = username
        return redirect(url_for("profile"))
    else:
        flash("Incorrect Password", "error")
        return redirect(url_for("edit"))


@app.route("/store", methods = ['GET', 'POST'])
def store():
    if request.method == 'GET':
        if 'user_id' in session:
            userid = session.get("user_id")
            img_path = f"static/images/{userid}.jpg"
            query = request.args.get('query', '')
            cursor = conn.cursor()
            cursor.execute(f"SELECT gameid, gamename from game where LOWER(gamename) like LOWER('%{query}%')")
            results = cursor.fetchall()
            gameid = [game[0] for game in results]
            gamename = [game[1] for game in results]
            if(os.path.exists(img_path)):
                picture_link = f"/static/images/{userid}.jpg"
            else:
                picture_link = "/static/images/Nexus.png"
            return render_template("store.html", picture_link=picture_link, results=results, userid = userid)
        else:
            return "No active session found. Please log in"


@app.route("/game-page/<slug>", methods = ['GET', 'POST'])
def page(slug):
    if request.method == 'GET':
        if 'user_id' in session:
            userid = session.get("user_id")
            img_path = f"static/images/{userid}.jpg"
            if(os.path.exists(img_path)):
                picture_link = f"/static/images/{userid}.jpg"
            else:
                picture_link = "/static/images/Nexus.png"
            cursor = conn.cursor()
            cursor.execute(f"SELECT * FROM GAMESTORE where gameid = {slug}")
            row = cursor.fetchone()
            if row is not None:
                # Convert the row to a dictionary
                columns = [col[0] for col in cursor.description]  # Extract column names
                game_data = dict(zip(columns, row))  # Combine column names and row values
                cursor.execute(f"SELECT GAMEID FROM PURCHASES WHERE USERID = {userid}")
                result = cursor.fetchall()
                ownedGames = [i[0] for i in result]
                print(ownedGames)
                return render_template("game-page.html", picture_link=picture_link,
                                       gamedata=game_data, ceil = math.ceil, ownedGames=ownedGames, userid = userid)
            else:
                return "404 Not Found"

@app.route("/purchase/<game>", methods = ['GET', 'POST'])
def purchase(game):
    if request.method == 'GET':
        if 'user_id' in session:
            cursor = conn.cursor()
            cursor.execute(f"SELECT * FROM GAMESTORE where gameid = {game}")
            row = cursor.fetchone()
            if row is not None:
                columns = [col[0] for col in cursor.description]
                game_data = dict(zip(columns, row)) 
                return render_template("purchase.html", gamedata=game_data)
            else:
                return "404 Not Found"
        else:
            return "Invalid Session please log in"
        
@app.route("/transaction/<game>", methods=['POST'])
def transaction(game):
    if 'user_id' in session:
        userid = session.get("user_id")
        gameid = game
        cursor = conn.cursor()
        cursor.callproc("insert_purchases", [userid, gameid])
        cursor.callproc("add_userlibrary", [userid, gameid])
        return render_template("transaction.html")

@app.route("/library/<id>", methods = ['GET'])
def library(id):
    userid = session.get("user_id")
    username = session.get("username")
    img_path = f"static/images/{userid}.jpg"
    if(os.path.exists(img_path)):
        picture_link = f"/static/images/{userid}.jpg"
    else:
        picture_link = "/static/images/Nexus.png"
    if(str(userid) == id):
        cursor = conn.cursor()
        cursor.execute(f"SELECT gameid, gamename FROM USERGAMELIBRARY where USERID = {userid}")
        gamedetails = cursor.fetchall()
        cursor.execute("SELECT gameid, gamename from USERGAMELIBRARY where USERid = 1 AND TRUNC(DATEADDED) = TRUNC(SYSDATE)")
        recent = cursor.fetchall()
        if not recent:
            cursor.execute("SELECT gameid, gamename from USERGAMELIBRARY where USERid = 1 AND DATEADDED = (SELECT MAX(DATEADDED) FROM USERGAMELIBRARY where userid = 1)")
            recent = cursor.fetchall()
        return render_template("library.html", picture_link=picture_link, username=username,
                                gamedetails = gamedetails, recent = recent, userid=userid)
    else:
        return "Invalid Session"

@app.route("/support")
def support():
    return redirect("https://www.youtube.com/watch?v=dQw4w9WgXcQ")



if __name__ == "__main__":
    app.run(debug=True)

