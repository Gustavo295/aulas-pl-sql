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

DECLARE 
    v_media NUMBER(9,2) := 0;
    v_conta NUMBER(5) := 0;
BEGIN
    SELECT 
        AVG(sal) INTO v_media
        FROM emp;
    UPDATE emp 
        SET sal = sal * 1.10
    WHERE sal < v_media;
    v_conta := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE(v_conta || 'Linhas atualizadas');
END;
/

SELECT COUNT(sal) FROM emp;
ROLLBACK;

DECLARE 
    v_maior NUMBER (9,2) := 0;
BEGIN
    SELECT 
        MAX(sal) INTO v_maior
        FROM emp;
    INSERT INTO emp(empno, sal)
    VALUES (4000, v_maior + 1000);
END;
/

SELECT * FROM emp WHERE empno = 4000;