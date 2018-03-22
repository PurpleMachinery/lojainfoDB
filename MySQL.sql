DROP DATABASE IF EXISTS lojainfo;
CREATE DATABASE IF NOT EXISTS lojainfo;

USE lojainfo;
CREATE TABLE tbClientes(
	pk_idCliente INT PRIMARY KEY AUTO_INCREMENT,
	nome NVARCHAR(50),
	endereco NVARCHAR(100),
	fone NVARCHAR(15),
	email NVARCHAR(70)
);

CREATE TABLE tbHardware(
	pk_idHardware INT PRIMARY KEY AUTO_INCREMENT,
	descricao NVARCHAR(50),
	precoUnit DECIMAL,
	qtdAtual INT,
	qtdMinima INT
	#img IMAGE DEFAULT NULL
);

CREATE TABLE tbVendas(
	pk_idVenda INT PRIMARY KEY AUTO_INCREMENT,
	fk_idCliente INT NOT NULL REFERENCES tbClientes(pk_idCliente),
	data DATE NOT NULL,
	valorTotal DECIMAL(8,2),
	desconto DECIMAL (8,2),
	valorPago DECIMAL (8,2)
);

CREATE TABLE tbItensVenda(
	pk_idItem INT PRIMARY KEY AUTO_INCREMENT,
	fk_idVenda INT NOT NULL REFERENCES tbVendas(pk_idVenda),
	fk_idHardware INT NOT NULL  REFERENCES tbHardware(pk_idHardware),
	qtde INT NOT NULL,
	totalItem Decimal(8,2)
);

USE lojainfo;

/*SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE '%'

SELECT * FROM tbClientes;
SELECT * FROM tbHardware;
SELECT * FROM tbItensVenda;
SELECT * FROM tbVendas;

DELETE FROM tbClientes;
DELETE FROM tbHardware;
DELETE FROM tbVendas;
DELETE FROM tbItensVenda;

INSERT INTO tbClientes (nome, endereco, fone, email) VALUES
	('Jeferson','Aguia Haia 123','11-99999-9999','jef@dom.com'),
	('Carlos','Aguia Haia 456','11-99999-9999','carlos@dom.com'),
	('Ralf','Aguia Haia 789','11-99999-9999','ralf@dom.com');
 
INSERT INTO tbHardware (descricao, precoUnit, qtdAtual, qtdMinima, img) VALUES
	('gabinete',     60.50, 100, 10, NULL),
	('processador', 300.50, 100, 10, NULL),
	('placa mãe',   100.50, 100, 10, NULL),
	('Dico Rígido',  80.90, 100, 10, NULL),
	('Monitor',     300.20, 100, 10, NULL);

INSERT INTO tbVendas (fk_idCliente, data, valorTotal, desconto, valorPago) VALUES
	(2,'2018-02-10', 8471, 100, 8371),
	(3,'2018-02-10',1086,0,1086);

INSERT INTO tbItensVenda VALUES
	(1,1,10, 600.50),
	(1,2,10,3005),
	(1,3,10,1050),
	(1,4,10,809),
	(1,5,10,3002),
	(2,1,1,60.50),
	(2,2,1,300.50),
	(2,3,1,105),
	(2,4,1,80.9),
	(2,5,1,3002);
	
/*SELECT * FROM tbClientes;
SELECT * FROM tbHardware;
SELECT * FROM tbItensVenda;
SELECT * FROM tbVendas;*/

/*SELECT * FROM tbVendas;
SELECT * FROM tbClientes AS C JOIN tbVendas AS V ON C.pk_idCliente=V.fk_idCliente;
SELECT C.pk_idCliente AS IdCliente_Clientes, V.fk_idCliente AS IdCliente_Vendas, C.nome FROM tbClientes AS C LEFT JOIN tbVendas AS V ON C.pk_idCliente = V.fk_idCliente;
SELECT C.pk_idCliente AS IdCliente_Clientes, V.fk_idCliente AS IdCliente_Vendas, C.nome FROM tbClientes AS C RIGHT JOIN tbVendas AS V ON C.pk_idCliente = V.fk_idCliente;

SELECT C.pk_idCliente as idClienteCliente, V.fk_idCliente as idClienteVendas, C.nome as NomeCliente, V.pk_idVenda as IdVendaVenda, I.pk_idItem as idItem, I.fk_idHardware as idHardware, I.qtde as qtde, I.totalItem as vlrTotItem FROM tbClientes C LEFT JOIN tbVendas V ON C.pk_idCliente = V.fk_idCliente JOIN tbItensVenda as I ON V.pk_idVenda = I.fk_idVenda
SELECT C.pk_idCliente as idClienteCliente, V.fk_idCliente as idClienteVendas, C.nome as NomeCliente, V.pk_idVenda as IdVendaVenda, I.pk_idItem as idItem, I.fk_idHardware as idHardware, I.qtde as qtde, I.totalItem as vlrTotItem FROM tbClientes C LEFT JOIN tbVendas V ON C.pk_idCliente = V.fk_idCliente LEFT JOIN tbItensVenda as I ON V.pk_idVenda = I.fk_idVenda
*/