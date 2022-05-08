create database sprint3;
use sprint3;

create table aluno (
ra int primary key auto_increment,
nome varchar (50),
bairro varchar (50)
)auto_increment = 500;

create table curso (
idCurso int primary key auto_increment,
nome varchar (50),
coordenador varchar (50)
) auto_increment = 100;

create table matricula (
idMatricula int auto_increment,
media int,
dtInicio date,
nivel char (2),
check (nivel = 'A1' or nivel = 'A2' or nivel = 'B1' or nivel  = 'B2' or nivel = 'C1' or nivel = 'C2'),
fkAluno int,
foreign key (fkAluno) references aluno(ra),
fkCurso int,
foreign key (fkCurso) references curso(idCurso),
primary key (idMatricula, fkAluno, fkCurso)
);

-- INSERINDO DADOS
insert into aluno values
(null, 'raul', 'grajau'),
(null, 'luan', 'centro'),
(null, 'biel', 'sul'),
(null, 'joao', 'leste'),
(null, 'arthur', 'oeste'); -- até o ra 504

insert into curso values 
(null, 'ingles', 'gustavo'),
(null, 'espanhol', 'mariana'),
(null, 'frances', 'ninao'); -- até o id 102

alter table matricula modify column media double;

insert into matricula values
(null, 8.5, '2020-09-09', 'A1', 500, 102),
(null, 7.2, '2021-10-19', 'B1', 501, 101),
(null, 10, '2021-09-30', 'C1', 504, 100),
(null, 10, '2020-03-20', 'A2', 502, 101),
(null, 9, '2020-01-13', 'C2', 501, 102),
(null, 6.8, '2020-11-10', 'C2', 500, 100),
(null, 4.9, '2020-12-29', 'B2', 503, 102);

-- Exibir os dados de cada tabela separadamente
select * from aluno;
select * from curso;
select * from matricula;

-- Exibir os dados dos alunos e dos cursos correspondentes
select * from aluno join matricula
	on aluno.ra = matricula.fkAluno
    join curso on matricula.fkCurso = curso.idCurso;
    
-- Exibir os dados dos alunos, mas somente de um curso
select * from aluno join matricula
	on aluno.ra = matricula.fkAluno
    join curso on matricula.fkCurso = curso.idCurso
    where curso.nome = 'ingles';
    
-- Exibir os dados de um aluno e os dados do curso somente desse aluno
select * from aluno join matricula
	on aluno.ra = matricula.fkAluno
    join curso on matricula.fkCurso = curso.idCurso
    where aluno.ra = 500;
    
-- Exibir a soma das medias e a media das medias
select sum(media) from matricula;
select round(avg(media),2) from matricula;

-- Exibir a maior e a menor media
select max(media) as 'maior media', min(media) as 'menor media' from matricula;

-- Exibir a maior e a menor media agrupado por curso
select max(media) as 'maior media', min(media) as 'menor media' from matricula
join curso on idCurso = fkCurso
group by curso.nome;

-- -- Exibir a maior e a menor media agrupado por curso + nome do curso
select curso.nome, max(media) as 'maior media', min(media) as 'menor media' from matricula
join curso on idCurso = fkCurso
group by curso.nome;

-- Exibir a maior e a menor media agrupado por aluno
select max(media) as 'maior media', min(media) as 'menor media' from matricula
join aluno on ra = fkAluno
group by aluno.nome;

-- Exibir apenas as medias da tabela AlunoCurso
select media from matricula;

-- Exibir as medias distintas da tabela AlunoCurso


-- Exibir a quantidade de medias da tabela AlunoCurso
select count(media) as 'quantidade de medias' from matricula;

-- Exibir a quantidade de medias distintas da tabela Aluno Curso

