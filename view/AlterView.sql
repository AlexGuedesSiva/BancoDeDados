-- Adicionar uma nova coluna na view de todos os estados:
ALTER VIEW view_estados_todos
ADD COLUMN nova_coluna text;

-- Alterar a condição de filtragem na view de estados do Norte para selecionar apenas os estados com mais de 1 milhão de habitantes:
ALTER VIEW view_estados_norte
AS SELECT *
FROM estados
WHERE regiao = 'Norte' AND populacao > 1000000;

-- Renomear a view de estados do Nordeste para "view_estados_nordeste_2023":
ALTER VIEW view_estados_nordeste
RENAME TO view_estados_nordeste_2023;

-- Adicionar uma coluna calculada na view de estados do Centro-Oeste:
ALTER VIEW view_estados_centro_oeste
AS SELECT *, populacao / area AS densidade_populacional
FROM estados
WHERE regiao = 'Centro-Oeste';

-- Modificar a view de estados do Sudeste para selecionar apenas os estados com IDH acima de 0,85:
ALTER VIEW view_estados_sudeste
AS SELECT *
FROM estados
WHERE regiao = 'Sudeste' AND idh > 0.85;

-- Alterar a view de estados do Sul para selecionar apenas os estados com área entre 100.000 km² e 200.000 km²:
ALTER VIEW view_estados_sul
AS SELECT *
FROM estados
WHERE regiao = 'Sul' AND area BETWEEN 100000 AND 200000;

-- Adicionar uma coluna calculada na view de estados populosos:
ALTER VIEW view_estados_populosos
AS SELECT *, populacao / 1000000 AS populacao_milhoes
FROM estados
WHERE populacao > 10000000;

-- Modificar a view de estados com IDH alto para selecionar apenas os estados do Nordeste e Sudeste:
ALTER VIEW view_estados_idh_alto
AS SELECT *
FROM estados
WHERE idh > 0.8 AND (regiao = 'Nordeste' OR regiao = 'Sudeste');

-- Adicionar uma nova coluna na view de estados grandes, indicando se o estado é predominantemente urbano ou rural:
ALTER VIEW view_estados_grandes
AS SELECT *, CASE WHEN populacao / area > 100 ELSE 'Rural' END AS urbano_rural
FROM estados
WHERE area > 500000;

-- Modificar a view de estados com litoral para ordenar os estados por tamanho de litoral:
ALTER VIEW view_estados_litoral
AS SELECT *
FROM estados
WHERE litoral = 'Sim'
ORDER BY tamanho_litoral DESC;