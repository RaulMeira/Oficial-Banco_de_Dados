use sprint1;
create table Revista (
idRevista int primary key auto_increment,
nome varchar (40),
categoria varchar (30)
);

select * from Revista;

insert into Revista values
(null, 'VEJA', null),
(null, 'Isto é', null),
(null, 'Mad', null),
(null, 'Placar', null);

-- Exibir todos os dados da tabela.
select * from Revista;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
update Revista set categoria = 'informação' where idRevista = 1;
update Revista set categoria = 'informação' where idRevista = 2;
update Revista set categoria = 'comédia' where idRevista = 3;
update Revista set categoria = 'esporte' where idRevista = 4;
select * from Revista;

-- Insira mais 3 registros completos.
insert into Revista values
(null, 'UOL', 'noticias'),
(null, 'globo', 'noticias'),
(null, 'esporte interativo', 'esporte');

-- Exibir novamente os dados da tabela.


-- Exibir a descrição da estrutura da tabela.
desc Revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
alter table Revista modify column categoria varchar (40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
desc Revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
alter table Revista add column periodicidade varchar (15);

-- Exibir os dados da tabela.
select * from Revista;
update Revista set periodicidade = 'não sei' where idRevista = 1;

-- Excluir a coluna periodicidade da tabela.
alter table Revista drop column periodicidade;
select * from Revista;
delete from Revista where idRevista = 7;
