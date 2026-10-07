USE trabalho_m2; 


-- =========================================
-- A - Vendas de determinado produto
-- =========================================

SELECT
    v.id_venda,
    v.quantidade,
    v.data,
    p.descricao AS produto,
    u.id_unidade,
    u.cidade
FROM venda v
JOIN produto p
    ON v.id_produto = p.id_produto
JOIN unidade u
    ON v.id_unidade = u.id_unidade
WHERE p.id_produto = 1;



-- =========================================
-- B - Vendas de determinado vendedor
-- =========================================

SELECT
    v.id_venda,
    v.quantidade,
    v.data,
    u.id_unidade,
    u.cidade,
    vd.id_vendedor,
    vd.nome,
    vd.matricula
FROM venda v

JOIN vendedor vd
    ON v.id_vendedor = vd.id_vendedor

JOIN unidade u
    ON v.id_unidade = u.id_unidade

WHERE vd.id_vendedor = 1;



-- =========================================
-- C - Vendas de determinada unidade
-- realizadas nos últimos 2 anos
-- =========================================

SELECT
    v.id_venda,
    v.quantidade,
    v.data,
    u.id_unidade,
    u.cidade
FROM venda v

JOIN unidade u
    ON v.id_unidade = u.id_unidade

WHERE u.id_unidade = 1
AND v.data >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);


-- =========================================
-- D - Produtos sem vendas no último mês
-- =========================================

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
-- E - Vendedores sem vendas nos últimos 20 dias
-- =========================================

SELECT
    vd.id_vendedor,
    vd.nome,
    vd.matricula
FROM vendedor vd

LEFT JOIN venda v
    ON vd.id_vendedor = v.id_vendedor
    AND v.data >= DATE_SUB(CURDATE(), INTERVAL 20 DAY)

WHERE v.id_venda IS NULL;

