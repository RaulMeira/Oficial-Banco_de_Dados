-- CRIAÇÃO DO BANCO DE DADO
create database Estudos;

-- USANDO O BANCO DE DADO
use Estudos;

-- CRIAÇÃO DAS TABELA TREINADOR (COM FK)
create table Treinador (
idTreinador int primary key auto_increment,
nome varchar(45),
celular char(11),
email varchar(45),
fkExperiente int,
foreign key (fkExperiente) references Treinador(idTreinador)
) auto_increment = 10;

-- CRIAÇÃO DA TABELA NADADOR (SEM FK)
create table Nadador (
idNadador int primary key auto_increment,
nome varchar(45),
estado char(2),
dtNasc date
) auto_increment = 100;

-- CRIAÇÃO DA TABELA ACOMPANHANTE (COM CHAVE COMPOSTA E FK)
create table Acompanhante (
idAcompanhante int,
nome varchar(45),
tipo varchar(45),
fkNadador int,
foreign key (fkNadador) references Nadador(idNadador),
primary key (idAcompanhante, fkNadador)
);

-- DESCRIÇÃO DAS TABELAS CRIADAS
desc Treinador;
desc Nadador;
desc Acompanhante;

-- INSERINDO DADO NAS TABELAS
insert into Treinador (nome, celular, email, fkExperiente) values
('João', '11975103225', 'joao@gmail.com', null),
('Sofia', '11975103227', 'sofia@gmail.com', null),
('Ana', '11975103234', 'ana@gmail.com', 10),
('Lucas', '11975103435', 'lucas@gmail.com', 10),
('Gabi', '11975103456', 'gabi@gmail.com', 11),
('Arthur', '11975105345', 'arthur@gmail.com', 11);

insert into Nadador (nome, estado, dtNasc) values
('Marivaldo', 'BA', '1972-06-22'),
('Katia', 'SP', '1973-03-08'),
('Caique', 'MA', '2000-04-24'),
('Caue', 'GO', '2012-12-22'),
('Miguel', 'ES', '1998-12-23'),
('Davi', 'MT', '2008-08-07'),
('Ronaldo', 'AC', '1982-06-05');

insert into Acompanhante values
(1, 'Karina', 'Prima', 100),
(1, 'Carol', 'Irmã', 101),
(1, 'Nadia', 'Mãe', 102),
(2, 'Renata', 'Padrinha', 102),
(1, 'Solange', 'Tia', 103);

-- SELECIONANDO O DADO DE CADA TABELA
select * from Treinador;
select * from Nadador;
select * from Acompanhante;

-- ADICIONANDO FK NA TABELA NADADOR
alter table Nadador add column fkTreinador int,
	add foreign key (fkTreinador) references Treinador(idTreinador);
    
-- ADICIONANDO DADOS NA COLUNA FK
update Nadador set fkTreinador = 10 where idNadador = 100;
update Nadador set fkTreinador = 11 where idNadador = 101;
update Nadador set fkTreinador = 12 where idNadador = 102;
update Nadador set fkTreinador = 13 where idNadador = 103;
update Nadador set fkTreinador = 14 where idNadador = 104;
update Nadador set fkTreinador = 15 where idNadador = 105;
update Nadador set fkTreinador = 15 where idNadador = 106;

-- SELECTS

-- DADOS NADADORES + TREINADOR
select * from Nadador
	join Treinador on Nadador.fkTreinador = Treinador.idTreinador;

-- DADOS NADADORES + TREINADOR (OBS: INFORMAR O DADO DE UM TREINADOR NA CONSULTA)
select * from Nadador
	join Treinador on Nadador.fkTreinador = Treinador.idTreinador
		where Treinador.nome = 'Arthur';
	
-- DADOS NOVATOS + EXPERIENTES
select * from Treinador as Novato
	join Treinador as Experiente
		on Experiente.idTreinador = Novato.fkExperiente;
        
-- DADOS NOVATOS + EXPERIENTES  (OBS: INFORMAR O DADO DE UM EXPERIENTE NA CONSULTA)
select * from Treinador as Novato
	join Treinador as Experiente
		on Experiente.idTreinador = Novato.fkExperiente
			where Experiente.nome = 'João';
           
-- DADOS NADADOR + NOVATO + EXPERIENTE
select * from Nadador
	join Treinador as Novato on Novato.idTreinador = Nadador.fkTreinador
		left join Treinador as Experiente on Novato.fkExperiente = Experiente.idTreinador;
        
-- DADOS NADADOR + NOVATO + EXPERIENTE (OBS: INFORMAR O DADO DE UM NOVATO NA CONSULTA)
select * from Nadador
	join Treinador as Novato on Novato.idTreinador = Nadador.fkTreinador
		left join Treinador as Experiente on Novato.fkExperiente = Experiente.idTreinador
			where Novato.nome = 'Lucas';
            
-- NOME NADADOR + NOVATO + EXPERIENTE (OBS: COM CONCAT E AS)
select Nadador.nome as Nadador, concat(novato.nome, ' - ', experiente.nome) as 'Novato - Experiente'
	from Nadador join Treinador as Novato on Novato.idTreinador = Nadador.fkTreinador
		join Treinador as Experiente on Experiente.idTreinador = Novato.fkExperiente;
            
-- DADOS NADADOR + ACOMPANHANTE
select * from Nadador
	left join Acompanhante on Acompanhante.fkNadador = Nadador.idNadador;
    
-- DADOS NADADOR + ACOMPANHANTE (OBS: INFORMAR O DADO DE UM ACOMPANHANTE NA CONSULTA)
select * from Nadador
	left join Acompanhante on Acompanhante.fkNadador = Nadador.idNadador
		where Acompanhante.nome = 'Solange';

-- NOME NADADOR + ACOMPANHANTE (OBS: NOME NADADOR ORDEM CRESCENTE)
select * from Nadador
	left join Acompanhante on Acompanhante.fkNadador = Nadador.idNadador
		order by Nadador.nome asc;
        
-- NOME NADADOR + ACOMPANHANTE (OBS: NOME ACOMPANHANTE ORDEM DECRESCENTE)
select * from Nadador
	left join Acompanhante on Acompanhante.fkNadador = Nadador.idNadador
		order by Acompanhante.nome desc;
        
-- NOME NADADOR + ACOMPANHANTE + NOVATO + EXPERIENTE
select Nadador.nome as Nadador, Acompanhante.nome as Acompanhante, Novato.nome as Novato, Experiente.nome as Experiente from Nadador
	join Treinador as Novato on Novato.idTreinador = Nadador.fkTreinador
		left join Treinador as Experiente on Experiente.idTreinador = Novato.fkExperiente
			left join Acompanhante on Acompanhante.fkNadador = Nadador.idNadador;
        
-- NOME NADADOR + ACOMPANHANTE + NOVATO + EXPERIENTE (OBS: COMEÇA LETRA NOME NADADOR 'R')
select Nadador.nome as Nadador, Acompanhante.nome as Acompanhante, Novato.nome as Novato, Experiente.nome as Experiente from Nadador
	join Treinador as Novato on Novato.idTreinador = Nadador.fkTreinador
		left join Treinador as Experiente on Experiente.idTreinador = Novato.fkExperiente
			left join Acompanhante on Acompanhante.fkNadador = Nadador.idNadador
				where Nadador.nome like 'R%';
                
-- NOME NADADOR + ACOMPANHANTE + NOVATO + EXPERIENTE (OBS: TERMINA LETRA NOME EXPERIENTE 'O')
select Nadador.nome as Nadador, Acompanhante.nome as Acompanhante, Novato.nome as Novato, Experiente.nome as Experiente from Nadador
	join Treinador as Novato on Novato.idTreinador = Nadador.fkTreinador
		left join Treinador as Experiente on Experiente.idTreinador = Novato.fkExperiente
			left join Acompanhante on Acompanhante.fkNadador = Nadador.idNadador
				where Experiente.nome like '%O';
                
-- NOME NADADOR + ACOMPANHANTE + NOVATO + EXPERIENTE (OBS: SEGUNDA LETRA NOME NOVATO 'A')
select Nadador.nome as Nadador, Acompanhante.nome as Acompanhante, Novato.nome as Novato, Experiente.nome as Experiente from Nadador
	join Treinador as Novato on Novato.idTreinador = Nadador.fkTreinador
		left join Treinador as Experiente on Experiente.idTreinador = Novato.fkExperiente
			left join Acompanhante on Acompanhante.fkNadador = Nadador.idNadador
				where Novato.nome like '_A%';
                
-- NOME NADADOR + ACOMPANHANTE + NOVATO + EXPERIENTE (OBS: PENULTIMA LETRA NOME NOVATO 'U')
select Nadador.nome as Nadador, Acompanhante.nome as Acompanhante, Novato.nome as Novato, Experiente.nome as Experiente from Nadador
	join Treinador as Novato on Novato.idTreinador = Nadador.fkTreinador
		left join Treinador as Experiente on Experiente.idTreinador = Novato.fkExperiente
			left join Acompanhante on Acompanhante.fkNadador = Nadador.idNadador
				where Novato.nome like '%U_';

