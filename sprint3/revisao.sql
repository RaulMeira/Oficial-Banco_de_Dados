create database revisao3;

use revisao3;

create table motorista (
id int primary key auto_increment,
nome varchar (45),
cnh char (11),
validade date,
categoria char (4),
check (categoria = 'B' or 'A')
);

insert into motorista values
(null, 'vivian', '12345678900', '2023-10-13', 'B');

select * from motorista;
-- current time_stamp

create table carro (
idCarro int primary key auto_increment,
modelo varchar (45),
placa char (7),
estado char (2),
fkMotora int unique,
foreign key (fkMotora) references motorista (id)
);

insert into carro values
(null, 'i30', 'ABC1234', 'SP', 1 );
-- relacionamento 1 pra 1, não pode repetir a fk; conceito unique (UQ na modelagem) = não pode repetir
select * from carro;

select * from motorista join carro
	on motorista.id = carro.fkMotora;
  
  -- =====================================================================
  
create table carroAuto (
id int primary key auto_increment,
modelo varchar (45),
placa char (7),
estado char (2)
);

insert into carroAuto values
(null, 'Jetta', 'DEF4567', 'SC');

create table motoraAuto (
idMotora int auto_increment,
fkCarro int, 
foreign key (fkCarro) references carroAuto (id),
PRIMARY KEY (idMotora, fkCarro),
cnh char (11),
validade date,
categoria char (4)
);

insert into motoraAuto values
(null, 1, '12345678911', '2023-09-08', 'b');
select * from motoraAuto;

alter table motoraAuto add column nome varchar(45) after fkCarro;

update motoraAuto set nome = 'luan' where fkCarro = 1;

select motoraAuto.nome as 'nome do Motorista', carroAuto.modelo as 'Modelo do carro'from carroAuto 
join motoraAuto on carroAuto.id = motoraAuto.fkCarro;

-- ====================================================================================================

create table motora (
idMotora int primary key auto_increment,
nome varchar (45),
cnh char (11),
validade date,
categoria char (4),
check (categoria = 'B' or categoria = 'A'),
fkCondPrincipal int, 
foreign key (fkCondPrincipal) references motora(idMotora)
);

drop table motora;

insert into motora (categoria) values
('C');

alter table motora drop check motora_chk_1;

insert into motora (nome) values
('SPtech');

insert into motora values 
(null, 'rafael', '13579008642', '2023-01-24', 'AB', null);
delete from motora;

update motora set fkCondPrincipal = 2 where idMotora = 1;

select * from motora;

select * from motora as motorista join motora as condutor 
	on condutor.idMotora = motorista.fkCondPrincipal;
    
select motorista.nome as 'nome do Motorista', condutor.nome as 'nome do Condutor' from motora as condutor
 join motora as motorista on motorista.fkCondPrincipal = condutor.idMotora;
 
 select concat ('A empresa ', motorista.nome, 'possui como principal condutor motorista ', condutor.nome, '.') as 'Relatório'
 from motora as motorista join motora as condutor
 on motorista.fkCondPrincipal = condutor.idMotora;

-- ================================================================================================================================
create table motoraAluguel (
id int primary key auto_increment,
nome varchar (45),
cnh char (11),
validade date,
categoria char (4)
);

insert into motoraAluguel value
(null, 'vivian', '12345678900', '2023-10-13', 'B');

create table carroAluguel (
idCarro int primary key auto_increment,
modelo varchar (45),
placa char (7),
estado char (2)
)auto_increment = 100;

drop table carroAluguel;

insert into carroAluguel values
(null, 'i30', 'ABC1234', 'SP');

create table Aluguel (
idAluguel int auto_increment,
fkMotora int,
fkCarro int,
foreign key (fkMotora) references motoraAluguel (id),
foreign key (fkCarro) references carroAluguel (idCarro),
primary key (idAluguel, fkMotora, fkCarro),
dtInicio datetime default current_timestamp, -- default current_timestamp = hora do computador
dtFIM datetime,
valor decimal (10, 2),
check (valor >= 0)
);

insert into Aluguel (fkMotora, fkCarro, valor) values 
(1, 100, 20.50);

select * from Aluguel join carroAluguel as carro 
	on Aluguel.fkCarro = carro.idCarro
    join motoraAluguel as motora on aluguel.fkMotora = motora.id;
	

