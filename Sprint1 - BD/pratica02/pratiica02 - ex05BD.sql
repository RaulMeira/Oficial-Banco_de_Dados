use sprint1;
create table Curso (
idCurso int primary key auto_increment,
nome varchar (50),
sigla varchar (3),
coordenador varchar (50)
);
select * from Curso;

insert into Curso values
(null, 'Administração', 'Adm', 'Thiago'),
(null, 'Medicina', 'Med', 'Leonardo'),
(null, 'Ciencia da Computação', 'Cco', 'Luana'),
(null, 'Veterinária', 'Vet', 'Cecilia');

-- Exibir todos os dados da tabela.
select * from Curso;

-- Exibir apenas os coordenadores dos cursos.
select coordenador from Curso;

-- Exibir apenas os dados dos cursos de uma determinada sigla.
select * from Curso where sigla = 'Cco';

-- Exibir os dados da tabela ordenados pelo nome do curso.
select * from Curso order by nome;

-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente
select * from Curso order by coordenador desc;

-- Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
select * from Curso where nome like 'a%';

-- Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
select * from Curso where nome like '%a';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
select * from Curso where nome like '_i%';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
select * from Curso where nome like '%n_';
-- Elimine a tabela.
