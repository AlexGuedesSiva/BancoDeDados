<h1>Primeiro, vamos criar um banco de dados chamado "minha_loja": </h1>
<br>


<strong>CREATE DATABASE</strong> minha_loja;<br>


<h3><strong>Em seguida, vamos criar duas tabelas:</strong><br>
    uma tabela de "produtos" e uma tabela de "pedidos".</h3><br>



<strong>A tabela "produtos" pode ter os seguintes campos:</strong>

id (INT, chave primária)<br>
nome (VARCHAR)<br>
preco (DECIMAL)<br>
estoque (INT)<br>

<strong>A tabela "pedidos" pode ter os seguintes campos:</strong>

id (INT, chave primária)<br>
data (DATE)<br>
cliente (VARCHAR)<br>
produto_id (INT)<br>
quantidade (INT)<br>

<h3><strong>Agora, Vamos adicionar dados as tabelas:<strong></strong></h3><br>

<h4>INSERT INTO produtos (id, nome, preco, estoque) VALUES <br>
  (1, 'Camiseta', 29.90, 100),</h4>
  
<h4>INSERT INTO pedidos (id, data, cliente, produto_id, quantidade) VALUES <br>
  (1, '2023-05-01', 'João Silva', 1, 3),</h4><br><br>

  

<h3>Esses comandos de inserção adicionam 1 produtos à tabela produtos e 1 pedidos à tabela pedidos, cada um contendo o ID do produto, a quantidade e o nome do cliente que fez o pedido, bem como a data do pedido.<h3>