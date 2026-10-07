-- =========================================
-- CRIAÇÃO DO USUÁRIO
-- =========================================

CREATE USER 'app1'@'localhost'
IDENTIFIED BY 'app123';


-- =========================================
-- PERMISSÕES DE LEITURA
-- =========================================

GRANT SELECT ON trabalho_m2.unidade
TO 'app1'@'localhost';

GRANT SELECT ON trabalho_m2.produto
TO 'app1'@'localhost';

GRANT SELECT ON trabalho_m2.vendedor
TO 'app1'@'localhost';

GRANT SELECT ON trabalho_m2.venda
TO 'app1'@'localhost';
