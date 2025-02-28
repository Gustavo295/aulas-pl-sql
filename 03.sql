SET SERVEROUTPUT ON
/*
DECLARE
    v_nome emp.ename%TYPE := 'calabreso';
    v_valor NUMBER := 0;
    v_niver DATE := TO_DATE('&NASCIMENTO', 'DD/MM/YYYY');
BEGIN
    v_valor := LENGTH(v_nome);
    DBMS_OUTPUT.PUT_LINE(v_nome || ' tem ' || v_valor || ' letras');
    DBMS_OUTPUT.PUT_LINE('Você nasceu dia ' || TO_CHAR(v_niver, 'DD'));
    DBMS_OUTPUT.PUT_LINE('Era uma ' || TO_CHAR(v_niver, 'day'));
    DBMS_OUTPUT.PUT_LINE(v_niver);
    v_valor := ROUND(MONTHS_BETWEEN(SYSDATE, v_niver),2);
    DBMS_OUTPUT.PUT_LINE('Você viveu ' || v_valor || ' meses');
END;
/
*/

/*
DECLARE
    v_nome emp.ename%TYPE := 'calabreso';
    v_valor NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_nome); -- VAI EXIBIR calabreso
    SELECT ename, sal 
    INTO v_nome, v_valor
    FROM emp
    WHERE sal > 3000;
    DBMS_OUTPUT.PUT_LINE(v_nome); -- EXIBIR KING
    DECLARE
        v_nome VARCHAR2(30) := 'Maria';
    BEGIN
        v_valor := v_valor + 1;
        DBMS_OUTPUT.PUT_LINE(v_nome); -- EXIBIR Maria
    END;
    DBMS_OUTPUT.PUT_LINE(v_nome); -- EXIBIR KING
END;
/
*/

---------------------------------------------------------------
-- EXERCICIOS

/*
-- Exercicio 1
DECLARE 
    v_weight NUMBER (3) : = 600; 
    v_message VARCHAR2 (255) : = 'Product 10012'; 
BEGIN 
    DECLARE 
        v_weight NUMBER(3) := 1; 
        v_message VARCHAR2 (255) := 'Product 11001'; 
        v_new_locn VARCHAR2 (50) := 'Europe'; 
    BEGIN 
        v_weight := v_weight + 1; 
        v_new_locn := 'Western' || v_new_locn; 
        -- posição 1
    END; 
    v_weight := v_weight + 1; 
    v_message := v_message || 'is in stock'; 
    v_new_locn := 'Western' || v_new_locn; 
    -- posição 2
END; 
/
*/

-- V = certo | F = errad
/*
1)	Avalie o bloco PL/SQL anterior e determine o tipo de dados e o valor de cada uma das variáveis a seguir, de acordo com as regras de escopo.
a) O valor de v_weight na posição 1 é: 2 (V)
b) O valor de v_new_locn na posição 1 é: Western Europe (V)
c) O valor de v_weight na posição 2 é: 601 (V)
d) O valor de v_message na posição 2 é:  Product 10012 is in stock (V)
e) O valor de v_new_locn na posição 2 é: Western (F) R: Inválido
*/

/*
-- Exercicio 2
DECLARE 
    v_customer VARCHAR2 (50) : = 'Womansport'; 
    v_credit_rating VARCHAR2 (50) : = 'EXCELLENT'; 
BEGIN 
    DECLARE 
    v_customer NUMB NUMBER (7) := 201; 
    v name VARCHAR2 (25) := 'Unisports'; 
    BEGIN 
    v_credit_rating:='GOOD'; 
    END; 
END;
/
*/

/*
2)	No bloco PL/SQL acima, determine os valores e tipos de dados para cada um dos
seguintes casos:
a) O valor de v_customer no bloco aninhado é: 201 (V)
b) O valor de v_name no bloco aninhado é: Unisports (V)
c) O valor de v_credit_rating no bloco aninhado é: GOOD (V)
d) O valor de v_customer no bloco principal é: Womansport (V)
e) O valor de v_name no bloco principal é: inválido (V)
f) O valor de v_credit_rating no bloco principal é: Excellent (V)
*/

/* 3)	Examine o código abaixo e faça as alterações necessárias para que  
ele funcione como um bloco PL/SQL anônimo. A coluna ENAME contêm o primeiro 
nome do funcionário, a coluna SAL contêm o salário do funcionário e a coluna 
EMPNO contêm o código do funcionário. A tabela EMP é a tabela que contêm os dados 
do funcionário.*/

/*
DECLARE
    v_name emp.ename%TYPE := '';
    v_sal emp.sal%TYPE := 0;
BEGIN
    SELECT ename, sal INTO v_name, v_sal   
    FROM emp
    WHERE empno=7369;
END;
/
*/

/*4)	Altere o programa para exibir o primeiro nome e salário do funcionário 7369
no formato “SMITH recebe o salario de 800”.*/
/*
DECLARE
    v_name emp.ename%TYPE := '';
    v_sal emp.sal%TYPE := 0;
BEGIN
    SELECT ename, sal INTO v_name, v_sal   
    FROM emp
    WHERE empno=7369;
    DBMS_OUTPUT.PUT_LINE(v_name || ' recebe o salário de ' || v_sal);
END;
/
*/