SET SERVEROUTPUT ON

DECLARE 
    v_nome emp.ename%TYPE := 'Ana';
BEGIN   
    SELECT ename INTO v_nome 
        FROM emp;
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Sugiro que use um cursor');
        ROLLBACK;   
END;
/

DECLARE 
    v_nome emp.ename%TYPE := 'Ana';
BEGIN   
    SELECT ename INTO v_nome 
        FROM emp WHERE ename = 'Bia';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum dado encontrado');
    ROLLBACK;   
    
END;
/

DECLARE 
    v_nome emp.ename%TYPE := 'Ana';
    v_num NUMBER := 0;
BEGIN   
    SELECT sal/0 INTO v_num
        FROM emp WHERE ename = 'KING';
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Não dá pra dividir número por 0');
    ROLLBACK;   
END;
/

DECLARE 
    v_nome emp.ename%TYPE := 'Ana';
    v_num NUMBER := 0;
BEGIN   
    SELECT sal/0 INTO v_num
        FROM emp WHERE ename = 'KING';
    SELECT sal/0 INTO v_num
        FROM emp WHERE ename = 'Ana';
    SELECT ename INTO v_nome 
        FROM emp WHERE ename = 'Bia';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro d++');
    ROLLBACK;   
END;
/

CREATE TABLE erros
    (USUARIO varchar2 (30),
    data date,
    erro number,
    msg varchar2(255)
);

DECLARE
    v_num NUMBER := 0;
    v_erro NUMBER;
    v_msg VARCHAR2(255);
BEGIN
    SELECT sal/0 INTO v_num
        FROM emp WHERE ename = 'KING';
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_erro := SQLCODE;
        v_msg := SQLERRM;
        INSERT INTO erros VALUES(USER, SYSDATE, v_erro, v_msg);
        COMMIT;
END;
/

SELECT * FROM erros;

DECLARE
    v_num NUMBER;
    e_departamento EXCEPTION;
BEGIN
    UPDATE emp SET sal = sal * 2 WHERE deptno = 99;
    IF SQL%NOTFOUND THEN
        RAISE e_departamento;
    END IF;
EXCEPTION
    WHEN e_departamento THEN
        DBMS_OUTPUT.PUT_LINE('Não existe esse departamento');
END;
/

DECLARE
    v_num NUMBER;
    e_departamento EXCEPTION;
BEGIN
    UPDATE emp SET sal = sal * 2 WHERE deptno = 99;
    IF SQL%NOTFOUND THEN
        RAISE_APPLICATION_ERROR (-20202);
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR (-20203);
END;
/