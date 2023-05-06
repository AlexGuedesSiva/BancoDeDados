
<h1> Procedure </h1><br>
Em <strong>SQL</strong>, um procedure é um bloco de código SQL que é armazenado no banco de dados e pode ser chamado repetidamente. Ele pode aceitar parâmetros de entrada e retornar resultados.

Procedures são geralmente usados para automatizar tarefas comuns, como inserir dados em várias tabelas ao mesmo tempo, atualizar várias linhas em uma tabela com base em determinados critérios ou executar uma série de operações em sequência.

Ao usar procedures, é possível simplificar a lógica de negócios do aplicativo e aumentar a segurança, já que o código SQL é mantido no banco de dados e não precisa ser enviado pelo aplicativo toda vez que é necessário executá-lo.

Quando uma procedure é criada, realmente é armazenada no banco de dados, mas também todas as funções e sub-rotinas dessa procedure , que fica disponível para ser invocada, quando for necessário. A sintaxe básica de construção de uma procedure é apresentada no Quadro 2.7:

1. CREATE [OR REPLACE] PROCEDURE [schema.]nome_da_procedure

2. [(parâmetro1 [modo1] tipodedado1,

3. parâmetro2 [modo2] tipodedado2,

4. ...)]

5. IS|AS

6. Bloco PL/SQL
<br>


<strong>Quadro 2.7 – Sintaxe de procedure<br></strong>

REPLACE – caso a procedure já tenha sido criada, substitua por essa;

BLOCO PL/SQL – inicia com BEGIN e termina com END;

NOME_DA_PROCEDURE – o nome da procedure;

PARÂMETRO – indica o nome da variável que é passada na chamada da procedure ou retornada ou ambos (passada e retornada). O parâmetro MODO determina entrada ou retorno ou ambos;

MODO – parâmetro é de entrada (IN), saída (OUT) ou ambos (IN OUT). Por padrão, sem qualquer especificação de MODO, será, automaticamente, IN;

TIPODEDADO – o tipo de dado. Uso de %TYPE, %ROWTYPE como referências ou qualquer tipo de dado escalar ou composto. Atenção: sem restrição de tamanho de tipo de dados.

IS|AS – a sintaxe do comando aceita tanto IS como AS.

Esses procedimentos podem ter variações entre alguns bancos de dados na forma declarativa da instrução SQL. O Quadro 2.8 apresenta um exemplo de declarações de procedimento.

1. CREATE OR REPLACE PROCEDURE sal_aumento (p_id_emp IN emp.id_emp%TYPE) IS

2. BEGIN

3. UPDATE

4. pedro.emp

5. SET

6. sal = sal * 1.20

7. WHERE

8. id_emp = p_id_emp;

9. END sal_aumento;
<br>


<strong>Quadro 2.8 – Procedure</strong>

No exemplo do Quadro 2.8, a finalidade da procedure é promover um aumento salarial ao funcionário Pedro de 20%. Na linha 1, a definição da procedure com definição de parâmetros de modo IN. Logo em seguida, a instrução de atualização do registro com a instrução SQL (UPDATE) e passagem de parâmetro na chamada procedure .

A chamada de uma procedure é feita pelo comando CALL ou EXEC sal_aumento (12);. Caso queira excluir um procedimento, utilize o comando DROP nome_PROCEDURE.