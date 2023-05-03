CREATE DATABASE minha_loja;
USE minha_loja;

CREATE TABLE produtos (
  id INT PRIMARY KEY,
  nome VARCHAR(255),
  preco DECIMAL(10,2),
  estoque INT
);

CREATE TABLE pedidos (
  id INT PRIMARY KEY,
  data DATE,
  cliente VARCHAR(255),
  produto_id INT,
  quantidade INT,
  FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO produtos (id, nome, preco, estoque) VALUES 
  (1, 'Camiseta', 29.90, 100),
  (2, 'Calça Jeans', 89.90, 50),
  (3, 'Tênis', 119.90, 25),
  (4, 'Boné', 19.90, 75),
  (5, 'Moletom', 79.90, 40);

INSERT INTO pedidos (id, data, cliente, produto_id, quantidade) VALUES 
  (1, '2023-05-01', 'João Silva', 1, 3),
  (2, '2023-05-01', 'Maria Souza', 2, 2),
  (3, '2023-05-02', 'Pedro Oliveira', 1, 1),
  (4, '2023-05-02', 'Ana Santos', 5, 2),
  (5, '2023-05-03', 'Carlos Almeida', 3, 1),
  (6, '2023-05-03', 'Luciana Costa', 4, 3),
  (7, '2023-05-03', 'Ricardo Pereira', 2, 1);
