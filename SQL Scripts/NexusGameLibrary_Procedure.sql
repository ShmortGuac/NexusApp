SET SERVEROUTPUT ON

-- Procedure for user registration

CREATE OR REPLACE PROCEDURE register_user (
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
/

-- Procedure for showing discounted games based on their release date

CREATE OR REPLACE PROCEDURE discount_games IS
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
/




begin
  register_user('username', 'password', 'user@gmail.com');
end;
/

begin
    discount_games;
end;
/