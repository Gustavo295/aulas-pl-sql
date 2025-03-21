SET SERVEROUTPUT ON;

DECLARE
    v_maior emp.sal%TYPE := 0;
BEGIN
    SELECT MAX(sal) 
        INTO v_maior
        FROM emp;
    IF v_maior < 3000 THEN
        DBMS_OUTPUT.PUT_LINE('Salário Horrível!');
    ELSIF v_maior < 5000 THEN
        DBMS_OUTPUT.PUT_LINE('Salário continua horrível');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Não é tão ruim');
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
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('Você escolheu 10');
        WHEN 20 THEN DBMS_OUTPUT.PUT_LINE('Você escolheu 20');
        WHEN 30 THEN DBMS_OUTPUT.PUT_LINE('Você escolheu 30');
        WHEN 40 THEN DBMS_OUTPUT.PUT_LINE('Você escolheu 40');
        WHEN 50 THEN DBMS_OUTPUT.PUT_LINE('Você escolheu 50');
        WHEN 60 THEN DBMS_OUTPUT.PUT_LINE('Você escolheu 60');
    END CASE;
END;
/

ROLLBACK;

----------- EXERCICIOS --------------

/* 
1.	Crie um bloco PL/SQL para aceitar a entrada de um ano e verificar se ele é bissexto. 
Dica: O ano deverá ter divisão exata por 4, mas não por 100, ou deverá ser divisível por 400.

Teste sua solução usando a tabela a seguir. Por exemplo, se o ano informado for 1990, 
a saída deverá ser “1990 não é bissexto”.

*/

DECLARE
    v_ano NUMBER := &ano;
BEGIN
    IF MOD(v_ano,  4) != 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_ano || ' não é ano bissexto');
    ELSIF MOD(v_ano, 400) = 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_ano || ' é ano bissexto');
    ELSIF MOD(v_ano, 100) = 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_ano || ' não é ano bissexto');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_ano || ' é ano bissexto');
    END IF;
END;
/

ROLLBACK;

/*
2.	Crie um bloco PL/SQL para armazenar o salário mensal de um funcionário em uma variável de substituição (&). O bloco PL/SQL deve:
a.	Calcular o salário anual como salário * 12
b.	Calcular o bônus como indicado na seguinte tabela

Salário Anual	Bônus
Maior ou igual a 20.000	2.000
Entre 19.999 e 10.000	1.000
Menor ou igual a 9.999	500

c.	Exibir o valor do bônus no formato “O bônus é “ e o valor do bônus.

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
    DBMS_OUTPUT.PUT_LINE('Salário: R$' || v_sal);
    DBMS_OUTPUT.PUT_LINE('Salário Anual: R$' || v_sal_anual);
    DBMS_OUTPUT.PUT_LINE('Bônus: R$' || v_bonus);
    DBMS_OUTPUT.PUT_LINE('Valor anual + Bônus: R$' || v_sal_total);
END;
/

ROLLBACK;
