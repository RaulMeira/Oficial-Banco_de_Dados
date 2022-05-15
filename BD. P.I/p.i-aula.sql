CREATE DATABASE acquatec;

USE acquatec;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
    cpf varchar (50),
    tel varchar (50),
	email VARCHAR(50),
	senha VARCHAR(50)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
    descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
); 
select* from aviso;


CREATE TABLE medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	temperatura DECIMAL,
	umidade DECIMAL,
	momento DATETIME,
	fk_aquario INT
);

select * from usuario;
alter table usuario drop column cpf;

drop table usuario;

drop table usuario;
alter table usuario add column telefone varchar (45);

