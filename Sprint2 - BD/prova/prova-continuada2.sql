-- tabela dependente = linha escurona
-- tabela independente = linha tracejada
-- tabela dependente tem chave primaria composta

-- Crie um banco de dados chamado Continuada2. 
create database Continuada2;

-- Selecione o banco de dados Continuada2. 
use Continuada2;

-- Regra de negócio:
	-- Pensando em um rede de hotéis, cada hotel tem um ou muitos quartos e cada quarto é de um e somente um hotel. 
		-- O sistema precisa guardar o hotel matriz e suas filiais;
        
        -- 1 hotel pode ter 1 ou varios quartos, e 1 quarto só é de 1 hotel (fkHotel);
        -- 1 matriz pode ter 1 ou varias filiais, e 1 filial só pode ter uma matriz (fkMatriz);
        
-- Questão 1 - (3 pontos)
	-- Criar o modelo lógico no MySQL Workbench;

-- Questão 2 - (2 pontos)
-- Criar a tabela chamada Hotel para conter os dados: 
	-- idHotel, nome, endereço. Sendo idHotel um valor numérico do tipo inteiro e chave primária da tabela.
    
create table hotel (
idHotel int primary key auto_increment,
nome varchar (45),
CEP varchar (45), -- endereço subdividido em 2 partes: CEP e numero
numero int,
fkMatriz int,
foreign key (fkMatriz) references hotel(idHotel)
);

-- Criar a tabela chamada Quarto para conter os dados: idQuarto, nome, andar, tipo (pode ser cama casal ou solteiro).

create table Quarto (
idQuarto int auto_increment,
nome varchar(45),
andar int,
tipo varchar (45),
constraint chkTipo check (tipo = 'casal' or tipo = 'solteiro'),
fkHotel int,
primary key (idQuarto, fkHotel),
foreign key (fkHotel) references hotel (idHotel)
)auto_increment= 10;

-- O nome do quarto pode repetir, exemplo: 
	-- Hotel SpTech, quarto Mário Bros.
    -- Hotel Consultoria, quarto Mário Bros.

	-- Configurar as chaves primárias e as chaves estrangeiras de acordo com a sua modelagem.
		-- fiz na criação :) sz
        
-- Questão 3 - (1 ponto)
	-- Inserir pelo menos 5 hotéis e 5 quartos;
    insert into hotel values
    (null, 'Sptech', '04822-180', 202, null);
    
    insert into hotel values
    (null, 'Ibis', '04811-120', 303, null),
    (null, 'Ibis-sp', '04811-175', 800, 2),
    (null, 'Consultoria', '05311-520', 500, 1),
    (null, 'Nike', '04811-790', 1235, null),
    (null, 'Nike-rj', '04117-640', 436, 5);
    
    -- quarto
    insert into quarto values 
    (null, 'Amarelo', 2, 'casal', 1);
    
    insert into quarto values 
    (null, 'Verde', 6, 'solteiro', 2),
    (null, 'Bob esponja', 8, 'casal', 3),
    (null, 'Estrela', 4, 'casal', 4),
    (null, 'Cobertura', 12, 'solteiro', 5),
    (null, 'Sacada', 11, 'solteiro', 6),
    (null, 'Duplex', 10, 'casal', 5);

-- Questão 4 - (3 pontos)
	-- Execute os comandos para: 

-- a) Exibir todos os dados das tabelas separadamente. 
select * from hotel;
select * from quarto;

-- b) Exibir os dados dos hotéis e seus respectivos quartos.
select * from hotel join quarto
	on hotel.idHotel = quarto.fkHotel;
    
-- c) Exibir apenas o nome do hotel e o nome dos respectivos quartos do tipo 'solteiro';
select hotel.nome as NomeHotel, quarto.nome as NomeQuarto from hotel
	join quarto on hotel.idHotel = quarto.fkHotel
		where quarto.tipo = 'solteiro';
        
-- d) Exibir os dados dos hotéis e sua respectiva matriz;
select * from hotel as filial left join hotel as matriz
	on filial.fkMatriz = matriz.idHotel; -- left pra mostrar todos os hoteis, até os que não tem matriz

 -- select * from hotel as filial join hotel as matriz
	-- on filial.fkMatriz = matriz.idHotel; -- assim pra mostrar só os que tem matriz

-- e) Exibir apenas o nome e o andar de um determinado quarto que contém uma determinado caracter; (like '%s%')
select quarto.nome, quarto.andar from quarto
	where nome like '%s%';
    
-- f) Atualize o tipo de algum quarto. Exiba novamente os dados da tabela após a atualização. 
update quarto set tipo = 'solteiro' where idQuarto = 10; -- era casal e virou solteiro
select * from quarto;

-- g) Exclua algum quarto da tabela. Exiba novamente os dados da tabela após a exclusão. 
delete from quarto where idQuarto = 10;
select * from quarto;

-- Questão 5 - (1 ponto)
	-- Exibir os dados dos hotéis, sua respectiva matriz e quartos. 
		-- Pode escolher os campos e apelidá-los caso seja necessário. 
select * from hotel as filial left join hotel as matriz
	on filial.fkMatriz = matriz.idHotel
    left join quarto on filial.idhotel = quarto.fkHotel; -- left para mostrar TODOS (matrizes e filiais) hoteis (que não tem quarto tbm),
															-- sem ele só tava aparecendo as filiais
    
-- IMPORTANTE: UTILIZE TODOS OS COMANDOS QUE APRENDEMOS EM SALA DE AULA.