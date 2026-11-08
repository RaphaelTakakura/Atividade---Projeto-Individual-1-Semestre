CREATE DATABASE gameDevArk;

USE gameDevArk;

CREATE TABLE usuario(
id INT PRIMARY KEY AUTO_INCREMENT,
usuario VARCHAR(20) NOT NULL,
senha VARCHAR(45) NOT NULL,
email VARCHAR(70) NOT NULL,
dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
tipo_usuario TINYINT DEFAULT 1);

CREATE TABLE interesse(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(20) NOT NULL);

CREATE TABLE artigo(
id INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(45) NOT NULL,
data_publicacao DATETIME DEFAULT CURRENT_TIMESTAMP,
fk_interesse INT,
FOREIGN KEY (fk_interesse) REFERENCES interesse(id));

CREATE TABLE comentario(
id INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(45) NOT NULL,
data_publicacao DATETIME DEFAULT CURRENT_TIMESTAMP,
conteudo VARCHAR(300) NOT NULL,
fk_artigo INT,
fk_usuario INT,
FOREIGN KEY (fk_artigo) REFERENCES artigo(id),
FOREIGN KEY (fk_usuario) REFERENCES usuario(id));

CREATE TABLE interesse_do_usuario(
fk_usuario INT,
fk_interesse INT,
FOREIGN KEY (fk_usuario) REFERENCES usuario(id),
FOREIGN KEY (fk_interesse) REFERENCES interesse(id),
PRIMARY KEY (fk_usuario, fk_interesse));

INSERT INTO interesse VALUES
(DEFAULT, 'Game Design'),
(DEFAULT, 'Tecnologia');

INSERT INTO artigo VALUES
(DEFAULT, 'Introdução ao Aseprite', NOW(), 2);

SELECT * FROM interesse;
SELECT * FROM artigo;
SELECT * FROM usuario