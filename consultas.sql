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



-- =========================================
-- F - Quantidade de vendas e valor total
-- =========================================

SELECT
    p.id_produto,
    p.descricao,
    COUNT(v.id_venda) AS quantidade_vendas,
    SUM(v.quantidade * p.preco) AS valor_total
FROM produto p

JOIN venda v
    ON p.id_produto = v.id_produto

WHERE p.id_produto = 1

GROUP BY
    p.id_produto,
    p.descricao;



-- =========================================
-- G - Vendas, total e média por vendedor
-- =========================================

-- =========================================
-- G - Vendas, total e média por vendedor
-- =========================================

SELECT
    -- dados do vendedor
   vd.id_vendedor,
    vd.nome,
    COUNT(v.id_venda) AS quantidade_vendas,
    SUM(v.quantidade * p.preco) AS valor_total,
    AVG(v.quantidade * p.preco) AS media_vendas
FROM vendedor vd

JOIN venda v
    ON vd.id_vendedor = v.id_vendedor

JOIN produto p
    ON v.id_produto = p.id_produto 

WHERE vd.id_vendedor  = 1

GROUP BY
    vd.id_vendedor,
    vd.nome;


-- =========================================
-- H - Unidades com vendas acima de 100 mil
-- =========================================

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
-- I - Produtos com menos de 20 unidades vendidas
-- =========================================

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
-- J - Vendedores acima da média de vendas
-- =========================================

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

-- Compara o total de cada vendedor com a média
HAVING SUM(v.quantidade * p.preco) > (

    -- Calcula a média dos totais dos vendedores
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
