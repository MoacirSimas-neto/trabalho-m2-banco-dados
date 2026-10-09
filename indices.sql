
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



-- =========================================
-- EXPLAIN - Consulta D
-- =========================================

EXPLAIN
SELECT
    p.id_produto,
    p.descricao,
    p.preco
FROM produto p

LEFT JOIN venda v
    ON p.id_produto = v.id_produto
    AND v.data >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)

WHERE v.id_venda IS NULL;


-- =========================================
-- EXPLAIN - Consulta E
-- =========================================

EXPLAIN
SELECT
    vd.id_vendedor,
    vd.nome,
    vd.matricula
FROM vendedor vd

LEFT JOIN venda v
    ON vd.id_vendedor = v.id_vendedor
    AND v.data >= DATE_SUB(CURDATE(), INTERVAL 20 DAY)

WHERE v.id_venda IS NULL;


-- =========================================
-- EXPLAIN - Consulta H
-- =========================================

EXPLAIN
SELECT
    u.id_unidade,
    u.cidade,
    SUM(v.quantidade * p.preco) AS valor_total
FROM unidade u

JOIN venda v
    ON u.id_unidade = v.id_unidade

JOIN produto p
    ON v.id_produto = p.id_produto

WHERE v.data >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)

GROUP BY
    u.id_unidade,
    u.cidade

HAVING SUM(v.quantidade * p.preco) > 100000;


-- =========================================
-- EXPLAIN - Consulta I
-- =========================================

EXPLAIN
SELECT
    p.id_produto,
    p.descricao,
    COALESCE(SUM(v.quantidade), 0) AS total_vendido
FROM produto p

LEFT JOIN venda v
    ON p.id_produto = v.id_produto
    AND v.data >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)

GROUP BY
    p.id_produto,
    p.descricao

HAVING COALESCE(SUM(v.quantidade), 0) < 20;


-- =========================================
-- EXPLAIN - Consulta J
-- =========================================

EXPLAIN
SELECT
    vd.id_vendedor,
    vd.nome,
    SUM(v.quantidade * p.preco) AS valor_total
FROM vendedor vd

JOIN venda v
    ON vd.id_vendedor = v.id_vendedor

JOIN produto p
    ON v.id_produto = p.id_produto

WHERE v.data >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)

GROUP BY
    vd.id_vendedor,
    vd.nome

HAVING SUM(v.quantidade * p.preco) > (

    SELECT AVG(total_vendedor)
    FROM (

        SELECT
            SUM(v2.quantidade * p2.preco) AS total_vendedor
        FROM venda v2

        JOIN produto p2
            ON v2.id_produto = p2.id_produto

        WHERE v2.data >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)

        GROUP BY
            v2.id_vendedor

    ) AS totais
);




