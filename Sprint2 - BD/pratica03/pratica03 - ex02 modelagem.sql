use sprint2;
create table Musica (
idMusica int primary key auto_increment,
titulo varchar (40),
artista varchar (40),
genero varchar (40)
);

insert into Musica values
(null, 'Ela vai voltar', 'Charlie Brown JR', 'MPB'),
(null, 'Só os Loucos sabem', 'Charlie Brown JR', 'MPB'),
(null, 'Envolvidão', 'Rael', 'Rap'),
(null, 'Mandrake', 'Kyan', 'Rap'),
(null, 'Zoio de Lula', 'Charlie Brown JR', 'MPB');

create table Album (
idAlbum int primary key auto_increment,
nome varchar(50),
tipo varchar(50),
constraint chkTipo check 
(tipo = 'digital' or tipo = 'físico'),
dtLancamento date
);

insert into Album values -- tem a chave estrangeira, vai transitar na tabela atleta
(null, 'Imunidade Musical', 'fisico', '2004-09-17'),
(null, 'Presente e Passado', 'digital', '2021-03-20'),
(null, 'Tamo ai na atividade', 'fisico', '2002-07-10');

-- a) Exibir todos os dados das tabelas separadamente;
select * from Musica;
select * from Album;

-- b) Criar a chave estrangeira na tabela de acordo com a regra de negócio;
alter table Musica add column fkAlbum int;
alter table Musica add foreign key (fkAlbum)
	references Album (idAlbum);
select * from Musica;

-- c) Atualizar os álbuns de cada música;
update Musica set fkAlbum = 1 where idMusica = 1;
update Musica set fkAlbum = 3 where idMusica = 2;
update Musica set fkAlbum = 2 where idMusica = 3;
update Musica set fkAlbum = 2 where idMusica = 4;
update Musica set fkAlbum = 1 where idMusica = 5;

-- d) Exibir as músicas e seus respectivos álbuns;
select * from Musica;

-- e) Exibir somente o título da música e o nome do seu respectivo álbum (Presente e Passado);
select Musica.titulo, Album.nome from Musica
	join Album on Album.idAlbum = Musica.fkAlbum
    where Album.nome = 'Presente e Passado';

-- f) Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo (fisico).
select * from Musica
	join Album on Album.idAlbum = Musica.fkAlbum
    where Album.tipo = 'fisico';

