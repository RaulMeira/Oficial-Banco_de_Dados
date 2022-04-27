use sprint1;
create table Professor2 (
idProfessor int primary key auto_increment,
nome varchar (50),
especialidade varchar (40),
dtNasc date
);
 insert into Professor2 values
 (null, 'Raul', 'Matematica', '2000-07-20'),
 (null, 'Leandro', 'Portugues', '1990-06-08'),
 (null, 'Matheus', 'Matematica', '1999-09-30'),
 (null, 'João', 'Ciencias', '1987-09-17'),
 (null, 'Caue', 'Matematica', '1978-11-20'),
 (null, 'Alexia', 'Fisica', '2001-12-12');
select * from Professor2;
 
-- Exibir todos os dados da tabela.
select * from Professor;

-- Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’,
-- ‘assistente’ ou ‘titular’;
alter table Professor2 add column funcao varchar (50);
select * from Professor2;

-- Atualizar os professores inseridos e suas respectivas funções;
update Professor2 set funcao = 'titular' where idProfessor = 1;
update Professor2 set funcao = 'auxiliar' where idProfessor = 2;
update Professor2 set funcao = 'titular' where idProfessor = 3;
update Professor2 set funcao = 'monitor' where idProfessor = 4;
update Professor2 set funcao = 'titular' where idProfessor = 5;
update Professor2 set funcao = 'auxiliar' where idProfessor = 6;
select * from Professor2;

-- Inserir um novo professor;
insert into Professor2 values
(null, 'Samuel', 'Quimica', '2000-01-01', 'auxiliar');
select * from Professor2;
delete from Professor2 where idProfessor = 7; -- adicionei duas vezes o "samuel", e exclui o 8, era pra excluir o 7,
															-- vamos arrumar!!!
delete from Professor2 where idProfessor = 8;
insert into Professor2 value
(null, 'Samuel', 'Quimica', '2000-01-01', 'auxiliar');  -- adicionei duas vezes o "samuel", e exclui o 8, era pra excluir o 7,
															-- vamos arrumar!!!
delete from Professor2 where idProfessor = 9;
insert into Professor2 value
(7, 'Samuel', 'Quimica', '2000-01-01', 'auxiliar');


-- Excluir o professor onde o idProfessor é igual a 5;
delete from Professor2 where idProfessor = 5;
select * from Professor2;

-- Exibir apenas os nomes dos professores titulares;
select * from Professor where funcao = 'titular';
select nome from Professor where funcao = 'titular';

-- Exibir apenas as especialidades e as datas de nascimento dos professores monitores;
select especialidade, dtNasc from Professor where funcao = 'monitor';

-- Atualizar a data de nascimento do idProfessor igual a 3;
update Professor set dtNasc = '1985-09-08' where idProfessor = 3;
select * from Professor

-- Limpar a tabela Professor;