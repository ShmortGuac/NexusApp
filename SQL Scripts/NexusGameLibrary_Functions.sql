SET SERVEROUTPUT ON

-- FUNCTION TO FIND THE MOST PLAYED GAME OF A CERTAIN USER

CREATE OR REPLACE FUNCTION MostPlayed(v_user_id IN NUMBER)
RETURN VARCHAR2 IS
    v_mostPlayed VARCHAR2(255);
BEGIN
    -- Query to get the most played game for the given user
    SELECT GAMENAME INTO v_mostPlayed
    FROM (
        SELECT * 
        FROM USERLIBRARY L 
        JOIN GAME G ON L.GAMEID = G.GAMEID 
        WHERE USERID = v_user_id  -- Use the parameter v_user_id
        ORDER BY L.HOURSPLAYED DESC
    )
    WHERE ROWNUM = 1;

    RETURN v_mostPlayed;
END;
/


-- FUNCTION CALL OF MostPlayed()

ACCEPT user_id PROMPT 'Enter the user ID: '
DECLARE 
    v_user_id   NUMBER;
    v_mostPlayed VARCHAR2(255);
BEGIN
    v_user_id := &user_id;
    v_mostPlayed := MostPlayed(v_user_id);
    DBMS_OUTPUT.PUT_LINE('Most played game for user ' || v_user_id || ' is ' || v_mostPlayed);
END;
/



-- FUNCTION TO FIND THE TOTAL SPENT ON GAME PURCHASES OF A CERTAIN USER
CREATE OR REPLACE FUNCTION TotalSpent(v_user_id IN NUMBER)
RETURN NUMBER IS
    v_totalSpent NUMBER;
BEGIN 
    SELECT SUM(PRICE) INTO v_totalSpent FROM PURCHASES P JOIN GAME G ON P.GAMEID = G.GAMEID WHERE P.USERID = v_user_id;
RETURN v_totalSpent;
END;
/

-- FUNCTION CALL OF TotalSpent()

ACCEPT user_id PROMPT 'Enter the user ID: '
DECLARE 
    v_user_id   NUMBER;
    v_totalSpent NUMBER;
BEGIN
    v_user_id := &user_id;
    v_totalSpent := TotalSpent(v_user_id);
    DBMS_OUTPUT.PUT_LINE('Total Spent for user ' || v_user_id || ' is RM ' || v_totalSpent );
END;
/
