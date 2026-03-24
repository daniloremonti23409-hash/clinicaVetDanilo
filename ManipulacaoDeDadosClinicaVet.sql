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

SELECT * FROM contatotelefonico

SELECT nomeCliente,cidade,estado FROM cliente

SELECT * FROM cliente

SELECT * FROM contatotelefonico

SELECT nomeCliente,ddi,ddd,contatotelefonico.numero FROM cliente
INNER JOIN contatotelefonico 
ON Cliente.idCliente = contatotelefonico.idCliente

SELECT * FROM animal

INSERT INTO animal (idCliente, nomeAnimal,especie,raca,peso,porte,sexo,anoNascimento)
VALUES
(1,'Bidu','Cachorro','Beagle',12.3,'M','M',2020),
(2,'Penélope','Gato','Frajola',8.82,'M','F',2021),
(4,'Tom','Gato','Frajola',9.22,'M','M',2019),
(2,'Cofap','Cachorro','Basset',9.11,'P','M',2018);

SELECT* FROM consulta
SELECT * FROM consultatiposervico
SELECT * FROM tiposervico
SELECT * FROM veterinario

INSERT INTO veterinario
(nomeVeterinario, crmv, celular, especialidade)
VALUES 
('Hugo Costa', '12345SP','13988745265','Cirurgia Veterinaria'),
('Cristina Mendes','54321RJ', '219854615322', 'Ortopedia Veterinaria'),
('José Manuel Lopez Mendonza', '54874SP', '1398565412', 'Cardiologia Veterinaria'),
('Gabriel da Silva', '13076/SP', '13996676512', 'Patologia Veterinaria'),
('Pamela Silveira', '32013/SP', '11991376982', 'Cirugia Veterinaria'),
('Bruna Gomes', '60491/BA', '85996676512', 'Dermatologia Veterinaria');

INSERT INTO tiposervico  ( nomeServico , valor )
VALUES 
( 'Banho/Tosa' , 10.00),
( 'Castração' , 10.00),
( 'Vacina' , 10.00),
('MicroChipagem' , 10.00),
( 'Ultrasom', 10.00);

UPDATE tiposervico
SET valor = 50
WHERE idTipoServico = 15;

UPDATE tiposervico
SET valor = 150
WHERE idTipoServico = 16;

UPDATE tiposervico
SET valor = 75
WHERE idTipoServico = 17;

UPDATE tiposervico
SET valor = 75
WHERE idTipoServico = 18;

UPDATE tiposervico
SET valor = 200
WHERE idTipoServico = 19;


INSERT INTO consulta  (idAnimal, idVeterinario, dataHora, pago, formaPagto, qtdVezes, valorTotal, valorPago)  VALUES  (  (SELECT idAnimal FROM animal WHERE nomeAnimal = 'Bidu'),  (SELECT idVeterinario FROM veterinario WHERE nomeVeterinario like '%Hugo%'),  NOW(),  1,  'Cartão',  1,  350.00,  350.00);
INSERT INTO consulta
(idAnimal, idVeterinario, dataHora, pago, formaPagto, qtdVezes, valorTotal, valorPago)
VALUES
((SELECT idAnimal FROM animal WHERE nomeAnimal = 'Bidu'),1,NOW(),1,'Cartão',1,150.00,150.00);

INSERT INTO consulta
(idAnimal, idVeterinario, dataHora, pago, formaPagto, qtdVezes, valorTotal, valorPago)
VALUES
((SELECT idAnimal FROM animal WHERE nomeAnimal = 'Bidu'),1,NOW(),1,'Pix',1,90.00,90.00);

SELECT * FROM veterinario
 SELECT * FROM consulta
 
  SELECT * FROM tiposervico
 DELETE consulta WHERE idConsulta = 76;
 
 INSERT INTO consulta (idanimal, idVeterinario, datahora, pago, formapagto, qtdvezes, valortotal, valorpago)
VALUES
(1, 2, '2026-03-10 14:30:00', 0, 'Dinheiro', '0', 90.00, NULL),
(2, 2, '2026-01-25 09:00:00', 1, 'Pix', '0', 150.00, 150.00), 
(3, 2, '2026-03-29 18:00:00', 0, 'Crédito', '2', 300.00, NULL);

INSERT INTO consultatiposervico (idconsulta,idtiposervico, valorservico)
VALUES
(75, 15, 50.00), 
(76, 17, 75.00), 
(77, 18, 75.00)


INSERT INTO consulta (idAnimal, idVeterinario, dataHora, pago, formaPagto, qtdVezes, valorTotal, valorPago)
VALUES
(2, 6, '2026-03-03 10:00', 1, 'PIX', 1, 350.00, 350.00),
(3, 6, '2026-03-04 12:00', 1, 'Credito', 2, 150.00, 150.00)
 
INSERT INTO consultatiposervico(idConsulta, idTipoServico, valorServico)
VALUES
(6, 5, 350.00),
(7, 3, 150.00)
 
SHOW TABLES;
DROP DATABASE clinicavet;

 
 
 SELECT consulta.datahora,
 a.nomeAnimal,
 c.nomeCliente,
 veterinario.nomeVeterinario
 FROM cliente c
 INNER JOIN animal a
 ON c.idCliente = a.idCliente
 INNER JOIN consulta 
 ON a.idanimal = consulta.idAnimal
 INNER JOIN veterinario
 ON consulta.idVeterinario = veterinario.idVeterinario