create database Sprint2;
use Sprint2;

create table Atleta (
idAtleta int primary key auto_increment,
nome varchar (40),
modalidade varchar (40),
qtdMedalha int
);
select * from Atleta;

insert into Atleta values
(null, 'raul', 'futebol', 5),
(null, 'luan', 'basquete', 3),
(null, 'ale', 'handebol', 9),
(null, 'lendro', 'basquete', 5),
(null, 'diogo', 'handebol', 10),
(null, 'gui', 'futebol', 8);

create table País (
idPais int primary key auto_increment,
nome varchar (30),
capital varchar (40)
);
insert into País values -- tem a chave estrangeira, vai transitar na tabela atleta
(null, 'Brasil', 'Brasilia'),
(null, 'Espanha', 'Madri'),
(null, 'Portugal', 'Lisboa'),
(null, 'Argentina', 'Buenos Aires'),
(null, 'Estados Unidos', 'Washington');

select * from Atleta;

-- Criar a chave estrangeira na tabela correspondente conforme modelagem;
alter table Atleta add column fkPaís int;
alter table Atleta add foreign key (fkPaís)
	references País (idPais);
    
-- Atualizar o país de todos os atletas;
update Atleta set fkPaís = 	4 where idAtleta = 1;
update Atleta set fkPaís = 	3 where idAtleta = 2;
update Atleta set fkPaís = 	2 where idAtleta = 3;
update Atleta set fkPaís = 	4 where idAtleta = 4;
update Atleta set fkPaís = 	2 where idAtleta = 5;
update Atleta set fkPaís = 	5 where idAtleta = 6;

-- Exibir os atletas e seu respectivo país;
select * from Atleta;

-- Exibir apenas o nome do atleta e o nome do respectivo país (Argentina);
select Atleta.nome, País.nome from Atleta
	join País on País.idPais = Atleta.fkPaís
    WHERE País.nome = 'Argentina'; 

-- Exibir os dados dos atletas, seus respectivos países, de uma determinada capital (Madri);
select * from Atleta
	join País on País.idPais = Atleta.fkPaís
    where País.capital = 'Madri';