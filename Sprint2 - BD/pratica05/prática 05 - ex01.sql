-- Fazer a modelagem lógica (DER) de um sistema para um pet shop cadastrar os pets e seus donos (clientes).
-- Regra de negócio:
	-- Cada pet pertence somente a um cliente.
    -- Cada cliente pode ter mais de um pet cadastrado.
use sprint2;

create table cliente (
idCliente int primary key auto_increment,
nome varchar (45),
sobrenome varchar (45),
telefone_fixo varchar (45),
telefone_celular varchar (45),
CEP char (9),
bairro varchar (45),
NumeroCasa int
);

drop table cliente;
create table pet (
idPet int primary key auto_increment,
tipo varchar (45),
nomePet varchar(45),
raça varchar (50),
dtNasc date,
fkCliente int, foreign key(fkCliente) references cliente(idCliente)
) auto_increment = 100;

insert into pet values
(null, 'cachorro', 'Rex', 'Pitbull', '2009-10-12', 1),
(null, 'cachorro', 'Nina', 'Poodle',  '2007-12-18', 1),
(null, 'gato', 'Miau', 'de rua',  '2012-03-15', 2),
(null, 'passaro', 'blue', 'Arara-azul',  '2013-06-08', 3),
(null, 'cachorro', 'Ninão', 'Vira lata',  '2007-09-29', 4);


insert into cliente values 
(null, 'Vivian', 'Meira', 1159355236, null, '04822-180', 'Grajau', 202), 
(null, 'Raul', 'Meira', 1180906262, 11987623134, '08233-140', 'Parque América', 400), 
(null, 'Otavio', 'Augusto', null, 11984745466, '04166-198', 'Ibirapuera', 202), 
(null, 'Luizão', 'Souza', 1159355236, null, '04855-151', 'Pedreira', 152);

-- Exibir todos os dados de cada tabela criada, separadamente.
select * from cliente; 
select * from pet;

-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.
	-- Fiz na criação sz
    
-- Altere o tamanho da coluna nome do cliente.
alter table cliente modify column nome varchar (60);
desc cliente;

-- Exibir os dados de todos os pets que são de um determinado tipo (por exemplo: cachorro).
select * from pet where tipo = 'cachorro';

-- Exibir apenas os nomes e as datas de nascimento dos pets.
select nomePet, dtNasc from pet;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome.
select * from pet order by nomePet;

-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro.
select * from cliente order by bairro;

-- Exibir os dados dos pets cujo nome comece com uma determinada letra.
select * from pet where nomePet like 'n%';

-- Exibir os dados dos clientes que têm o mesmo sobrenome.
select * from cliente where sobrenome = "meira";

-- Alterar o telefone de um determinado cliente.
update cliente set telefone_fixo = 5158213221 where idCliente = 4;

-- Exibir os dados dos clientes para verificar se alterou.
select * from cliente;

-- Exibir os dados dos pets e dos seus respectivos donos.
select * from pet as p join cliente as c
	on c.idCliente = p.fkCliente;
    
-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado cliente (Vivian).
select * from pet as p join cliente as c
	on c.idCliente = p.fkCliente
    where nome = 'Vivian';

-- Excluir algum pet.
delete from pet where idPet = 104;

-- Exibir os dados dos pets para verificar se excluiu.
select * from Pet;
select * from cliente;

-- teste do left e right
select * from pet as p left join cliente as c
	on c.idCliente = p.fkCliente;

-- Excluir as tabelas.
drop table pet;
drop table cliente;

