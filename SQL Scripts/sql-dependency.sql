
-- triggers and sequences
CREATE SEQUENCE auto_increment
    START WITH 11
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

create or replace TRIGGER t_increment
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    :NEW.userid := auto_increment.NEXTVAL;
END;

CREATE SEQUENCE increment_purchase
    START WITH 11
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

create or replace TRIGGER purchase_increment
BEFORE INSERT ON purchases
FOR EACH ROW
BEGIN
    :NEW.purchaseid := auto_increment.NEXTVAL;
END;

--views
CREATE OR REPLACE VIEW GAMESTORE
AS
SELECT
G.GAMEID,
G.GAMENAME,
G.GENRE,
G.RELEASEDATE,
G.PRICE,
G.RATING,
G.GAMESIZE,
G.PUBLISHERID,
P.PUBLISHERNAME
FROM GAME G JOIN PUBLISHER P ON G.PUBLISHERID = P.PUBLISHERID;

CREATE OR REPLACE FORCE VIEW "NEXUS"."USERGAMELIBRARY" ("USERID", "USERNAME", "GAMEID", "GAMENAME", "DATEADDED", "HOURSPLAYED", "LASTPLAYED") AS 
  SELECT l.userid, u.username, l.gameid, g.gamename, l.dateadded, l.hoursplayed, l.lastplayed
    FROM userlibrary l JOIN users u ON l.userid = u.userid JOIN game g on l.gameid = g.gameid order by u.userid;


-- procedures
create or replace PROCEDURE add_userlibrary(
    p_userid IN NUMBER,
    p_gameid IN NUMBER
)AS
BEGIN
    INSERT INTO USERLIBRARY(USERID, GAMEID, DATEADDED, HOURSPLAYED, LASTPLAYED)
    VALUES(p_userid, p_gameid, sysdate, 0, sysdate);
    commit;
end;

create or replace PROCEDURE discount_games IS
CURSOR game_cursor IS SELECT GAMEID, GAMENAME, PRICE, RELEASEDATE FROM GAME;
v_gameid game.gameid%TYPE;
v_gamename game.gamename%TYPE;
v_price game.price%TYPE;
v_releaseDate game.releasedate%TYPE;
v_discountedPrice game.price%TYPE;

BEGIN
    OPEN game_cursor;
    LOOP
        FETCH game_cursor INTO v_gameid, v_gamename, v_price, v_releaseDate;
        EXIT WHEN game_cursor%NOTFOUND;

        if FLOOR(MONTHS_BETWEEN(SYSDATE, v_releaseDate)/12) = 0 then
            v_discountedPrice := v_price;
        elsif FLOOR(MONTHS_BETWEEN(SYSDATE, v_releaseDate)/12) >= 1 AND FLOOR(MONTHS_BETWEEN(SYSDATE, v_releaseDate)/12) <= 3 then
            v_discountedPrice := v_price * 0.7;
        elsif FLOOR(MONTHS_BETWEEN(SYSDATE, v_releaseDate)/12) >= 4 AND FLOOR(MONTHS_BETWEEN(SYSDATE, v_releaseDate)/12) <= 6 then
            v_discountedPrice := v_price * 0.5;
        else 
            v_discountedPrice := v_price * 0.2;  
        end if;

        dbms_output.put_line('id: ' || v_gameid || ' title: ' || v_gamename || ' price: ' || v_price || ' discounted price: ' || v_discountedPrice);
    END LOOP;
    CLOSE game_cursor;
END;

create or replace PROCEDURE INSERT_PURCHASES(
    p_userid IN NUMBER,
    p_gameid IN NUMBER
) AS
BEGIN
    INSERT INTO PURCHASES (USERID, GAMEID, PURCHASEDATE)
    VALUES (p_userid, p_gameid, SYSDATE);
    commit;
END;

create or replace PROCEDURE register_user (
    p_username IN VARCHAR2,
    p_userpassword IN VARCHAR2,
    p_useremail IN VARCHAR2
)
IS
BEGIN
    INSERT INTO users (username, USERPASSWORD, USEREMAIL, USERCOUNTRY, DATEJOINED)
    VALUES (p_username, p_userpassword, p_useremail, 'Malaysia', SYSDATE);

    COMMIT;
END;

create or replace PROCEDURE update_user (
    p_userid IN NUMBER,
    p_username IN VARCHAR2,
    p_useremail IN VARCHAR2,
    p_usercountry in VARCHAR2
)
IS
BEGIN
    UPDATE USERS
    SET username = p_username,
    USEREMAIL = p_useremail,
    USERCOUNTRY = p_usercountry
    WHERE USERID = p_userid;

    COMMIT;
END;
