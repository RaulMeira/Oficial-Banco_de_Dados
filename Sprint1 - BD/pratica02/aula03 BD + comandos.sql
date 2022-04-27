/* Revisão aula passada
create database
use
create table
insert into
select
select com where
select com where e like
select com order by
update aluno set campoAtualizado = ????? where id ????;
delete - dado da tabela "delete from nomedaTabela where id = ???;
drop table 
desc (describe) nomeTabela - descreve os campos/estrutura da tabela: 
*/

desc Aluno; -- Descreve os campos/estruturas da tabela
describe Aluno;
	
-- ALTER TABLE
-- Atualiza/modifica a estrutura da tabela

-- INT aceita 10 digitos 1234567890
CREATE TABLE Empresa (
id INT PRIMARY KEY auto_increment, -- auto_increment = na chave primária não precisa incluir em cada um,
										-- pois o MYSQL coloca automaticamente
nome VARCHAR (100),
responsavel VARCHAR (80)
);

-- Descreve os campos/estrutura da tabela Empresa 
desc Empresa;

-- insere valores na tabela
INSERT INTO Empresa values (null, 'C6 Bank', 'Paulo');

-- inserir dados na tabela Empresa, informando os campos
INSERT INTO Empresa (nome, responsavel) VALUES
('Safra', 'Franklin');

select * from Empresa;

-- ALTER TABLE = modifica/altera a estrutura da tabela
-- alter table rename column = renomear o campo
ALTER TABLE Empresa RENAME COLUMN nome TO nomeEmpresa;

-- ALTER TABLE ADD COLUMN
-- NUMERO INTEIRO = INT 10 DIGITOS
-- FLOAT = FLOAT 7 DIGITOS 32 BITS
-- DOUBLE = DOUBLE 15 DIGITOS 64 BITS
-- DECIMAL = DECIMAL (10, 2(2 casas pós virgula)) 28 digitos 128 bits
-- EXEMPLO DECIMAL 12345678,90
-- EXEMPLO DECIMAL (5,3) -> 12,345 = 5 numeros com 3 numeros pós a virgula

ALTER TABLE Empresa ADD COLUMN salario DECIMAL (10, 2);
select * from Empresa;
desc Empresa;

-- ATUALIZAR OS SALÁRIOS DOS RESPONSAVEIS
UPDATE Empresa SET salario = 1.50 WHERE ID = 1; -- (usa ponto "." no lugar da ",", 1,50 centavos)
UPDATE Empresa SET salario = 150 WHERE ID = 2; -- (150 reais)
-- USANDO O OR
UPDATE Empresa SET salario = 2.99
	WHERE id = 2 OR id = 1; 
-- USANDO O IN
UPDATE Empresa SET salario = 5.99 WHERE id in (1,2);

-- add column
-- rename column
-- DROP COLUMN
 ALTER TABLE Empresa DROP COLUMN salario;

 select * from Empresa;
 
 -- MODIFY COLUMN (alteração do tipo do campo), nesse de 100 digitos vai para 75
 ALTER TABLE Empresa MODIFY COLUMN nomeEmpresa VARCHAR(75);
 
 -- TRUNCATE TABLE
-- LIMPA OS REGISTROS E CONFIGURAÇÕES DA TABELA

SELECT * FROM Empresa;
DELETE FROM Empresa WHERE id = 1 or id = 2;

INSERT INTO Empresa VALUES 
	(null, 'BandTec Internacional', null); -- o id fica 3
SELECT * FROM Empresa; 

TRUNCATE TABLE Empresa; -- limpou os registros da tabela, e o id ficou 1
SELECT * FROM Empresa;

ALTER TABLE Empresa ADD COLUMN dtInicio DATE;
-- DATE ('YYYY-MM-DD'), data -> ano-mes-dia
-- DATETIME ('YYYY-MM-DD HH:MM:SS'), data com horário
-- TIME ('HH:MM:SS'). só hora -> 

UPDATE Empresa SET dtInicio = '2016-01-01' WHERE id = 1;
select * from Empresa;

ALTER TABLE Empresa MODIFY COLUMN dtInicio DATETIME;
UPDATE Empresa SET dtInicio = '2015-12-12 11 20:20:20';
SELECT * FROM Empresa;

ALTER TABLE Empresa drop column dtInicio;