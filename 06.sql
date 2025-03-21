SET SERVEROUTPUT ON;

DECLARE
    v_maior emp.sal%TYPE := 0;
BEGIN
    SELECT MAX(sal) 
        INTO v_maior
        FROM emp;
    IF v_maior < 3000 THEN
        DBMS_OUTPUT.PUT_LINE('Sal�rio Horr�vel!');
    ELSIF v_maior < 5000 THEN
        DBMS_OUTPUT.PUT_LINE('Sal�rio continua horr�vel');
    ELSE
        DBMS_OUTPUT.PUT_LINE('N�o � t�o ruim');
    END IF;
END;
/

ROLLBACK;

DECLARE
    v_maior emp.sal%TYPE := 0;
    v_emp emp.empno%TYPE := 0;
    v_cont NUMBER := 1;
BEGIN
    SELECT 
        MAX(sal), MAX(empno)
        INTO v_maior, v_emp
        FROM emp;
    IF v_maior > 3000 THEN
        LOOP
            INSERT INTO emp (empno, sal)
            VALUES (v_emp + v_cont, v_maior);
            v_cont := v_cont + 1;
        EXIT WHEN v_cont > 4;
        END LOOP;
    END IF;
END;
/

ROLLBACK;

DECLARE
    v_maior emp.sal%TYPE := 0;
    v_emp emp.empno%TYPE := 0;
    v_cont NUMBER := 1;
BEGIN
    SELECT 
        MAX(sal), MAX(empno)
        INTO v_maior, v_emp
        FROM emp;
    IF v_maior > 3000 THEN
        WHILE v_cont < 5 LOOP
            INSERT INTO emp (empno, sal)
            VALUES (v_emp + v_cont, v_maior);
            v_cont := v_cont + 1;
        END LOOP;
    END IF;
END;
/

ROLLBACK;

DECLARE
    v_maior emp.sal%TYPE := 0;
    v_emp emp.empno%TYPE := 0;
BEGIN
    SELECT 
        MAX(sal), MAX(empno)
        INTO v_maior, v_emp
        FROM emp;
    IF v_maior > 3000 THEN
        FOR i IN 1..4 LOOP
            INSERT INTO emp (empno, sal)
            VALUES (v_emp + i, v_maior);
        END LOOP;
    END IF;
END;
/

ROLLBACK;

DECLARE
    v_deptno emp.deptno%TYPE := &numero;
BEGIN
    CASE v_deptno
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('Voc� escolheu 10');
        WHEN 20 THEN DBMS_OUTPUT.PUT_LINE('Voc� escolheu 20');
        WHEN 30 THEN DBMS_OUTPUT.PUT_LINE('Voc� escolheu 30');
        WHEN 40 THEN DBMS_OUTPUT.PUT_LINE('Voc� escolheu 40');
        WHEN 50 THEN DBMS_OUTPUT.PUT_LINE('Voc� escolheu 50');
        WHEN 60 THEN DBMS_OUTPUT.PUT_LINE('Voc� escolheu 60');
    END CASE;
END;
/

ROLLBACK;

----------- EXERCICIOS --------------

/* 
1.	Crie um bloco PL/SQL para aceitar a entrada de um ano e verificar se ele � bissexto. 
Dica: O ano dever� ter divis�o exata por 4, mas n�o por 100, ou dever� ser divis�vel por 400.

Teste sua solu��o usando a tabela a seguir. Por exemplo, se o ano informado for 1990, 
a sa�da dever� ser �1990 n�o � bissexto�.

*/

DECLARE
    v_ano NUMBER := &ano;
BEGIN
    IF MOD(v_ano,  4) != 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_ano || ' n�o � ano bissexto');
    ELSIF MOD(v_ano, 400) = 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_ano || ' � ano bissexto');
    ELSIF MOD(v_ano, 100) = 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_ano || ' n�o � ano bissexto');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_ano || ' � ano bissexto');
    END IF;
END;
/

ROLLBACK;

/*
2.	Crie um bloco PL/SQL para armazenar o sal�rio mensal de um funcion�rio em uma vari�vel de substitui��o (&). O bloco PL/SQL deve:
a.	Calcular o sal�rio anual como sal�rio * 12
b.	Calcular o b�nus como indicado na seguinte tabela

Sal�rio Anual	B�nus
Maior ou igual a 20.000	2.000
Entre 19.999 e 10.000	1.000
Menor ou igual a 9.999	500

c.	Exibir o valor do b�nus no formato �O b�nus � � e o valor do b�nus.

*/

DECLARE
    v_sal NUMBER(7,2) := &salario_mensal;
    v_sal_anual NUMBER(7,2) := 0;
    v_bonus NUMBER(7,2) := 0;
    v_sal_total NUMBER(7,2) := 0;
BEGIN
    v_sal_anual := v_sal * 12;
    CASE
        WHEN v_sal_anual < 10000 THEN v_bonus := 500;
        WHEN v_sal_anual >= 10000 AND v_sal_anual < 20000 THEN v_bonus := 1000;
        WHEN v_sal_anual >= 20000 THEN v_bonus := 2000;
    END CASE;
    v_sal_total := v_sal_anual + v_bonus;
    DBMS_OUTPUT.PUT_LINE('Sal�rio: R$' || v_sal);
    DBMS_OUTPUT.PUT_LINE('Sal�rio Anual: R$' || v_sal_anual);
    DBMS_OUTPUT.PUT_LINE('B�nus: R$' || v_bonus);
    DBMS_OUTPUT.PUT_LINE('Valor anual + B�nus: R$' || v_sal_total);
END;
/

ROLLBACK;
