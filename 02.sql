SET SERVEROUTPUT ON
/
DECLARE
    v_nome emp.ename%TYPE := 'Ender Dragon';
    v_sal emp.ename%TYPE;
    v_hoje DATE := SYSDATE;
    v_agora v_hoje%TYPE := SYSDATE + 1;
BEGIN
    -- DBMS_OUTPUT.PUT_LINE(v_nome || ' tem' || TO_CHAR(v_sal,'9999.00') || 'Kg' || v_hoje);
    DBMS_OUTPUT.PUT_LINE(v_nome || v_sal|| v_hoje);
    SELECT ename, sal
    INTO v_nome, v_sal
    FROM emp
    WHERE sal > 3000;
    v_hoje := v_hoje + 69;
    DBMS_OUTPUT.PUT_LINE(v_hoje);
END;
/    