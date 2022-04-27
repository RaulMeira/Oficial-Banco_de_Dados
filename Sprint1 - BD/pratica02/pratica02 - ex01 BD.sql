create database sprint1;
use sprint1;
create table Atleta (
idAtleta int primary key auto_increment,
nome varchar(40),
modalidade varchar(40),
qntMedalha int (10)
);
insert into Atleta values
(null, 'Raul', 'futebol', 5),
(null, 'Matheus', 'handebol', 1),
(null, 'Rafael', 'futebol', 1),
(null, 'Gabriel', 'volei', 2),
(null, 'Luan', 'basquete', 3),
(null, 'Diogo', 'natação', 2),
(null, 'Gustavo', 'volei', 4);

-- Exibir todos os dados da tabela.
select * from Atleta;
-- Atualizar a quantidade de medalhas do atleta com id=1;
update Atleta set qntMedalha = 3 where idAtleta = 1;
select * from Atleta;
-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3;
update Atleta set qntMedalha = 5 where idAtleta in  (2,3);
select * from Atleta;
-- Atualizar o nome do atleta com o id=4;
update Atleta set nome = 'João' where idAtleta = 4;
select * from Atleta;
-- Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;
alter table Atleta add column dataNasc date;
select * from Atleta;
-- Atualizar a data de nascimento de todos os atletas;
update Atleta set dataNasc = '2004-10-07' where idAtleta=1;
update Atleta set dataNasc = '2000-08-07' where idAtleta=2;
update Atleta set dataNasc = '2004-01-01' where idAtleta=3;
update Atleta set dataNasc = '1988-08-12' where idAtleta=4;
update Atleta set dataNasc = '2001-12-12' where idAtleta=5;
update Atleta set dataNasc = '2002-09-19' where idAtleta=6;
update Atleta set dataNasc = '1998-05-18' where idAtleta=7;
select * from Atleta;
-- Excluir o atleta com o id=5;
delete from Atleta where idAtleta = 5;
select * from Atleta;
-- Exibir os atletas onde a modalidade é diferente de natação;
select * from Atleta where modalidade <> 'natação'; -- <> significa diferente
-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;
select * from Atleta where qntMedalha >= 3;
-- Modificar o campo modalidade do tamanho 40 para o tamanho 60;
alter table Atleta modify column modalidade varchar(60);
-- Descrever os campos da tabela mostrando a atualização do campo modalidade;
desc Atleta;
-- Limpar os dados da tabela;
