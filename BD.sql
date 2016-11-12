
-- CRIACAO DA TABELA USUARIO
create table ecommerce.user(
id integer not null primary key auto_increment,
username varchar(10),
password varchar(10)
);

-- CRIACAO DA TABELA PRODUTO
create table ecommerce.produto(
id integer not null primary key auto_increment,
descricao varchar(50),
informacao varchar(80),
qtde int,
valor numeric(10,2)
);

-- CRIACAO DA TABELA PEDIDO
create table ecommerce.pedido(
id integer not null primary key auto_increment,
idUser integer,
constraint fk_user foreign key(idUser) references ecommerce.user(id)
);

-- CRIACAO DA TABELA PEDIDO_ITEM
create table ecommerce.pedidoItem(
id integer not null primary key auto_increment,
pedidoId integer,
produtoId integer,
quantidade integer,
vlUnitario numeric(10,2),
constraint fk_pedidoId foreign key(pedidoId) references ecommerce.pedido(id),
constraint fk_produtoId foreign key(produtoId) references ecommerce.produto(id)
);

-- INCLUINDO 1 NOVO UNUARIO NA TABELA DE USUARIOS
insert into ecommerce.user(username, password) values('JONATHAN','123456');
insert into ecommerce.user(username, password) values('admin','admin');

-- INCLUINDO 5 NOVOS PRODUTOS NA TABBELA DE PRODUTOS
insert into ecommerce.produto(descricao, informacao, qtde, valor) values('IPHONE 5S 16GB CINZA ESPACIAL APPLE','NAO TRAVA', 10, 1999);
insert into ecommerce.produto(descricao, informacao, qtde, valor) values('IPHONE 6S 32GB CINZA ESPACIAL APPLE','NAO TRAVA', 5, 2999);
insert into ecommerce.produto(descricao, informacao, qtde, valor) values('GALAXY NOTE 7 PRETO SAMSUNG','PEGA FOGO, FABRICADO POR TERRORISTAS, FUNCIONA NO MODO BOMBA', 40, 0.99);
insert into ecommerce.produto(descricao, informacao, qtde, valor) values('PEN DRIVE 8GB VERMELHO SANDISK','FUNCIONA USB 3.0', 7, 29.99);
insert into ecommerce.produto(descricao, informacao, qtde, valor) values('NOTEBOOK X450L SERIES PRETO ASUS','INTEL CORE I5, RAM 8GB, HD 1TB, SO WIN 10', 8, 2299);

