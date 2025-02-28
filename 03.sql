SET SERVEROUTPUT ON

DECLARE
    v_nome emp.ename%TYPE := 'sai fora';
    v_valor NUMBER := 0;
    v_niver DATE := TO_DATE('10/05/2007', 'DD/MM/YYYY')
BEGIN
    v_valor := LENGTH(v_nome);
    DBMS_OUTPUT.PUT_LINE(v_nome || ' tem ' || v_valor || ' letras');
END;
/