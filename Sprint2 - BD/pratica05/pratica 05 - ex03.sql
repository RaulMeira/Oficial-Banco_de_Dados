create database PraticaFuncionario;
use PraticaFuncionario;
-- Regra:
	-- Cada setor pode ter mais de um funcionário.
	-- Cada funcionário trabalha apenas em um setor.

create table Setor (
idSetor int primary key auto_increment,
nomeSetor varchar (45),
andar int
);

create table funcionario (
idFunc int primary key auto_increment,
nomeFunc varchar (45),
telefone varchar(45),
salario decimal (10,2),
check (salario > 0),
fkSetor int, foreign key (fkSetor) references Setor(idSetor)
) auto_increment = 100;

create table acompanhante (
idAcompanhante int,
nomeAcomp varchar (45),
relação varchar(45),
dtNasc date,
fkFunc int, foreign key(fkFunc) references funcionario(idFunc),
primary key (idAcompanhante,fkFunc)
);

-- Inserir dados nas tabelas, de forma que exista mais de um funcionário em cada setor cadastrado.
insert into setor values
(null, 'RH', 2),
(null, 'T.I', 3),
(null, 'Administração', 1);

insert into funcionario values
(null, 'Raul', '11959168156', '3000.00',2),
(null, 'João', '51984745466', '3500.00',3),
(null, 'Vivian', '11959109864', '1100.50',1),
(null, 'Edneide', '11957654321', '1500.00',1),
(null, 'Maria', '11982698110', '5000.00',2);

insert into acompanhante values
(1, 'Gustavo', 'filho', '2004-07-20', 100),
(2, 'Joana', 'Esposa', '1990-04-22', 103),
(3, 'Felipe', 'Marido', '2000-10-13', 101),
(4, 'Karla', 'Esposa', '2001-05-29', 100),
(5, 'Luiz', 'filho', '1998-06-30', 103),
(6, 'Gustavo', 'Marido', '2004-07-20', 102),
(7, 'Larissa', 'filha', '2002-02-10', 100);

-- Exibir todos os dados de cada tabela criada, separadamente.
select * from setor;
select * from funcionario;
select * from acompanhante;

-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.
	-- Fiz na criação :)
    
-- Exibir os dados dos setores e dos seus respectivos funcionários.
select * from setor join funcionario
	on funcionario.fkSetor = setor.idSetor;
    
-- Exibir os dados de um determinado setor (informar o nome do setor na consulta) e dos seus respectivos funcionários.
select * from Setor as s join funcionario as f
	on s.idSetor = f.fkSetor
		where nomeSetor = 'T.I'; -- setor escolhido foi T.I
		
-- Exibir os dados dos funcionários e de seus acompanhantes.
select * from funcionario as f join acompanhante as a
	on f.idFunc = a.fkFunc;
    
-- teste com left
select * from funcionario as f left join acompanhante as a
	on f.idFunc = a.fkFunc;
    
-- Exibir os dados de apenas um funcionário (informar o nome do funcionário) e os dados de seus acompanhantes.
select * from funcionario as f join acompanhante as a
	on f.idFunc = a.fkFunc
		where nomeFunc = 'Raul';
        
-- Exibir os dados dos funcionários, dos setores em que trabalham e dos seus acompanhantes.
select * from funcionario as f join setor as s join acompanhante as a
	on f.fkSetor = s.idSetor and f.idFunc = a.fkFunc;