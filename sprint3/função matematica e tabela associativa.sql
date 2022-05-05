create database sprint3;
use sprint3;

-- criando a tabela aluno
create table aluno (
ra int primary key auto_increment,
nome varchar (50)
) auto_increment = 50000;

-- criando a tabela curso
create table curso (
idCurso int primary key auto_increment,
nomeCurso varchar (50)
) auto_increment = 100;

-- criando a tabela associativa (fraca pq é dependente das outras 2, chave primaria composta)
create table matricula (
cod int auto_increment,
fkRa int,
foreign key (fkRa) references aluno (ra),
fkCurso int,
foreign key (fkCurso) references curso (idCurso),
primary key (cod, fkRa, fkCurso),
dtInicio date,
nivel char (2)
);

-- inserindo dados dos alunos
insert into aluno values
(null, 'maciel'),
(null, 'mayla'),
(null, 'elissandra');

-- inserindo dados dos cursos
insert into curso values
(null, 'ingles'),
(null, 'espanhol'),
(null, 'mandarim');

select * from aluno;
select * from curso;

-- inserindo matricula
insert into matricula values
(null, 50000, 100, '2022-01-20', 'B1'),
(null, 50000, 101, '2022-02-10', 'A1'),
(null, 50001, 100, '2022-01-20', 'B1'),
(null, 50002, 102, '2022-01-15', 'I3');

select * from aluno 
	join matricula on ra = fkRa
	join curso on idCurso = fkCurso;
    
insert into aluno values 
(null, 'Franklin');

select * from aluno 
	left join matricula on ra = fkRa
	left join curso on idCurso = fkCurso;
    
insert into curso values
(null, 'frances');

select * from aluno 
	right join matricula on ra = fkRa
	right join curso on idCurso = fkCurso;

-- union pra unir dois selects -> os dois selects tem que ser com os mesmos campos 
select aluno.nome as NomeAluno, curso.nomeCurso, dtInicio from aluno 
	left join matricula on ra = fkRa
	left join curso on idCurso = fkCurso
union
select aluno.nome as NomeAluno, curso.nomeCurso, dtInicio from aluno 
	right join matricula on ra = fkRa
	right join curso on idCurso = fkCurso;
    
-- qnd o aluno não tem curso ou ao contrario
	-- where is null, pra so pegar aonde o fkCurso é null
		-- vai vir o frances e o franklin
select aluno.nome as NomeAluno, curso.nomeCurso, dtInicio from aluno 
	left join matricula on ra = fkRa
	left join curso on idCurso = fkCurso
    where fkCurso is null
union
select aluno.nome as NomeAluno, curso.nomeCurso, dtInicio from aluno 
	right join matricula on ra = fkRa
	right join curso on idCurso = fkCurso
    where fkCurso is null;
    
-- funções matematicas
alter table matricula add nota double;

desc matricula;
select * from matricula;

update matricula set nota = 7.4 where cod = 1;
update matricula set nota = 9.2 where cod = 2;
update matricula set nota = 8.5 where cod = 3;
update matricula set nota = 8 where cod = 4;

-- count = quantidade; retorna o número valores de uma coluna. Valores nulos não entram na contagem
select count(nivel) from matricula;

update matricula set nivel = null where cod = 2;

select count(nivel), count(dtInicio) from matricula;
	
-- soma das notas
select sum(nota) from matricula;

-- average = média
select avg(nota) as 'Média' from matricula;

-- minima e maxima
select min(nota), max(nota) from matricula;

select min(nota) as 'Nota minima', max(nota) as 'Nota máxima' from matricula;

-- arredondar = round -> depende da proxima casa; ex: 8.275 vira 8.28
	-- 2 casas decimais
select round(avg(nota),2), avg(nota), round(avg(nota), 1) from matricula;

-- truncate -> ex: 8.275 vira 8.27, tbm arredonda
select truncate(avg(nota), 2) from matricula;

-- soma das notas agrupadas por alunos
select nome, sum(nota) as 'nota' from aluno
	join matricula on ra = fkRa
    group by nome;

-- soma das notas e a media agrupadas por alunos
	-- grupo by = agrupa; ex: vai agrupar pelo nome dos alunos, ou seja, o maciel tem + de uma nota nisso ele vai agrupar
select nome, sum(nota) as 'nota', avg(nota) as 'média',
	min(nota) as 'minima', max(nota) as 'maxima 'from aluno
	join matricula on ra = fkRa
    group by nome;
    
