<h1>Criando Views</h1><br>


Virtualizações são criadas com o comando de instrução DDL (Data Definition Language) CREATE VIEW. Essa View pode ser criada com base em uma única tabela, múltiplas tabelas outras Views. A sintaxe básica de uma View é apresentada no exemplo de código a seguir (Quadro 2.1):

1. CREATE VIEW [nome_View]

2. AS

3. [instrução SQL]

4. [with cascade] [local] [check option]
Quadro 2.1 - Criando View
<br>


Na linha um, há o comando DDL de criação da View e o nome atribuído a essa visão. Na linha dois, há a palavra reservada AS (como), a linha três representa a instrução SQL SELECT em si. Views podem ser exploradas de diferentes maneiras. Esse processo dependerá da necessidade da visualização do negócio.

<strong>A seguir, exemplos de códigos utilizando Views.</strong>


O código do Quadro 2.2 apresenta uma simples consulta a uma tabela intitulada como ALUNO, cujo objetivo é extrair todas as informações da tabela.

1. CREATE VIEW v_aluno

2. AS

3. SELECT * FROM aluno;
<br>
Quadro 2.2 - Consulta múltiplas
<h3> Fonte: Elaborado pelo autor </h3>

Mas podem ser, também, extraídos dados de uma ou mais tabelas e apresentados no Quadro 3. Nesse script, a consulta está sendo realizada em duas tabelas: a tabela de empregado e a tabela de pagamento de empregados.

1. CREATE VIEW v_emp_relatorio

2. AS

3. SELECT E.emp_id, E.nome, E.email, P.cargo, P.data_contratacao, P.sal

4. FROM

5. empregado AS E, pagamento_e AS P

6. WHERE

7. E.emp_id = P.emp_id;
<br>


Quadro 2.3 – Consulta a múltiplas tabelas<br>

Uma virtualização pode ser criada com base em outras visualizações, por meio de uma instrução SQL e a sua sintaxe apresentada no Quadro 2.4:

1. CREATE VIEW v_emp_relatorio

2. AS

3. SELECT * FROM VIEW
<br>
Quadro 2.4 – Views de Views <br>
<h3>Fonte: Elaborado pelo autor.</h3>

Não crie visualizações com muita profundidade, porque pode afetar a gerenciabilidade das visualizações, pois esse problema é decorrente do cascateamento de Views. Por exemplo, suponha que você tenha uma View2, baseada numa View1 e uma terceira View3 cujas informações foram extraídas da View2. Caso a primeira View seja excluída, as visualizações 2 e 3 não servirão mais, porquanto as dependências relativas a View1 estarão destruídas.

Apagando Views
O comando SQL DROP apaga um View. Sinônimo de excluir, a palavra ‘DROPAR’ é comumente usada por profissionais da área, ou seja, quando se deseja falar “apague ou exclua uma View”, faça uso do termo “DROPE a View”. A sintaxe do comando é simples e apresentada no Quadro 2.5:

1. DROP View nome_view 
<br>
Quadro 2.5 – Exclusão de View<br>

Importante: o comando DROP possui duas opções: RESTRICT e CASCADE. No uso da palavra RESTRICIT, ao apagar uma View (DROP VIEW) e qualquer outra visualização for referenciada à restrição, o comando DROP gera um erro. Ao contrário, no uso do comando DROP VIEW com a opção CASCADE, a instrução é executada com sucesso.

Invocando Views
As Views criadas e armazenadas num banco de dados podem ser chamadas ou invocadas exatamente como é denominada uma tabela, por meio do comando SELECT. O Quadro 2.6 apresenta a sintaxe básica de chamada de uma View.

1. SELECT * FROM nome_View
<br>
Quadro 2.6 - Chamando view <br>


A cláusula de filtro como WHERE pode ser usada na chamada de uma View, porém, para melhor desempenho, a sugestão é usar a cláusula nas instruções SELECT que formam a VIEW (PLEW; STEPHENS, 2000).

Além das Views de banco de dados, procedimentos armazenados são objetos do banco de dados fundamentais e considerados outro recurso importante. Este é o tema do nosso próximo tópico de estudo.

<strong> <h4> AutorRepositório: Alex Wilson Guedes Da Silva </h4><strong> <br>
<ref> Praticas de Banco de Dados </ref><br>
<ref> AutorConteúdo: Me. Paulo Sérgio Pádua de Lacerda </ref>
