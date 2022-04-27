use sprint2;
 
create table Pessoa (
idPessoa int primary key auto_increment,
nome varchar(45),
dtNasc date,
profissão varchar (45)
);

create table Gasto (
idGasto int primary key auto_increment,
dtGas date,
valor decimal (10,2),
descrição varchar (100),
fkPessoa int, 
foreign key (fkPessoa) references Pessoa(idPessoa)
);

-- Insira dados nas tabelas.
insert into Pessoa values
(null, 'Raul', '2004-07-20', 'Estudante'),
(null, 'Cecilia', '1997-05-05', 'Analista'),
(null, 'Maria', '1970-04-30', 'Dona de casa'),
(null, 'Jaime', '1965-01-23', 'Gerente de Logística');

insert into Gasto values 
(null, '2022-04-04', 100.50, 'Jogo do Palmeiras', 1),
(null, '2022-02-02', 250.00, 'Tenis vans', 1),
(null, '2022-03-20', 20.00, 'Lanche', 2),
(null, '2022-01-15', 98.50, 'Cinema', 3),
(null, '2022-04-01', 50.75, 'Parafusos', 4),
(null, '2022-02-27', 40.00, 'Caixa de cerveja', 4);


-- Exiba os dados de cada tabela individualmente.
select * from Gasto;
select * from Pessoa;

-- Exiba somente os dados de cada tabela, mas filtrando por algum dado da tabela 
				-- (por exemplo, as pessoas de alguma profissão, etc).
select * from Pessoa where profissão = 'estudante';
select * from Gasto where descrição = 'Tenis vans';

-- Exiba os dados das pessoas e dos seus gastos correspondentes.
select * from Pessoa join Gasto
	on Pessoa.idPessoa = Gasto.fkPessoa;
    
-- Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes.
select * from Pessoa join Gasto
	on Pessoa.idPessoa = Gasto.fkPessoa
    where nome = 'Raul';
    
-- Atualize valores já inseridos na tabela.
update Gasto set descrição = 'Jogo do Palmeiras' where idGasto = 3;
update Gasto set descrição = 'Rodizio de pizza' where idGasto = 4;
update Gasto set descrição = 'Tenis da nike' where idGasto = 2;

-- Exclua um ou mais registros de alguma tabela.
delete from Gasto where idGasto = 3;

-- teste com left
select * from Pessoa left join Gasto
	on Pessoa.idPessoa = Gasto.fkPessoa;