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