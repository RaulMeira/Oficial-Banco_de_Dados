create database individual;
use individual;

create table usuario (
id int primary key auto_increment,
nome varchar (45),
cpf varchar (45),
tel varchar (45),
email varchar (45),
senha varchar (45)
);

select * from usuario;

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
    descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
); 

select * from aviso;

