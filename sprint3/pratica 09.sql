-- grupo - 1 ou mais alunos, avaliado por 1 ou mais professores
-- aluno - apenas 1 grupo; fkgrupo
-- professor - avalia 1 ou mais grupos
-- relação n:m entre professor e grupo

-- lembrar qnd as duas tabelas tiver esse "1 ou mais" será n:n
-- qnd uma tabela tiver 1 ou mais, e a outra só 1, essa que tiver só 1 tera a fk

use revisao3;

create table professor (
idProf int primary key auto_increment,
nomeProf varchar (45),
disciplina varchar (45)
)auto_increment = 10000;

alter table professor add constraint chknomeProf check (nomeProf = 'frizza' or nomeProf = 'vivian' or nomeProf = 'brandao');

alter table professor drop constraint chknomeProf;

create table grupo (
idGrupo int primary key auto_increment,
nomeGrupo varchar (45),
descrição varchar (100)
);

create table aluno (
ra int primary key,
nome varchar (45),
email varchar (45),
fkGrupo int,
foreign key (fkGrupo) references grupo (idGrupo)
);

create table avaliacao (
idAvaliacao int auto_increment,
fkGrupo int,
foreign key (fkGrupo) references grupo (idGrupo),
fkProf int,
foreign key (fkProf) references professor (idProf),
primary key (idAvaliacao, fkProf, fkGrupo),
dtHora datetime default current_timestamp,
nota float
) auto_increment = 100;

insert into professor values
(null, 'vivian', 'BD'),
(null, 'brandão', 'P.I'),
(null, 'frizza', 'ALG');

insert into grupo values
(null, 'move sport', 'sensor de mov. para lojas'),
(null, 'green house', 'sensor de luz para estufas'),
(null, 'bio tech', 'sensor de umidade para plantações');

insert into aluno values
('001', 'raul', 'raul@email.com', 1),
('002', 'luiz', 'luiz@email.com', 2),
('003', 'hugo', 'hugo@email.com', 1),
('004', 'joao', 'joao@email.com', 3),
('005', 'arthur', 'arthur@email.com', 3),
('006', 'gab', 'gab@email.com', 2),
('007', 'luan', 'luan@email.com', 1);

insert into avaliacao (idAvaliacao, fkGrupo, fkProf, nota) values
(null, 1, 10000, 9.80);

insert into avaliacao (idAvaliacao, fkGrupo, fkProf, nota) values
(null, 2, 10000, 7.62),
(null, 3, 10002, 8.65),
(null, 1, 10001, 10),
(null, 2, 10002, 5.90),
(null, 3, 10001, 3.72);

-- Exiba todos os dados de cada tabela separadamente
select * from aluno;
select * from professor;
select * from grupo; 
select * from avaliacao;

-- exibir os dados dos grupos e os dados de seus respectivos alunos
select * from grupo join aluno
	on grupo.idGrupo = aluno.fkGrupo
    order by idGrupo;
    
-- exibir os dados de um determinado grupos e os dados de seus respectivos alunos
select * from grupo join aluno
	on grupo.idGrupo = aluno.fkGrupo
    where nomeGrupo = 'move sport';
    
-- exibir a media das notas atribuidas aos grupos, no geral
select truncate(avg(nota), 2) as 'media geral' from avaliacao;

-- exibir a nota min. e max. dos grupos no geral
select max(nota) as 'nota maxima', min(nota) as 'nota minima' from avaliacao;

-- exibir a soma das notas
select truncate(sum(nota), 2) as 'soma das notas' from avaliacao;
    
-- exibir os dados dos professores que avaliaram cada grupo, os dados dos grupos, a data e o horario da avaliacao
select p.idProf, p.nomeProf, p.disciplina, g.idGrupo, g.nomeGrupo, g.descrição, a.dtHora from professor as p
	join avaliacao as a on a.fkProf = p.idProf
    join grupo as g on a.fkGrupo = g.idGrupo;
    
-- exibir os dados dos prof que avaliaram um determinado grupo, os dados do grupo, a dt e hora da aval
select p.idProf, p.nomeProf, p.disciplina, g.idGrupo, g.nomeGrupo, g.descrição, a.dtHora from professor as p
	join avaliacao as a on a.fkProf = p.idProf
    join grupo as g on a.fkGrupo = g.idGrupo
    where g.nomeGrupo = 'green house';
    
-- exibir os nomes dos grupos que foram avaliados por um determinado prof
select g.nomeGrupo as 'Grupo', p.nomeProf as 'Professor' from professor as p
	join avaliacao as a on p.idProf = a.fkProf
    join grupo as g on a.fkGrupo = g.idGrupo
    where p.nomeProf = 'frizza';
    
-- exibir dados dos grupos, alunos correspondentes, dos professores que avaliaram, dt e hora
select g.nomeGrupo, g.descrição, aluno.nome as 'nome do aluno', p.nomeProf, a.dtHora
	from grupo as g join aluno on g.idGrupo = aluno.fkGrupo
    join avaliacao as a on g.idGrupo = a.fkGrupo
    join professor as p on a.fkProf = p.idProf;
    
-- exibir a qntd de notas distintas
select distinct nota from avaliacao;

-- exibir o id do prof (fk ou nome), a media das notas, soma das notas, agrupadas por professor
select p.nomeProf as 'nome do prof', truncate(avg (a.nota), 2) as 'média', truncate(sum(a.nota), 2) as 'soma' from professor as p
	join avaliacao as a on p.idProf = a.fkProf
    group by p.nomeProf;
    
-- exibir o id do grupo, media das notas, soma das notas, agrupadas pro grupo
select g.nomeGrupo as 'nome do grupo', truncate(avg(a.nota), 2) as 'media', truncate(sum(a.nota),2) as 'soma' from grupo as g
	join avaliacao as a on g.idGrupo = a.fkGrupo
    group by g.nomeGrupo;

-- exibir o id do prof, menor e max nota, agrupada por prof
select p.idProf as 'professor', max(a.nota), min(a.nota) from professor as p
	join avaliacao as a on p.idProf = a.fkProf
    group by p.idProf;
    
-- exibir o id do grupo, menor e max nota, agrupada pro grupo
select g.idGrupo as 'grupo', max(a.nota) as 'nota maxima', min(a.nota) as 'nota minima' from grupo as g
	join avaliacao as a on g.idGrupo = a.fkGrupo
    group by g.idGrupo;

-- OUTRAS PRATICAS
select truncate (avg(nota), 2) from avaliacao;-- a media é 7.61

select nota from avaliacao;		-- so vai mostrar 4 notas, pq essas 4 são maior que 7.61

	-- exibir as notas maiores que a media
select avaliacao.nota from avaliacao 
	where nota > (select truncate (avg(nota), 2) as 'media' from avaliacao);

-- concat
select concat('a maior nota foi ', max(nota)) as 'nota maxima' from avaliacao;

-- deletar
	-- delete from professor where idProf = 10001;

select * from aluno where nome like '_a%'; -- segunda letra
select * from aluno where nome like '%a_'; -- penultima letra

-- tabela dependente (conforme a modelagem) tem chave primaria composta

-- relacionamento forte = tabela independente (linha tracejada)
-- relacionamento fraco = tabela dependente (linha escurona)

-- relacionamento 1 pra 1, não pode repetir a fk; conceito unique (UQ na modelagem) = não pode repetir




