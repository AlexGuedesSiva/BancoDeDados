-- Criar a view "view_estados" na tabela "estados"
CREATE VIEW view_estados AS
SELECT *
FROM estados;

-- Selecionar todos os estados da view
SELECT *
FROM view_estados;

-- Contar o número de estados da view
SELECT COUNT(*)
FROM view_estados;

-- Selecionar os estados da view com base em uma condição específica
SELECT *
FROM view_estados
WHERE regiao = 'Nordeste';

-- Agrupar os estados da view por região e contar o número de estados em cada região
SELECT regiao, COUNT(*)
FROM view_estados
GROUP BY regiao;

-- Atualizar dados através de uma view:
-- Você pode atualizar os dados em uma tabela subjacente através de uma view.
-- Por exemplo, para atualizar o nome de um estado na view "view_estados",
-- você poderia executar o seguinte comando:
UPDATE view_estados
SET nome = 'Rio Grande do Sul'
WHERE sigla = 'RS';

-- Excluir dados através de uma view:
-- Você também pode excluir dados em uma tabela subjacente através de uma view.
-- Por exemplo, para excluir um estado da view "view_estados",
-- você poderia executar o seguinte comando:
DELETE FROM view_estados
WHERE sigla = 'AC';
