SET SERVEROUTPUT ON;

DECLARE 
    v_media NUMBER(9,2) := 0;
BEGIN
    SELECT 
        AVG(sal) INTO v_media
        FROM emp;
    DELETE emp WHERE sal > v_media;
END;
/

SELECT COUNT(sal) FROM emp;
ROLLBACK;