create database individual;
use individual;


-- tabela jogador
create table jogador (
idJogador int primary key auto_increment,
nomeJogador varchar (45)
);

insert into jogador values
(null, 'messi'),
(null, 'neymar'),
(null, 'veiga'),
(null, 'cristiano ronaldo');
update jogador set nomeJogador = 'CR7' where idJogador = 4;

-- tabela usuario
create table usuario (
id int primary key auto_increment,
nome varchar (45),
cpf varchar (45),
email varchar (45),
check (email like '%@%' and email like '%.com%'),
senha varchar (45),
fkjogador int,
foreign key (fkjogador) references jogador (idJogador)
);

-- tabela aviso
CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
    descricao VARCHAR(300),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
); 

-- tabela debate 
create table debate (
idDebate int auto_increment,
Qntd_respotas int,
fkUsuario int,
foreign key (fkUsuario) references usuario(id),
fkOpiniao int,
foreign key (fkOpiniao) references aviso(id),
primary key (idDebate, fkUsuario, fkOpiniao)
);

-- tabela formulario
create table formulario (
idFormulario int auto_increment,
timee varchar (45),
jogador varchar (45),
Campeonato varchar (45),
Seleção varchar (45),
fkUsuario int,
foreign key (fkUsuario) references usuario(id),
primary key (idFormulario,fkUsuario)
);

-- tabela votação
create table votacao (
idVoto int auto_increment,
jogador varchar (45),
fkUsuario int,
foreign key (fkUsuario) references usuario(id),
primary key (idVoto,fkUsuario )
);

select jogador.nomeJogador as jogador, count(fkjogador) as contagem from usuario join jogador on usuario.fkjogador = jogador.idJogador
group by nomeJogador order by nomeJogador;

-- ALGUNS INSERTS PRONTOS

insert into usuario (nome, cpf, email, senha, fkjogador) values 
('ra', '124124341', 'ra@raul.com', 123, 1),
('bi', '124124341', 'bi@raul.com', 123, 2),
('ka', '124124341', 'ka@raul.com', 123, 3),
('jo', '124124341', 'jo@raul.com', 123, 1),
('ya', '124124341', 'ya@raul.com', 123, 4),
('teste', '124124341', 'teste@raul.com', 123, 1),
('lemra', '124124341', 'lemra@raul.com', 123, 4),
('fe', '124124341', 'fe@raul.com', 123, 2),
('iotr', '124124341', 'iotr@raul.com', 123, 2);

insert into usuario values
(null, 'cecilia', '124124341', 'ce@ce.com', 'ce', 3);

insert into usuario (fkJogador) values 
(1),
(1),
(1),
(2),
(2);




 
