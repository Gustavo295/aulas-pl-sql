1.	Avalie cada uma das declarações a seguir. Determine quais delas não são legais e explique por quê.

a. 	DECLARE v_id 	NUMBER(4);
b. 	DECLARE v_x, v_y, v_z 	VARCHAR2(10);
c. 	DECLARE v_birthdate 	DATE NOT NULL;
d. 	DECLARE v_in_stock 	BOOLEAN := 1;

2.	Em cada uma das seguintes atribuições, determine o tipo de dados da expressão resultante.

a)	v_days_to_go := v_due_date - SYSDATE;
b)	v_sender := USER || ': ' || TO_CHAR(v_dept_no);
c)	v_sum := $100,000 + $250,000;
d)	v_flag := TRUE;
e)	v_n1 := v_n2 > (2 * v_n3);
f)	v_value := NULL;

3.	Crie um bloco anônimo para a saída da frase "My PL/SQL Block Works" na tela.

G_MESSAGE
-----------------------
My PL/SQL Block Works

4.	Crie um bloco que declare duas variáveis e exiba na tela o conteúdo dessas duas variáveis. A primeira variável deve conter o texto “It’s Friday” e a segunda variável deve conter o valor numérico 42.
