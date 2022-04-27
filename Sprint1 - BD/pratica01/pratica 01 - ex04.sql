use sprint1;
create table Professor (
idProfessor int (8) primary key,
nome varchar (50),
especialidade varchar (40),
dtNasc date
);
-- normalmente a chave primária é do tipo INT (inteiro)
-- CHAR é quando tem o número especifico de caracteres e vai até 50, e o VARCHAR é quando o conteúdo é uma variável.
-- é utilizado para continuar o código.

insert into Professor values
('011221', 'Raul', 'matematica', '2004-07-20'),
('011222', 'Gabriel', 'portugues', '2002-09-30'),
('011223', 'Vivian', 'banco de dados', '1994-06-29'),
('011224', 'Frizza', 'matematica', '1980-07-20'),
('011225', 'Alexandre', 'fisica', '1992-05-01'),
('011226', 'Thiago', 'história', '1987-03-15'),
('011227', 'Luana', 'portugues', '1985-10-13');

-- a) Exibir todos os dados da tabela.
select * from Professor;
-- b) Exibir apenas as especialidades dos professores.
select especialidade from Professor;
-- c) Exibir apenas os dados dos professores de uma determinada especialidade (matematica)
select * from Professor where especialidade = 'matematica';
-- d) Exibir os dados da tabela ordenados pelo nome do professor.
select * from Professor order by nome;
-- e) Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.
select * from Professor order by dtNasc desc;
-- f) Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letr (R)
select * from Professor where nome like 'R%';
-- g) Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra.
select * from Professor where nome like '%n';
-- h) Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra.
select * from Professor where nome like '_u%';
-- i) Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra.
select * from Professor where nome like '%z_';
-- j) Elimine a tabela.
drop table Professor;