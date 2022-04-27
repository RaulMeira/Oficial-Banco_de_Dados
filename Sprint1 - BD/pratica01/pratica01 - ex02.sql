use sprint1;
create table Filme(
idFilme char (10) primary key,
titulo varchar (50),
genero varchar (40),
diretor varchar (40)
);
insert into Filme values
('0112210', 'Clube da luta', 'ficção cientifica', 'David Fincher'),
('0112211', 'Vingadores', 'ficção cientifica', 'Joss Whedon'),
('0112212', 'Homem Formiga', 'ficção cientifica', 'Joss Whedon'),
('0112213', 'Primeiro amor', 'romance', 'Tarantino'),
('0112214', 'I love you', 'romance', 'Vivian'),
('0112215', 'Amo risadas', 'comedia', 'Raul Meira'),
('0112216', 'Super Bad', 'comedia', 'Greg Mottola');

-- Exibir todos os dados da tabela.
select * from Filme;
-- Exibir apenas os títulos e os diretores dos filmes.
select titulo, diretor from Filme;
-- Exibir apenas os dados dos filmes de um determinado gênero (ficção cientifica).
select * from Filme where genero ='ficção cientifica';
-- Exibir apenas os dados dos filmes de um determinado diretor (Joss Whedon)
select * from Filme where diretor = 'Joss Whedon';
-- Exibir os dados da tabela ordenados pelo título do filme.
select * from Filme order by titulo;
-- Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.
select * from Filme order by diretor desc;
-- Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra (v).
select * from Filme where titulo like'v%';
-- Exibir os dados da tabela, dos filmes cujo artista termine com uma determinada letra 
		-- (no lugar do artista coloquei diretor, e a letra foi "n")
select * from Filme where diretor like '%n';
-- Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra (o)
select * from Filme where genero like '_o%';
-- Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra (a)
select * from Filme where titulo like '%a_';
-- Elimine a tabela