
SELECT * FROM estados;

SELECT sigla, nome as 'Nome do Estado' FROM estados
WHERE regiao = 'Sul';

SELECT nome as 'Nome do Estado', regiao as 'Região', populacao 'População'
from estados
WHERE populacao >= 10
ORDER BY populacao DESC;