use sprint2;

create table Professor (
idProfessor int primary key auto_increment,
nome varchar (50),
sobrenome varchar (30),
especialidade1 varchar (40),
especialidade2 varchar (40),
fk_Disciplina int, -- adicionando o campo chave estrangeira
foreign key (fk_Disciplina) references Disciplina(idDisc) -- referenciado a chave estrangeira
);

insert into Professor values
(null, 'Vivian', 'Souza', 'Calculo', 'Dados', 1 ),
(null, 'Leandro', 'Meira', 'Calculo', 'Geometria', 1 ),
(null, 'Patrick', 'Moreira', 'Dados', 'Socioemocional', 2 ),
(null, 'João', 'Silva', 'Zoologia', 'Animais', 3 ),
(null, 'Vanessa', 'Costa', 'Animais', 'Herbiologia', 3 ),
(null, 'Maria', 'Santos', 'Geometria', 'Lógica', 1 );

create table Disciplina (
idDisc int primary key auto_increment,
nomeDisc varchar (45)
);

insert into Disciplina values
(null, 'Matemática'),
(null, 'Banco de Dados'),
(null, 'Biologia');

select * from Disciplina;

-- Exibir os professores e suas respectivas disciplinas;
select * from Professor
	join Disciplina on Disciplina.idDisc = Professor.fk_Disciplina;

-- Exibir apenas o nome da disciplina e o nome do respectivo professor;
select Disciplina.nomeDisc, Professor.nome from Professor
	join Disciplina on Disciplina.idDisc = Professor.fk_Disciplina
    WHERE Disciplina.nomeDisc = 'Matemática';
    
-- Exibir os dados dos professores, suas respectivas disciplinas de um determinado sobrenome;
select * from Professor as p
	join  Disciplina as d on d.idDisc = p.fk_Disciplina
    where p.sobrenome = 'Souza';
    
-- Exibir apenas a especialidade1 e o nome da disciplina, de um determinado (Vanessa)
			-- professor, ordenado de forma crescente pela especialidade1;
select Professor.especialidade1, d.nomeDisc from Professor
	join Disciplina as d on d.idDisc = Professor.fk_Disciplina
    where Professor.nome = 'Vanessa' order by especialidade1;
