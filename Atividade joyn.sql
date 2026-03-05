SHOW TABLES;

/*Buscar dados em determinada tabela*/
SELECT * FROM cliente

SELECT nomeCliente, celular, email FROM cliente

SELECT idCliente, nomeCliente FROM cliente
WHERE idCliente BETWEEN 1 AND 3

SELECT idCliente,nomeCliente FROM cliente
WHERE idCliente>=1 AND idCliente<=3

SELECT nomeCliente FROM cliente
WHERE nomeCliente = 'Juca'

SELECT nomeCliente FROM cliente
WHERE nomeCliente like 'Ju%'

SELECT nomeCliente FROM cliente
WHERE nomeCliente LIKE '%inha%'

/* Inserir dados em determinada tabela */
INSERT INTO cliente 
(nomecliente, cpf, email, cidade, estado, cep, tipoLogradouro, nomeLogradouro, numero, complemento)
VALUES 
('Juquinha Simões', '88899922200', 'jucasimoes@uol.com.br',
'Santos', 'SP', '11077888','Rua', 'das Margaridas', '50', 'ap.51'),
('Mariazinha Simões', '99900011122', 'mariasimoes@bol.com.br',
'Santos', 'SP', '11077888','Rua', 'das Margaridas', '50', 'ap.51');


INSERT INTO cliente 
(nomecliente, cpf, email, cidade, estado, cep, tipoLogradouro, nomeLogradouro, numero, complemento)
VALUES 
('Juquinha Simões', '88899922200', 'jucasimoes@uol.com.br',
'Santos', 'SP', '11077888','Rua', 'das Margaridas', '50', 'ap.51');


/*Atualizar dados em determinada tabela*/
UPDATE cliente 
SET celular='13998776655'
WHERE idCliente=1

UPDATE cliente 
SET celular='13955678897'
WHERE idCliente=2

INSERT INTO cliente 
(nomecliente, cpf, email, cidade, estado, cep, tipoLogradouro, nomeLogradouro, numero, complemento)
VALUES ('Pedro Fonseca','88799855687','Pedrocaseca@uol.com.br','Cubatão','SP','22234523','av','Das flores','44','apto.33'),
('Karina Fondeladre','88799844687','Karinaholl@uol.com.br','Rio de Janeiro','RJ','22223523','av','Dos tiroteios','21',NULL);

UPDATE cliente
SET celular='1355667756'
WHERE idCliente=4

UPDATE cliente
SET celular='44966778899'
WHERE idCliente=5

UPDATE cliente
SET celular='12944556677', email='PedroFonseca2@gmail.com'
WHERE idCliente=4


/*Busca com filtros*/

SELECT nomeCliente, email, cidade FROM cliente
WHERE cidade='Santos' OR   cidade='Cubatão'

/*lista ordenada*/
SELECT nomeCliente, Cidade FROM cliente
ORDER BY nomeCliente

/* Trazer os clientes de SP em ordm alfabética por nome de A a Z*/

SELECT nomeCliente,cidade, Estado FROM cliente
WHERE estado='SP'
ORDER BY nomeCliente

/*Excluir dados de determinada tabela */
DELETE FROM cliente
WHERE idCliente>4 AND idCliente <6

ALTER TABLE contatotelefonico
MODIFY idContatoTelefonico INT NOT NULL AUTO_INCREMENT;

INSERT INTO contatotelefonico
(idCliente,ddi,ddd,numero)
VALUES
(1,'55','13','998776655'),
(2,'55','13','955678897'),
(4,'55','12','944556677');

DELETE FROM contatotelefonico


SELECT nomeCliente,cidade,estado FROM cliente

SELECT * FROM cliente

SELECT * FROM contatotelefonico

SELECT nomeCliente,ddi,ddd,contatotelefonico.numero FROM cliente
INNER JOIN contatotelefonico 
ON Cliente.idCliente = contatotelefonico.idCliente