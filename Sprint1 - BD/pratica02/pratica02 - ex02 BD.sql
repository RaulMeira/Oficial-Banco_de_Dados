use sprint1;
create table Musica (
idMusica int primary key auto_increment,
titulo varchar (40),
artista varchar(40),
genero varchar (40)
);
 insert into Musica values 
 (null, 'R.U.A', 'Febem', 'Rap'),
 (null, 'Estilo cachorro', 'Racionais', 'Rap'),
 (null, 'Vida Loka', 'Racionais', 'Rap'),
 (null, 'Cheia de vida', 'Charlie Brown Jr', 'MPB'),
 (null, 'É tarde demais', 'Péricles', 'Pagode'),
 (null, 'Ta escrito', 'Revelação', 'pagode'),
 (null, 'Meu lugar', 'Arlindo Cruz', 'samba');

SELECT * FROM Musica;
-- Execute os comandos para:
-- a) Exibir todos os dados da tabela.
-- b) Adicionar o campo curtidas do tipo int na tabela;
alter table Musica add column curtidas int;
-- c) Atualizar o campo curtidas de todas as músicas inseridas;
update Musica set curtidas = 100 where idMusica = 1;
update Musica set curtidas = 4000 where idMusica = 2;
update Musica set curtidas = 3500 where idMusica = 3;
update Musica set curtidas = 10000 where idMusica = 4;
update Musica set curtidas = 1340 where idMusica = 5;
update Musica set curtidas = 4500 where idMusica = 6;
update Musica set curtidas = 10000 where idMusica = 7;
select * from Musica;
-- d) Modificar o campo artista do tamanho 40 para o tamanho 80;
alter table Musica modify column artista varchar(80);
desc Musica;
-- e) Atualizar a quantidade de curtidas da música com id=1;
update Musica set curtidas = 800 where idMusica = 1;
select * from Musica;
-- f) Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;
update Musica set curtidas = 10 where idMusica in (2,3);
select * from Musica;
-- g) Atualizar o nome da música com o id=5;
update Musica set titulo = 'Até que durou' where idMusica = 5;
select * from Musica;
-- h) Excluir a música com o id=4;
delete from Musica where idMusica = 4;
select * from Musica;
-- i) Exibir as músicas onde o gênero é diferente de funk;
select * from Musica where genero <> 'funk';
-- j) Exibir os dados das músicas que tem curtidas maior ou igual a 20;
select * from Musica where curtidas >= 20;
-- k) Descrever os campos da tabela mostrando a atualização do campo artista;
desc Musica;
-- l) Limpar os dados da tabela;