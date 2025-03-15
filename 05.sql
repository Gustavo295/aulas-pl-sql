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

---------- EXERCICIOS ----------

/* 
1)	Crie um bloco PL/SQL que selecione o maior código de departamento (DEPTNO) 
na tabela DEPT e armazene-o na variável v_max_deptno. Exiba o maior código de departamento.
*/

DECLARE 
	v_max_deptno NUMBER := 0;
BEGIN
	SELECT MAX(deptno)
	INTO v_max_deptno
	FROM dept 
	DBMS_OUTPUT.PUT_LINE(v_max_deptno)
END;
/

/*
2)	Modifique o bloco PL/SQL criado na etapa 1 para inserir um novo departamento na
tabela DEPT. O novo código de departamento deve ser o maior código de departamento (DEPTNO)
atual somado de 10, o nome do departamento (DNAME) deve ser Teste e a localização (LOC) 
do departamento deve ser NULL.
*/

DECLARE
   	v_max_deptno NUMBER := 0;
   	v_dept_name dept.dname%TYPE:= 'Teste';
   	v_dept_id dept.deptno%TYPE;
BEGIN
   	SELECT MAX(deptno) 
	INTO v_max_deptno
     	FROM dept;
   	v_dept_new_id := 10 + v_max_deptno;
   	INSERT INTO dept VALUES (v_dept_new_id, v_dept_name, NULL);
END;
/


/*
3)	Na etapa 2, LOC foi definido como NULL. Crie um bloco PL/SQL que atualiza LOC 
como “Rio” para o novo departamento.
*/

BEGIN
   UPDATE dept SET loc=’RIO’ WHERE deptno = 50;
END;
/
