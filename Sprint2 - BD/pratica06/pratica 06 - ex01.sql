-- Cada aluno participa apenas de um projeto. (aluno tem a fk de projeto)
-- Cada projeto pode ter a participação de um ou mais alunos.
-- Cada aluno pode trazer zero ou mais acompanhantes.  (acompanhante com a kf de aluno)

-- (aluno tem chave primaria composta (aluno normal e aluno representante)
-- Cada aluno é representado apenas por um aluno.

create database AlunoProjeto;
use AlunoProjeto;
drop database AlunoProjeto;

create table Aluno(
ra int primary key,
nome varchar(45),
telefone varchar (45),
alunoResponsavel int,
foreign key (alunoResponsavel) references Aluno(ra),
fkProjeto int,
foreign key (fkProjeto) references Projetos(idProjeto)
);

create table Projetos (
idProjeto int primary key auto_increment,
nome varchar(45),
descrição varchar(100)
);

-- Ha alguns alunos que atuam como representantes de outros alunos. 
create table Acompanhantes (
idAcompanhante int  auto_increment,
nome varchar (45),
relação varchar (45),
fkAluno int,
primary key (idAcompanhante, fkAluno), 
foreign key (fkAluno) references Aluno(ra)
) auto_increment=100;

-- alter table Aluno add column fkProjeto int,
	-- add foreign key (fkProjeto) references Projetos(idProjeto);
    
-- Inserir dados nas tabelas.

insert into Aluno values
(01221, 'raul', '11959168156', null, 2),
(01231, 'vivian', '11901739280', 01221, 1),
(01241, 'joão', '11951805286', null, 3),
(01251, 'kevin', '11987652156', null, 1),
(01261, 'maicon', '11984745466', 01241, 2);

insert into Projetos values
(null, 'Greenhouse', 'Estufa'), 
(null, 'Move sports', 'Monitoramento de corredores'), 
(null, 'Sensor estacionamento', 'Estacionamento');

insert into Acompanhantes values
(null, 'Arthur', 'filho', 01221),
(null, 'amigo', 'primo', 01251),
(null, 'José', 'tio', 01241),
(null, 'Juliana', 'filha', 01231),
(null, 'Gabriela', 'esposa', 01221),
(null, 'Maria', 'marido', 01231);

-- Exibir todos os dados de cada tabela criada, separadamente.
-- select * from Projetos;
select * from Acompanhantes;
select * from Aluno;
select * from Projetos;

-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.

-- Exibir os dados dos alunos e dos projetos correspondentes.
select * from Aluno join Projetos
	on Aluno.fkProjeto = Projetos.idProjeto;
    
-- Exibir os dados dos alunos e dos seus acompanhantes.
select * from Aluno as a join Acompanhantes as acomp 	
	on a.ra = acomp.fkAluno;
    
-- Exibir os dados dos alunos e dos seus representantes.
select * from Aluno as Aluno left join Aluno as AlunoRepresentante
	on aluno.ra = AlunoRepresentante.AlunoResponsavel;
    
-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente
	-- de um determinado projeto (indicar o nome do projeto na consulta(greenhouse)).
select * from Aluno join Projetos as p
	on aluno.fkProjeto = p.idProjeto
		where p.nome = 'Greenhouse';

-- Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes.
select * from Aluno as a join Projetos as p 
	on a.fkProjeto = p.idProjeto 
    join Acompanhantes as acomp on a.ra = acomp.fkAluno;

