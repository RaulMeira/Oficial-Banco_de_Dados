use sprint1;
create table Musica (
idMusica int (7) primary key,
titulo varchar (40),
artista varchar (40),
genero varchar (40)
);

insert into Musica values 
('1001121', 'So os loucos', 'Chorao', 'mpb'),
('1001122', 'Ceu azul', 'Chorao', 'mpb'),
('1001123', 'Gita', 'Raul Seixas', 'mpb'),
('1001124', 'É sal', 'Matue', 'rap'),
('1001125', 'Vida louca', 'Racionais', 'rap'),
('1001126', 'É tarde', 'Pericles', 'pagode'),
('1001127', 'Clareou', 'Arlindo', 'samba'),
('1001128', 'Adora', 'Pitty', 'rock');
select * from Musica;

-- a) Exibir todos os dados da tabela.
select * from Musica;
-- b) Exibir apenas os títulos e os artistas das músicas.
select titulo, artista from Musica;
-- c) Exibir apenas os dados das músicas de um determinado gênero (rap)
select * from Musica where genero = 'rap';
-- d) Exibir apenas os dados das músicas de um determinado artista (matue)
select * from Musica where artista = 'Matue';
-- e) Exibir os dados da tabela ordenados pelo título da música.
select * from Musica order by titulo;
-- f) Exibir os dados da tabela ordenados pelo artista em ordem decrescente.
select * from Musica order by artista desc;
-- g) Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra (s)
select * from Musica where titulo like 's%';
-- h) Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra (o)
select * from Musica where artista like '%o';
-- i) Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra (a)
select * from Musica where genero like '_a%';
-- j) Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra (u)
select * from Musica where titulo like '%u_';
-- k) Elimine a tabela.
drop table Musica;
