SET SERVEROUTPUT ON

-- CRIANDO UMA FUNÇÃO
CREATE OR REPLACE FUNCTION pega_sal
    (p_id IN emp.empno%TYPE) RETURN NUMBER IS
    v_sal emp.sal%TYPE := 0;
BEGIN
    SELECT sal
    INTO v_sal
    FROM emp
    WHERE empno = p_id;
    RETURN v_sal;
END pega_sal;
/

-- EXIBINDO O SALÁRIO DO ID 7369
EXECUTE DBMS_OUTPUT.PUT_LINE(pega_sal(7369));

DECLARE
    v_sal emp.sal%TYPE;
BEGIN   
    v_sal := pega_sal(7369);
    DBMS_OUTPUT.PUT_LINE('O Salário é: ' || v_sal);
END;
/

SELECT pega_sal(7369) from dual;

SELECT pega_sal(empno) from emp;


-- FUNÇÃO DE TAXA PARA OS FUNCIONARIOS
CREATE OR REPLACE FUNCTION taxa(p_value IN NUMBER)
	RETURN NUMBER IS
BEGIN
    RETURN (p_value * 0.08);
END taxa;
/

-- verificando apenas os funcionarios do departamento 10
SELECT 
    empno, 
    ename, 
    sal,
    taxa(sal)
FROM emp
WHERE deptno = 10;

-- parametros
CREATE OR REPLACE FUNCTION f(
    p_parameter_1 IN NUMBER DEFAULT 1,
    p_parameter_5 IN NUMBER DEFAULT 5)
RETURN NUMBER IS
    v_var NUMBER;
BEGIN
    v_var := p_parameter_1 + (p_parameter_5 * 2);
    RETURN v_var;
END f;
/

-- passando os diferentes valores para o parametro
-- vazio = passa os numeros no default
SELECT f() FROM dual;

-- apenas um valor = passa a primeira variavel
SELECT f(2) FROM dual;

-- passando todos os valores = na ordem
SELECT f(2, 10) FROM dual;

-- passando parametros especificos a partir do 2º
SELECT f(p_parameter_5 => 10) FROM dual;
