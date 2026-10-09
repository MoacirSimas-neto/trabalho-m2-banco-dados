# Trabalho M2 — Banco de Dados

Projeto desenvolvido para a disciplina de Banco de Dados, com foco na prática de SQL utilizando MySQL.

## Objetivo

Implementar um banco de dados de vendas contendo unidades, produtos, vendedores e vendas, aplicando:

- DDL para criação da estrutura;
- inserção de dados;
- JOINs e filtros;
- funções de agregação;
- GROUP BY e HAVING;
- subqueries;
- índices;
- EXPLAIN;
- controle de permissões com DCL.

## Estrutura do banco

O banco possui quatro tabelas principais:

- unidade — unidades responsáveis pelas vendas;
- produto — produtos comercializados;
- vendedor — vendedores cadastrados;
- venda — relaciona unidade, produto e vendedor.

### Relacionamentos

text
UNIDADE  ─────┐
              │
PRODUTO  ─────┼──> VENDA
              │
VENDEDOR ─────┘

Massa de dados
O projeto contém:
- 3 unidades;
- 20 produtos;
- 5 vendedores;
- 60 vendas.
As datas das vendas são geradas utilizando CURDATE() e DATE_SUB(), permitindo que as consultas por período continuem funcionando independentemente da data em que o banco for criado.

Estrutura do projeto
trabalho-m2-banco-dados/
│
├── schema.sql
├── inserts.sql
├── consultas.sql
├── indices.sql
├── permissoes.sql
├── prints/
└── README.md

Arquivos
- schema.sql — criação do banco, tabelas, chaves primárias e estrangeiras;
- inserts.sql — massa de dados utilizada nos testes;
- consultas.sql — consultas A até J;
- indices.sql — criação dos índices e comandos EXPLAIN;
- permissoes.sql — criação do usuário app1 e permissões de leitura;
- prints/ — evidências dos EXPLAIN executados.
Ordem de execução

Execute os arquivos na seguinte ordem:
1. schema.sql
2. inserts.sql
3. consultas.sql
4. indices.sql
5. permissoes.sql
Índices

Foram definidos índices compostos para auxiliar as consultas que utilizam produto, vendedor, unidade e períodos de data.
Os planos de execução são analisados utilizando:
EXPLAIN
SELECT ...;

Permissões
O usuário app1 possui somente permissão de leitura (SELECT) nas tabelas utilizadas pelo projeto.
Tecnologias
- MySQL
- MySQL Workbench
- SQL
- Git / GitHub
