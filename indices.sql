
-- =========================================
-- Índice para consultas D e I
-- Produto + data
-- =========================================

CREATE INDEX idx_venda_produto_data
ON venda (id_produto, data);


-- =========================================
-- Índice para consultas E e J
-- Vendedor + data
-- =========================================

CREATE INDEX idx_venda_vendedor_data
ON venda (id_vendedor, data);


-- =========================================
-- Índice para consulta H
-- Unidade + data
-- =========================================

CREATE INDEX idx_venda_unidade_data
ON venda (id_unidade, data);
