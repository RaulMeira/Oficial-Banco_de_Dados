-- - Cada cliente realiza mais de uma venda.
-- Cada venda é de apenas um cliente e tem mais de um produto.
-- Cada produto pode ser vendido em mais de uma venda.

-- Criar um banco de dados chamado Venda.
create database venda;
-- Selecionar esse banco de dados.
use venda;

-- Criar as tabelas correspondentes à sua modelagem.
create table cliente (
idCliente int primary key auto_increment,
nome varchar (45),
email varchar (45),
CEP varchar (45),
numero int,
fkIndicado int,
foreign key (fkIndicado) references cliente(idCliente)
);

create table venda (
idVenda int primary key auto_increment,
total int,
dt date,
fkCliente int,
foreign key (fkCliente) references cliente(idCliente)
) auto_increment = 50;

create table produto (
idProduto int primary key auto_increment,
nome varchar (45),
descrição varchar (45),
preço int
)auto_increment = 100;

create table carrinho (
idCarrinho int auto_increment,
desconto int,
quantidade int,
fkVenda int,
foreign key (fkVenda) references venda (idVenda),
fkProduto int,
foreign key (fkProduto) references produto (idProduto),
primary key (idCarrinho, fkVenda, fkProduto)
)auto_increment = 1000;

-- O sistema ainda precisa saber quantidade do produto vendido numa determinada venda e o valor do desconto.

-- Inserir dados nas tabelas, de forma que exista mais de uma venda para cada
	-- cliente, e mais de um cliente sendo indicado por outro cliente.
    
insert into cliente values
(null, 'raul', 'raul@email.com', '04822-180', 202, null),
(null, 'ale', 'ale@email.com', '04299-120', 290, 1),
(null, 'joao', 'joao@email.com', '51738-180', 492, null),
(null, 'diogo', 'diogo@email.com', '78812-170', 500, 3);
select * from cliente;

alter table venda modify column total double;
desc venda;

insert into venda values
(null, 180.50, '2022-04-05', 1),
(null, 450.00, '2022-03-14', 2),
(null, 690.00, '2022-01-30', 3),
(null, 160.50, '2022-02-25', 4),
(null, 230.00, '2022-04-15', 1),
(null, 80.50, '2022-04-08', 2),
(null, 650.00, '2022-02-09', 3),
(null, 100.00, '2022-03-01', 4);

select * from venda;

alter table produto modify column preço double;

insert into produto values
(null, 'boneca', 'brinquedo', 20.50),
(null, 'camisa', 'roupa', 80),
(null, 'calça', 'roupa', 30),
(null, 'bola', 'brinquedo', 50);

select * from produto;

select * from carrinho;

insert into carrinho values
(null, 10, 1, 51, 100);
insert into carrinho values
(null, 5, 2, 50, 101),
(null, 25, 1, 52, 102),
(null, 20, 1, 53, 103),
(null, 10, 3, 54, 102),
(null, 10, 4, 55, 101),
(null, 5, 2, 56, 100);
select * from carrinho;

-- e) Exibir todos os dados de cada tabela criada, separadamente.
select * from cliente;
select * from venda;
select * from produto;
select * from carrinho;

-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.

-- g) Exibir os dados dos clientes e os dados de suas respectivas vendas.
select * from cliente join venda
	on idCliente = fkCliente;
    
-- h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta) e os dados de suas respectivas vendas.
select * from cliente join venda
	on idCliente = fkCliente
    where cliente.nome = 'raul';
    
-- i) Exibir os dados dos clientes e de suas respectivas indicações de clientes.
select * from cliente as cliente join cliente as indicação
	on cliente.idCliente = indicação.fkIndicado;
    
-- j) Exibir os dados dos clientes indicados e os dados dos respectivos clientes indicadores, porém somente de um determinado 
	-- cliente indicador (informar o nome do cliente que indicou na consulta).
select * from cliente as indicado join cliente as cliente
	on indicado.fkIndicado = cliente.idCliente
    where cliente.nome = 'joao';
    
-- l) Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os dados das respectivas vendas e dos produtos.    
select * from cliente as cliente
	join cliente as indicados on cliente.idCliente = indicados.fkIndicado
    join venda on cliente.idCliente = venda.fkCliente
    join carrinho on venda.idVenda = carrinho.fkVenda
    join produto on carrinho.fkProduto = produto.idProduto;
		
-- m) Exibir apenas a data da venda, o nome do produto e a quantidade do produto numa determinada venda.
select venda.dt as 'data', produto.nome as 'nome do produto', carrinho.quantidade from venda
	join carrinho on venda.idVenda = carrinho.fkVenda
    join produto on carrinho.fkProduto = produto.idProduto;
    
-- n) Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de
	-- produtos vendidos agrupados pelo nome do produto.
select produto.nome as 'nome do produto', produto.preço, sum(carrinho.quantidade) as 'soma' from produto
	join carrinho on produto.idProduto = carrinho.fkProduto
    group by nome;

-- o) Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas vendas, 
	-- e os clientes que não realizaram nenhuma venda.
insert into cliente values
(null, 'leandro', 'leandro@email.com', '00012-190', 280, 1);
select * from cliente 
	left join venda on cliente.idCliente = venda.fkCliente;
    -- left mostra todos os clientes, até os que não realizaram nenhuma venda
	
    
-- p) Exibir o valor mínimo e o valor máximo dos preços dos produtos;
select min(preço) as 'valor minimo', max(preço) as 'maximo' from produto;
select * from produto;

-- q) Exibir a soma e a média dos preços dos produtos;
select sum(preço) as 'soma dos preços', avg(preço) as 'média dos preços'from produto;

-- r) Exibir a quantidade de preços acima da média entre todos os produtos;

-- s) Exibir a soma dos preços distintos dos produtos;
-- t) Exibir a soma dos preços dos produtos agrupado por uma determinada venda;