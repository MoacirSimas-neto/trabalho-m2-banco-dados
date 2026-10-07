DROP DATABASE IF EXISTS trabalho_m2;

CREATE DATABASE trabalho_m2;

USE trabalho_m2;


CREATE TABLE unidade (
    id_unidade INT PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(40)
);


CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50),
    preco FLOAT
);


CREATE TABLE vendedor (
    id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60),
    matricula INT UNIQUE
);


CREATE TABLE venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_unidade INT,
    id_produto INT,
    id_vendedor INT,
    quantidade FLOAT,
    data DATE,

    FOREIGN KEY (id_unidade) REFERENCES unidade(id_unidade),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
);
