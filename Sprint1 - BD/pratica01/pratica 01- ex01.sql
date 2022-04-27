create database sprint1;
use sprint1;

create table Atleta (
idAtleta int (7) primary key,
nome varchar (40),
modalidade varchar (40),
qntMedalhas int
);

insert into Atleta values
('0122180', 'Raul', 'Futebol', '5'),
('0122170', 'Luan', 'Basquete', '3'),
('0122160', 'Luis', 'Hispismo', '1'),
('0122150', 'Gabriel', 'Futebol', '5'),
('0122140', 'Rafael', 'Hipismo', '2'),
('0122130', 'Gustavo', 'Basquete', '4');

-- Exibir todos os dados da tabela.
select * from Atleta;
-- Exibir apenas os nomes e quantidade de medalhas dos atletas.
select nome, qntMedalhas from Atleta;
-- Exibir apenas os dados dos atletas de uma determinada modalidade (futebol)
select * from Atleta where modalidade = 'Futebol';
-- Exibir os dados da tabela ordenados pela modalidade.
select * from Atleta order by modalidade;
-- Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente.
select * from Atleta order by qntMedalhas desc;
-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
select * from Atleta where nome like '%s%'; 
-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra.
select * from Atleta where nome like 'l%';
-- Exibir os dados da tabela, dos atletas cujo nome termine com a letra o.
select * from Atleta where nome like '%o';
-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r.
select * from Atleta where nome like '%r_';
-- Eliminar a tabela.
drop table Atleta;

