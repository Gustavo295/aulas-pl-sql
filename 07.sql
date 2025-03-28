SET SERVEROUTPUT ON
DECLARE
    CURSOR c_emp IS
        SELECT ename, sal FROM emp;
    v_ename emp.ename%TYPE;
    v_sal emp.sal%TYPE := 0;
BEGIN
    OPEN c_emp;
    FETCH c_emp INTO v_ename, v_sal;
    DBMS_OUTPUT.PUT_LINE(v_ename || ' tem o salário de R$' || v_sal);
    FETCH c_emp INTO v_ename, v_sal;
    DBMS_OUTPUT.PUT_LINE(v_ename || ' tem o salário de R$' || v_sal);
END;
/

DECLARE
    CURSOR c_emp IS
        SELECT ename, sal FROM emp;
    v_ename emp.ename%TYPE;
    v_sal emp.sal%TYPE := 0;
BEGIN
    OPEN c_emp;
    LOOP
        FETCH c_emp INTO v_ename, v_sal;
        EXIT WHEN c_emp%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_ename || ' tem o salário de R$' || v_sal);
    END LOOP;
    CLOSE c_emp;
END;
/

DECLARE
    CURSOR c_emp IS
        SELECT ename, sal FROM emp;
    v_ename emp.ename%TYPE;
    v_sal emp.sal%TYPE := 0;
    v_sal_anual NUMBER(7,2) := 0;
BEGIN
    OPEN c_emp;
    LOOP
        FETCH c_emp INTO v_ename, v_sal;
        v_sal_anual := v_sal * 12;
        EXIT WHEN c_emp%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_ename || ' tem o salário anual de R$' || v_sal_anual);
    END LOOP;
    CLOSE c_emp;
END;
/

DECLARE
    CURSOR c_emp IS
        SELECT ename, sal FROM emp;
    v_record c_emp%ROWTYPE;
BEGIN
    OPEN c_emp;
    LOOP
        FETCH c_emp INTO v_record;
        EXIT WHEN c_emp%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_record.ename || ' tem o salário de R$' || v_record.sal);
    END LOOP;
    CLOSE c_emp;
END;
/

DECLARE
    CURSOR c_emp IS
        SELECT ename, sal, sal * 1.10 novo FROM emp;
    v_record c_emp%ROWTYPE;
BEGIN
    OPEN c_emp;
    LOOP
        FETCH c_emp INTO v_record;
        EXIT WHEN c_emp%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_record.ename || ' tem o salário de R$' || v_record.sal);
        DBMS_OUTPUT.PUT_LINE('O novo salário é de R$' || v_record.novo);
    END LOOP;
    CLOSE c_emp;
END;
/

DECLARE
    CURSOR c_emp IS
        SELECT ename, sal, sal * 1.10 novo FROM emp;
BEGIN
    FOR v_record IN c_emp
    LOOP
        DBMS_OUTPUT.PUT_LINE(v_record.ename || ' tem o salário de R$' || v_record.sal);
        DBMS_OUTPUT.PUT_LINE('O novo salário é de R$' || v_record.novo);
    END LOOP;
END;
/

BEGIN
    FOR v_record IN (SELECT ename, sal, sal * 1.10 novo FROM emp)
    LOOP
        DBMS_OUTPUT.PUT_LINE(v_record.ename || ' tem o salário de R$' || v_record.sal);
        DBMS_OUTPUT.PUT_LINE('O novo salário é de R$' || v_record.novo);
    END LOOP;
END;
/

----------- EXERCICIOS ------------
CREATE TABLE emps AS SELECT * FROM emp WHERE 1 = 2;

/*
3.	Usando o atributo ROWTYPE faça um bloco PL/SQL que leia os dados do 
funcionário de nome (ENAME) MILLER da tabela EMP e insira todos os seus dados 
na  tabela EMPS
*/

DECLARE
    v_emp_record   emp%ROWTYPE;
BEGIN
    SELECT * INTO v_emp_record FROM emp
        WHERE  ename = ‘MILLER’;
    INSERT INTO emps
        (empno, ename, job, mgr,  hiredate, sal, comm, deptno)  
    VALUES 
        (v_emp_record.empno, v_emp_record.ename, v_emp_record.job, v_emp_record.mgr,  v_emp_record.hiredate, v_emp_record.sal,  v_emp_record.comm, v_emp_record.deptno);
    SELECT * FROM emps;
END;
/



