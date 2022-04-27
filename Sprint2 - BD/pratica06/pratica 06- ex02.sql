create database Campanha;
use Campanha;
drop database Campanha;
-- Cada organizador organiza mais de uma campanha de doação.
-- Cada campanha de doação é organizada por apenas um organizador.

create table organizador (
idOrganizador int primary key auto_increment,
organizadorExperiente int,
nome varchar(45),
rua varchar(45),
bairro varchar(45),
email varchar (45),
foreign key (organizadorExperiente) references organizador (idOrganizador)
)auto_increment = 30;

create table doacao ( -- chave primaria composta so qnd for tabela dependente
idDoacao int auto_increment,
categoria varchar (80),
instituição varchar (45),
constraint chkInstituição check
(instituição = 'Criança esperança' or instituição = 'Amigos do Bem'),      -- dthora datetime default current_timestamp = pra colocar horario do sistema
dtFinal date,
fkOrganizador int,
primary key (idDoacao, fkOrganizador),
foreign key (fkOrganizador) references organizador(idOrganizador)
)auto_increment = 500;


-- Um organizador mais experiente orienta outros organizadores novatos. Cada
	-- organizador novato é orientado apenas por um organizador mais experiente.

insert into Organizador values
(null, null, 'raul' , 'Julio sergio de Castro', 'Parque América', 'raul@live.com'),
(null, 30, 'Alexandre', 'Belmira Marin', 'Grajau', 'ale@live.com'),
(null, null, 'Diogo',  'Augusta', 'Centro', 'diogo@live.com'),
(null, 32, 'João', 'Paulista', 'Centro', 'joao@live.com');

insert into doacao values 
(null, 'alimentos', 'Criança esperança', '2022-02-24', 30),
(null, 'mascaras', 'Amigos do Bem', '2022-01-14', 31),
(null, 'roupas', 'Criança esperança', '2022-03-28', 30),
(null, 'produtos de higiene', 'Criança esperança', '2022-04-01', 32),
(null, 'roupas', 'Amigos do Bem', '2022-01-10', 33),
(null, 'cobertores', 'Criança esperança', '2022-03-18', 32);

-- e) Exibir todos os dados de cada tabela criada, separadamente.
select * from doacao;
select * from organizador;

-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.

-- g) Exibir os dados dos organizadores e os dados de suas respectivas campanhas.
select * from organizador as o join doacao as d
	on o.idOrganizador = d.fkOrganizador;
    
-- h) Exibir os dados de um determinado organizador (informar o nome (raul) do organizador na consulta) e os dados de suas respectivas campanhas.
select * from organizador as o join doacao as d
	on o.idOrganizador = d.fkOrganizador
		where nome = 'raul';
        
-- i) Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores.
select * from organizador as novato join organizador as experiente
	on  novato.organizadorExperiente = experiente.idOrganizador;
    
-- j) Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores, porém somente de um determinado organizador
		-- orientador (informar o nome do organizador orientador (raul) na consulta).
	select * from organizador as novato join organizador as experiente
		on novato.organizadorExperiente = experiente.idOrganizador
			where experiente.nome = 'raul';
        
-- l) Exibir os dados dos organizadores novatos, os dados das respectivas
		-- campanhas organizadas e os dados dos respectivos organizadores orientadores. 
select * from organizador as novato join doacao 
	on doacao.fkOrganizador = novato.idOrganizador 
    join organizador as experiente on novato.organizadorExperiente = experiente.idOrganizador;
    
-- m) Exibir os dados de um organizador novato (informar o seu nome na consulta (alexandre)),
	-- os dados das respectivas campanhas em que trabalha e os dados do seu organizador orientador.
select * from organizador as novato join doacao as d 
	on d.fkOrganizador = novato.idOrganizador
		join organizador as experiente on 
			novato.organizadorExperiente = experiente.idOrganizador
				where novato.nome = 'Alexandre';
       
-- concatenando dois campos na exibição -- TESTE CONCAT
 SELECT CONCAT(nome, ' - ', email) as 'nome e email' from organizador
	where idOrganizador = 30;