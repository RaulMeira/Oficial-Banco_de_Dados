use sprint1;
create table Filmes (
idFilme int primary key auto_increment,
titulo varchar (50),
genero varchar (40),
diretor varchar (40)
);
insert into Filmes values
(null, 'Homem Aranha', 'Aventura', 'Joss Whedon'),
(null, 'Clube da Luta', 'Suspense', 'David Fincher'),
(null, 'A Ilha do Medo', 'Suspense', 'Martin Scorsese'),
(null, 'O Lobo de Wall Street', 'Comédia', 'David Fincher'),
(null, 'Vingadores', 'Aventura', 'Joss Whedon'),
(null, 'Vingadores 2', 'Aventura', 'Joss Whedon'),
(null, 'Finalmente 18', 'Comédia1', 'João Diniz');
select * from Filmes;

• Exibir todos os dados da tabela.
• Adicionar o campo protagonista do tipo varchar(50) na tabela;
alter table Filmes add column protagonista varchar (50);
select * from Filmes;
• Atualizar o campo protagonista de todas os filmes inseridos;
update Filmes set protagonista = 'Peter' where idFilme = 1;
update Filmes set protagonista = 'Tyler' where idFilme = 2;
update Filmes set protagonista = 'Juan Castro' where idFilme = 3;
update Filmes set protagonista = 'João Diniz' where idFilme = 4;
update Filmes set protagonista = 'Steve Rogers' where idFilme = 5;
update Filmes set protagonista = 'Tony Stark' where idFilme = 6;
update Filmes set protagonista = 'Ned' where idFilme = 7;
select * from Filmes;
-- Modificar o campo diretor do tamanho 40 para o tamanho 150;
alter table Filmes modify column diretor varchar (150);
desc Filmes;

-- Atualizar o diretor do filme com id=5;
update Filmes set diretor = 'Raul Meira' where idFilme = 5;
select * from Filmes;
-- Atualizar o diretor dos filmes com id=2 e com o id=7;
update Filmes set diretor = 'Leandro Amaro' where idFilme in (2,7);
select * from Filmes;
• Atualizar o título do filme com o id=6;
update Filmes set titulo = 'Homem Formiga' where idFilme = 6;
select * from Filmes;
• Excluir o filme com o id=3;
delete from Filmes where idFilme = 3;
select * from Filmes;
• Exibir os filmes em que o gênero é diferente de drama;
select * from Filmes where genero <> 'drama';
• Exibir os dados dos filmes que o gênero é igual ‘suspense’;
select * from Filmes where genero = 'suspense';
-- Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor;
desc Filmes;
-- Limpar os dados da tabela; 