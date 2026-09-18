-- ==========================================================
-- PROJETO DE PORTFÓLIO: CASOS DE NEGÓCIO EM SQL
-- Autor: Alvaro Santos
-- ==========================================================

-- ==========================================================
-- CENÁRIO 1: PLATAFORMA DE STREAMING DE MÚSICA
-- ==========================================================

-- 1. Criação das Tabelas
CREATE TABLE artistas (
    artista_id INT PRIMARY KEY,
    nome VARCHAR(100),
    pais VARCHAR(50)
);

CREATE TABLE musicas (
    musica_id INT PRIMARY KEY,
    titulo VARCHAR(100),
    duracao_segundos INT,
    reproducoes INT,
    artista_id INT,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

-- 2. Inserção de Dados de Teste
INSERT INTO artistas (artista_id, nome, pais) VALUES
(1, 'Alok', 'Brasil'),
(2, 'Anitta', 'Brasil'),
(3, 'Daft Punk', 'França'),
(4, 'The Weeknd', 'Canadá');

INSERT INTO musicas (musica_id, titulo, duracao_segundos, reproducoes, artista_id) VALUES
(101, 'Hear Me Now', 192, 5000000, 1),
(102, 'Envolver', 193, 7500000, 2),
(103, 'One More Time', 320, 4200000, 3),
(104, 'Blinding Lights', 200, 9800000, 4),
(105, 'Downtown', 193, 3100000, 2);

-- 3. Resolução das Perguntas de Negócio

-- Pergunta 1.1: Total de reproduções e duração média das músicas da plataforma
SELECT 
    SUM(reproducoes) AS total_reproducoes,
    AVG(duracao_segundos) AS duracao_media_segundos
FROM musicas;

-- Pergunta 1.2: Top 3 artistas mais ouvidos em volume total de streams
SELECT 
    a.nome AS artista,
    SUM(m.reproducoes) AS total_streams
FROM musicas m
JOIN artistas a ON m.artista_id = a.artista_id
GROUP BY a.nome
ORDER BY total_streams DESC
LIMIT 3;

-- Pergunta 1.3: Média de duração superior a 190s considerando apenas artistas do Brasil
SELECT 
    a.nome AS artista,
    AVG(m.duracao_segundos) AS duracao_media
FROM musicas m
JOIN artistas a ON m.artista_id = a.artista_id
WHERE a.pais = 'Brasil'
GROUP BY a.nome
HAVING AVG(m.duracao_segundos) > 190;


-- ==========================================================
-- CENÁRIO 2: CAFETERIA & VENDAS
-- ==========================================================

-- 1. Criação das Tabelas
CREATE TABLE produtos (
    produto_id INT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(50),
    preco_unitario DECIMAL(10, 2)
);

CREATE TABLE itens_pedido (
    item_id INT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

-- 2. Inserção de Dados de Teste
INSERT INTO produtos (produto_id, nome, categoria, preco_unitario) VALUES
(1, 'Espresso Duplo', 'Bebidas', 9.00),
(2, 'Cappuccino Italiano', 'Bebidas', 14.50),
(3, 'Pão de Queijo Especial', 'Salgados', 7.50),
(4, 'Croissant Folhado', 'Salgados', 12.00),
(5, 'Torta de Limão', 'Doces', 15.00);

INSERT INTO itens_pedido (item_id, pedido_id, produto_id, quantidade) VALUES
(1, 1001, 1, 2),
(2, 1001, 3, 3),
(3, 1002, 2, 1),
(4, 1002, 5, 2),
(5, 1003, 1, 4),
(6, 1003, 4, 2),
(7, 1004, 3, 5);

-- 3. Resolução das Perguntas de Negócio

-- Pergunta 2.1: Produto campeão de vendas em volume unitário
SELECT 
    p.nome AS produto,
    SUM(i.quantidade) AS total_unidades_vendidas
FROM itens_pedido i
JOIN produtos p ON i.produto_id = p.produto_id
GROUP BY p.nome
ORDER BY total_unidades_vendidas DESC
LIMIT 1;

-- Pergunta 2.2: Faturamento total gerado por categoria de produto
SELECT 
    p.categoria,
    SUM(i.quantidade * p.preco_unitario) AS faturamento_total
FROM itens_pedido i
JOIN produtos p ON i.produto_id = p.produto_id
GROUP BY p.categoria
ORDER BY faturamento_total DESC;

-- Pergunta 2.3: Pedidos com ticket total superior a R$ 40,00
SELECT 
    i.pedido_id,
    SUM(i.quantidade * p.preco_unitario) AS valor_pedido
FROM itens_pedido i
JOIN produtos p ON i.produto_id = p.produto_id
GROUP BY i.pedido_id
HAVING SUM(i.quantidade * p.preco_unitario) > 40.00;


-- ==========================================================
-- CENÁRIO 3: E-COMMERCE & LOGÍSTICA
-- ==========================================================

-- 1. Criação das Tabelas
CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(2)
);

CREATE TABLE pedidos (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    valor_total DECIMAL(10, 2),
    status_entrega VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- 2. Inserção de Dados de Teste
INSERT INTO clientes (cliente_id, nome, cidade, estado) VALUES
(1, 'Mariana Costa', 'São Paulo', 'SP'),
(2, 'Lucas Ferreira', 'Campinas', 'SP'),
(3, 'Beatriz Souza', 'Rio de Janeiro', 'RJ'),
(4, 'Carlos Mendes', 'Curitiba', 'PR'),
(5, 'Fernanda Lima', 'Belo Horizonte', 'MG');

INSERT INTO pedidos (pedido_id, cliente_id, valor_total, status_entrega) VALUES
(201, 1, 1250.00, 'Entregue'),
(202, 1, 850.00, 'Entregue'),
(203, 2, 450.00, 'Cancelado'),
(204, 3, 2300.00, 'Entregue'),
(205, 4, 600.00, 'Em Transporte'),
(206, 5, 3100.00, 'Entregue'),
(207, 2, 1500.00, 'Entregue');

-- 3. Resolução das Perguntas de Negócio

-- Pergunta 3.1: Volume total de pedidos por status de entrega
SELECT 
    status_entrega,
    COUNT(pedido_id) AS total_pedidos
FROM pedidos
GROUP BY status_entrega;

-- Pergunta 3.2: Top 3 clientes com maior gasto em pedidos entregues
SELECT 
    c.nome AS cliente,
    c.estado,
    SUM(p.valor_total) AS total_gasto
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
WHERE p.status_entrega = 'Entregue'
GROUP BY c.nome, c.estado
ORDER BY total_gasto DESC
LIMIT 3;

-- Pergunta 3.3: Estados com faturamento acumulado superior a R$ 2.000 em pedidos entregues
SELECT 
    c.estado,
    SUM(p.valor_total) AS faturamento_estado
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
WHERE p.status_entrega = 'Entregue'
GROUP BY c.estado
HAVING SUM(p.valor_total) > 2000.00
ORDER BY faturamento_estado DESC;
