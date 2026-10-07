
USE trabalho_m2;


-- =========================================
-- UNIDADES
-- =========================================

INSERT INTO unidade (cidade) VALUES
('Florianópolis'),
('São José'),
('Palhoça');


-- =========================================
-- PRODUTOS
-- =========================================

INSERT INTO produto (descricao, preco) VALUES
('Notebook Gamer', 5500),
('Smartphone', 4200),
('Monitor 27 Polegadas', 1800),
('Teclado Mecânico', 450),
('Mouse Gamer', 250),
('Headset', 600),
('SSD 1TB', 700),
('Memória RAM 16GB', 500),
('Webcam', 350),
('Cadeira Gamer', 1500),
('Impressora', 1200),
('Roteador', 400),
('HD Externo', 650),
('Microfone USB', 550),
('Tablet', 2200),
('Smartwatch', 1200),
('Carregador USB-C', 180),
('Cabo HDMI', 80),
('Pen Drive 64GB', 90),
('Adaptador USB', 70);


-- =========================================
-- VENDEDORES
-- =========================================

INSERT INTO vendedor (nome, matricula) VALUES
('João Silva', 1001),
('Maria Souza', 1002),
('Carlos Oliveira', 1003),
('Ana Santos', 1004),
('Pedro Costa', 1005);


-- =========================================
-- VENDAS
-- 60 REGISTROS
-- =========================================

INSERT INTO venda
(id_unidade, id_produto, id_vendedor, quantidade, data)
VALUES

-- VENDEDOR 1
(1, 1, 1, 8, DATE_SUB(CURDATE(), INTERVAL 2 DAY)),
(1, 1, 1, 6, DATE_SUB(CURDATE(), INTERVAL 5 DAY)),
(1, 2, 1, 4, DATE_SUB(CURDATE(), INTERVAL 8 DAY)),
(1, 3, 1, 5, DATE_SUB(CURDATE(), INTERVAL 10 DAY)),
(1, 1, 1, 5, DATE_SUB(CURDATE(), INTERVAL 12 DAY)),
(1, 2, 1, 2, DATE_SUB(CURDATE(), INTERVAL 15 DAY)),
(1, 3, 1, 4, DATE_SUB(CURDATE(), INTERVAL 18 DAY)),
(1, 1, 1, 4, DATE_SUB(CURDATE(), INTERVAL 22 DAY)),
(1, 2, 1, 3, DATE_SUB(CURDATE(), INTERVAL 25 DAY)),
(1, 10, 1, 2, DATE_SUB(CURDATE(), INTERVAL 28 DAY)),
(1, 15, 1, 2, DATE_SUB(CURDATE(), INTERVAL 35 DAY)),
(1, 1, 1, 4, DATE_SUB(CURDATE(), INTERVAL 50 DAY)),

-- VENDEDOR 2
(1, 1, 2, 1, DATE_SUB(CURDATE(), INTERVAL 3 DAY)),
(2, 3, 2, 3, DATE_SUB(CURDATE(), INTERVAL 6 DAY)),
(2, 10, 2, 2, DATE_SUB(CURDATE(), INTERVAL 9 DAY)),
(1, 15, 2, 2, DATE_SUB(CURDATE(), INTERVAL 13 DAY)),
(2, 2, 2, 1, DATE_SUB(CURDATE(), INTERVAL 17 DAY)),
(2, 11, 2, 2, DATE_SUB(CURDATE(), INTERVAL 21 DAY)),
(1, 3, 2, 2, DATE_SUB(CURDATE(), INTERVAL 24 DAY)),
(2, 16, 2, 1, DATE_SUB(CURDATE(), INTERVAL 27 DAY)),
(2, 7, 2, 3, DATE_SUB(CURDATE(), INTERVAL 32 DAY)),
(1, 2, 2, 1, DATE_SUB(CURDATE(), INTERVAL 40 DAY)),
(2, 8, 2, 4, DATE_SUB(CURDATE(), INTERVAL 55 DAY)),
(2, 12, 2, 3, DATE_SUB(CURDATE(), INTERVAL 70 DAY)),

-- VENDEDOR 3
(2, 4, 3, 4, DATE_SUB(CURDATE(), INTERVAL 1 DAY)),
(2, 5, 3, 6, DATE_SUB(CURDATE(), INTERVAL 4 DAY)),
(2, 6, 3, 3, DATE_SUB(CURDATE(), INTERVAL 7 DAY)),
(2, 7, 3, 2, DATE_SUB(CURDATE(), INTERVAL 11 DAY)),
(2, 8, 3, 5, DATE_SUB(CURDATE(), INTERVAL 14 DAY)),
(2, 9, 3, 4, DATE_SUB(CURDATE(), INTERVAL 19 DAY)),
(2, 4, 3, 3, DATE_SUB(CURDATE(), INTERVAL 23 DAY)),
(2, 5, 3, 5, DATE_SUB(CURDATE(), INTERVAL 26 DAY)),
(2, 6, 3, 2, DATE_SUB(CURDATE(), INTERVAL 30 DAY)),
(2, 13, 3, 2, DATE_SUB(CURDATE(), INTERVAL 45 DAY)),
(2, 14, 3, 2, DATE_SUB(CURDATE(), INTERVAL 65 DAY)),
(2, 9, 3, 3, DATE_SUB(CURDATE(), INTERVAL 80 DAY)),

-- VENDEDOR 4
(3, 4, 4, 2, DATE_SUB(CURDATE(), INTERVAL 2 DAY)),
(3, 5, 4, 3, DATE_SUB(CURDATE(), INTERVAL 5 DAY)),
(3, 6, 4, 1, DATE_SUB(CURDATE(), INTERVAL 8 DAY)),
(3, 7, 4, 2, DATE_SUB(CURDATE(), INTERVAL 12 DAY)),
(3, 8, 4, 2, DATE_SUB(CURDATE(), INTERVAL 16 DAY)),
(3, 9, 4, 3, DATE_SUB(CURDATE(), INTERVAL 18 DAY)),
(3, 12, 4, 2, DATE_SUB(CURDATE(), INTERVAL 24 DAY)),
(3, 13, 4, 1, DATE_SUB(CURDATE(), INTERVAL 29 DAY)),
(3, 14, 4, 2, DATE_SUB(CURDATE(), INTERVAL 33 DAY)),
(3, 16, 4, 1, DATE_SUB(CURDATE(), INTERVAL 48 DAY)),
(3, 17, 4, 5, DATE_SUB(CURDATE(), INTERVAL 60 DAY)),
(3, 11, 4, 1, DATE_SUB(CURDATE(), INTERVAL 85 DAY)),

-- VENDEDOR 5
-- Sem vendas nos últimos 20 dias de propósito
(3, 10, 5, 1, DATE_SUB(CURDATE(), INTERVAL 25 DAY)),
(3, 11, 5, 1, DATE_SUB(CURDATE(), INTERVAL 30 DAY)),
(3, 12, 5, 2, DATE_SUB(CURDATE(), INTERVAL 35 DAY)),
(3, 13, 5, 2, DATE_SUB(CURDATE(), INTERVAL 40 DAY)),
(3, 14, 5, 1, DATE_SUB(CURDATE(), INTERVAL 45 DAY)),
(3, 15, 5, 1, DATE_SUB(CURDATE(), INTERVAL 50 DAY)),
(3, 16, 5, 1, DATE_SUB(CURDATE(), INTERVAL 60 DAY)),
(3, 17, 5, 4, DATE_SUB(CURDATE(), INTERVAL 70 DAY)),
(3, 18, 5, 5, DATE_SUB(CURDATE(), INTERVAL 80 DAY)),
(3, 19, 5, 6, DATE_SUB(CURDATE(), INTERVAL 90 DAY)),
(2, 18, 5, 3, DATE_SUB(CURDATE(), INTERVAL 120 DAY)),
(2, 19, 5, 4, DATE_SUB(CURDATE(), INTERVAL 150 DAY));
