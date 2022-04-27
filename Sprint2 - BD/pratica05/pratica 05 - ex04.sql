-- Regra:
	-- Cada treinador treina mais de um nadador.
	-- Cada nadador tem apenas um treinador.
	-- nadador = fk
create database treinador;
use treinador;

create table nadador (
idNadador int primary key auto_increment,
nomeNadador varchar (45),
estado char (2),
constraint chkEstado check (estado = 'sp' or estado = 'rj' or estado = 'sc'),
dtNasc date,
fkTreinador int,
foreign key (fkTreinador) references Treinador(idTreinador)
)auto_increment = 100;

create table treinador (
idTreinador int primary key auto_increment,
nomeTreinador varchar (45),
telefone varchar (45),
fkExperiente int,
foreign key (fkExperiente) references treinador(idTreinador)
)auto_increment = 10;

create table acompanhante (
idAcomp int auto_increment,
nome varchar (45),
fkNadador int,
primary key (idAcomp, fkNadador),
foreign key (fkNadador) references Nadador (idNadador)
)auto_increment = 500;

insert into Treinador values
(null, 'João', '11975103225',  null),
(null, 'Sofia', '11975103227',  null),
(null, 'Ana', '11975103234',  10),
(null, 'Lucas', '11975103435',  10),
(null, 'Gabi', '11975103456', 11),
(null, 'Arthur', '11975105345',  11);

insert into Nadador (nomeNadador, estado, dtNasc) values
('Marivaldo', 'sp', '1972-06-22'),
('Katia', 'rj', '1973-03-08'),
('Caique', 'sc', '2000-04-24'),
('Caue', 'sc', '2012-12-22'),
('Miguel', 'sp', '1998-12-23'),
('Davi', 'sp', '2008-08-07'),
('Ronaldo', 'rj', '1982-06-05');

insert into Acompanhante values
(null, 'Karina',  100),
(null, 'Carol',  101),
(null, 'Nadia',  102),
(null, 'Renata',  102),
(null, 'Solange',  103);

-- Regra:
	-- Um treinador mais experiente orienta outros treinadores novatos.
    -- Cada treinador novato é orientado apenas por um treinador.
    -- treinadorExperiente = fk

-- d) Inserir dados nas tabelas, de forma que exista mais de um nadador para algum treinador, e mais de um treinador sendo orientado por algum treinador mais
-- experiente.
update Nadador set fkTreinador = 10 where idNadador =  100;
update Nadador set fkTreinador = 11 where idNadador =  101;
update Nadador set fkTreinador = 12 where idNadador =  102;
update Nadador set fkTreinador = 13 where idNadador =  103;
update Nadador set fkTreinador = 14 where idNadador =  104;
update Nadador set fkTreinador = 15 where idNadador =  105;
update Nadador set fkTreinador = 15 where idNadador =  106;

-- e) Exibir todos os dados de cada tabela criada, separadamente.
select * from Nadador;
select * from treinador;
select * from Acompanhante;

-- g) Exibir os dados dos treinadores e os dados de seus respectivos nadadores.
select * from treinador join nadador
	on treinador.idTreinador = nadador.fkTreinador;

-- h) Exibir os dados de um determinado treinador (informar o nome do treinador na consulta) e os dados de seus respectivos nadadores.
select * from treinador as t join nadador as n
	on t.idTreinador = n.fkTreinador
		where t.nomeTreinador = 'João';

-- i) Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores.
select * from treinador as novato join treinador as experiente
	on experiente.idTreinador = novato.fkExperiente;
    
-- j) Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores, porém somente de um determinado 
	-- treinador orientador (informar o nome do treinador na consulta).
select * from treinador as novato join treinador as experiente
	on novato.fkExperiente = experiente.idTreinador
		where experiente.nomeTreinador = 'Sofia';

-- l) Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados dos respectivos treinadores orientadores.
select * from treinador as novato join nadador
	on novato.idTreinador = nadador.fkTreinador
    join treinador as experiente
		on novato.fkExperiente = experiente.idTreinador;
        
-- m) Exibir os dados de um treinador (informar o seu nome na consulta), os dados dos respectivos nadadores e os dados do seu treinador orientador
select * from treinador as novato join nadador 
	on novato.idTreinador = nadador.fkTreinador
		join treinador as experiente
			on experiente.idTreinador = novato.fkExperiente
            where novato.nomeTreinador = 'Lucas';
            
-- NOME NADADOR + NOVATO + EXPERIENTE (OBS: COM CONCAT E AS)
select Nadador.nome as Nadador, concat(novato.nome, ' - ', experiente.nome) as 'Novato - Experiente'
	from Nadador join Treinador as Novato on Novato.idTreinador = Nadador.fkTreinador
		join Treinador as Experiente on Experiente.idTreinador = Novato.fkExperiente;
            
-- DADOS NADADOR + ACOMPANHANTE
select * from nadador join acompanhante
	on nadador.idNadador = acompanhante.fkNadador;
    
-- DADOS NADADOR + ACOMPANHANTE (OBS: INFORMAR O DADO DE UM ACOMPANHANTE NA CONSULTA)
select * from nadador join acompanhante
	on nadador.idNadador = acompanhante.fkNadador
		where acompanhante.nome = 'Karina';

-- NOME NADADOR + ACOMPANHANTE (OBS: NOME NADADOR ORDEM CRESCENTE)
select nadador.nome as nadador, acompanhante.nome as acompanhante from nadador
	join acompanhante on nadador.idNadador = acompanhante.fkNadador order by Nadador.nome;
        
-- NOME NADADOR + ACOMPANHANTE (OBS: NOME ACOMPANHANTE ORDEM DECRESCENTE)

        
-- NOME NADADOR + ACOMPANHANTE + NOVATO + EXPERIENTE
select nadador.nome as nadador, acompanhante.nome as acompanhante, novato.nome as novato, experiente.nome as experiente
	from nadador join acompanhante on nadador.idNadador = acompanhante.fkNadador
    join treinador as novato on nadador.fkTreinador = novato.idTreinador
    join treinador as experiente on novato.fkExperiente = experiente.idTreinador;
        
-- NOME NADADOR + ACOMPANHANTE + NOVATO + EXPERIENTE (OBS: COMEÇA LETRA NOME NADADOR 'R')

                
-- NOME NADADOR + ACOMPANHANTE + NOVATO + EXPERIENTE (OBS: TERMINA LETRA NOME EXPERIENTE 'O')

                
-- NOME NADADOR + ACOMPANHANTE + NOVATO + EXPERIENTE (OBS: SEGUNDA LETRA NOME NOVATO 'A')

                
-- NOME NADADOR + ACOMPANHANTE + NOVATO + EXPERIENTE (OBS: PENULTIMA LETRA NOME NOVATO 'U')
