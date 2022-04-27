create database sprint2;
use sprint2;
create table Curso (
idCurso int primary key auto_increment,
nome varchar (50),
sigla varchar (3),
coordenador varchar (50)
);
insert into Curso values
(null, 'Ciencia da Computação', 'CCO', 'Thiago'),
(null, 'Analise e Desenvolvimento de Sistemas', 'ADS', 'Vivian'),
(null, 'Administração', 'ADM', 'Raul');

 -- REGRA DE NEGÓCIO: 1 curso tem 1 ou varias matérias
				   -- 1 matéria só tem em 1 curso
                
create table Matérias (
idMateria int primary key auto_increment,
nomeMateria varchar (50),
fkCurso int,
foreign key (fkCurso) references Curso(idCurso)
);

insert into Matérias values
(null, 'Algoritmo', 2),
(null, 'Banco de Dados', 2),
(null, 'Calculo', 3),
(null, 'Arquitetura Computacional', 1),
(null, 'Gestão de Finanças', 3),
(null, 'Sistemas Operacionais', 1);
    

-- Faça um JOIN entre as duas tabelas;
select * from Matérias
	join Curso on Curso.idCurso = Matérias.fkCurso;
    
-- Faça um JOIN com WHERE entre as duas tabelas;
select * from Matérias
	join Curso on Curso.idCurso = Matérias.fkCurso
    where Curso.nome = 'Analise e Desenvolvimento de Sistemas';
    
-- Crie um campo com a restrição (constraint) de CHECK;
alter table Matérias add column Dificuldade varchar (30) constraint chkDificuldade check 
		(dificuldade = 'fácil' or dificuldade = 'dificil' or dificuldade = 'médio');


        


