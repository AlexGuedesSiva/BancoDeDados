</h1>Functions</h1>

As funções também são um tipo de programas armazenados no servidor e possuem características semelhantes aos procedimentos armazenados, porém com a exigência da especificação de um retorno de dado. Funções são chamadas procedures. Sua sintaxe é declarada no Quadro 2.9:

1. CREATE [OR REPLACE] FUNCTION nome_da_função

2. [( parameter1 [ mode1] datatype1,

3. parameter2 [ mode2] datatype2,

4. . . .)]

5. RETURN tipo_de_dado

6. IS|AS

7. Bloco PL/SQL;
Quadro 2.9 - Functions
Fonte: Elaborado pelo autor.

A diferença básica entre uma função e um procedimento é que functions , ao contrário das procedures , necessariamente têm de retornar ao menos um valor. Esse valor é retornado através da palavra reservada RETURN.

O Quadro 2.10 apresenta um exemplo de functions com a finalidade de aumentar o salário em 20%.

1. CREATE FUNCTION f(SAL DECIMAL(10,2)) RETURNS DECIMAL

2. BEGIN

3. RETURN SAL * 1.2;

4. END;


Quadro 2.10 – Exemplo de functions
Fonte: Elaborado pelo autor.

Um função pode ser chamada pelo comando CALL ou utilizando uma instrução SQL SELECT. Exemplo do quadro 10, call f(1000.00) ou select f(1000.00). A exclusão da function é realizada pelo comando DROP nome_function.

Tanto procedure quanto functions podem ser alteradas por meio do comando ALTER PROCEDURE | FUNCTION. É apresentada uma sintaxe básica no Quadro 2.11:

1. DROP PROCEDURE IF EXISTS sp_Country_UPDATE;

2. CREATE PROCEDURE sp_Country_UPDATE

3. ( IN p_CountryId int,

4. IN p_CountryName nvarchar(25),

5. IN p_CountryDescription nvarchar(25),

6. IN p_IsActive bit,

7. IN p_IsDeleted bit )

8. UPDATE

9. Country

10.   SET

11.   CountryName = p_CountryName ,

12.   CountryDescription=p_CountryDescription,

13.   IsActive= p_IsActive,

14.   IsDeleted=p_IsDeleted

15.   WHERE

16.   CountryId = p_CountryId ;


Quadro 2.11 – Alteração procedure ou functions
Fonte: Elaborado pelo autor.

Pequenas diferenças existem nos conceitos entre procedure x functions, que são:

funções podem ser executadas dentro de uma Stored Procedure. Mas uma Stored Procedure não pode ser executada dentro de uma função.;
nas funções, é possível usar em conjunto com as instruções SELECT, WHERE, HAVING, entretanto, nas procedures não é possível;
nas procedures, é permitido tratar exceções com try/catch, porém nas functions esse tratamento não é permitido;
pode-se utilizar Transaction Management em um procedure, mas não pode ser usada numa function;
característica da procedure é retenção no plano de execução. Já function é compilada toda vez que é invocada;
function pode ser incorporada numa instrução SQL SELECT; já na procedures esse procedimento não é permitido.
Algumas situações em que o uso de função pode ser a solução ideal incluem:

autenticação de usuários;
obtenção do perfil dos usuários;
envio de mensagens aos usuários de um banco de dados;
produção de dados complexos, que dependem da interação de diversos elementos do banco de dados;
obtenção de dados contextuais, tais como: data, hora, dia da semana etc.
Além dos procedimentos armazenados no banco de dados ( functions e procedures ), gatilhos ( trigger ) estão muito associados a regras de negócio. São também armazenados como objetos do banco de dados e considerados outro recurso importante. Esse é o tema do nosso próximo tópico de estudo.
