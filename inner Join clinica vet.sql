CREATE DATABASE clinicavet;
CREATE TABLE animal;

SHOW TABLES;

SELECT * FROM animal;
SELECT * FROM cliente;
SELECT*FROM veterinario;

INSERT INTO cliente 
(nomecliente, cpf, email, cidade, estado, cep, tipoLogradouro, nomeLogradouro, numero, complemento)
VALUES 
('Juquinha Simões', '88899922200', 'jucasimoes@uol.com.br',
'Santos', 'SP', '1311077888','Rua', 'das Margaridas', '50', 'ap.51'),
('Mariazinha Simões', '99900011122', 'mariasimoes@bol.com.br',
'Santos', 'SP', '1311077888','Rua', 'das Margaridas', '50', 'ap.51');


INSERT INTO animal (idCliente, nomeanimal, especie,
raça, peso, porte, sexo, anoNascimento)
VALUES 
(1,'Bidu','Cachorro','Beagle',12.3,'M','M',2020),
(2,'Penélope','Gato','Frajola',8.82,'M','F',2021),
(2,'Tom','Gato','Frajola',9.22,'M','M',2019),
(1,'Cofap','Cachorro','Basset',9.11,'P','M',2018);

INSERT INTO veterinario
(nomeVeterinario,crmv,celular,especialidade)
VALUES
('Beatriz Costa', '12345SP','13988745265','Cirurgia Veterinaria'),
('Agamenom Mendes','54321RJ', '219854615322', 'Ortopedia Veterinaria'),
('José Manuel Lopez', '54874SP', '1398565412', 'Cardiologia Veterinaria');

INSERT INTO tipoServico (nomeServico , valor)
VALUES 
('Banho/Tosa' , 90.00),
('Castração' , 200.00),
('Vacina' , 150.00),
('MicroChipagem' , 300.00),
('Ultrasom', 350.00);

INSERT INTO consulta
(idAnimal, idVeterinario, dataHora, pago, formaPagto, qtdVezes, valorTotal, valorPago)
VALUES((SELECT idAnimal FROM animal WHERE nomeAnimal = 'Bidu'),1,
NOW(),1,'Cartão',1,150.00,150.00);

INSERT INTO consulta
(idAnimal, idVeterinario, dataHora, pago, formaPagto, qtdVezes, valorTotal, valorPago)
VALUES((SELECT idAnimal FROM animal WHERE nomeAnimal = 'Bidu'),1,NOW(),1,'Pix',1,90.00,90.00);

INSERT INTO consultatiposervico 
(idconsulta, idTipoServico, valorServico)
VALUES
(1,3,150.00),
(2,1,90.00);

SELECT*FROM tiposervico

DROP TABLE consultatiposervico 
CREATE table consultatiposervico 
SHOW TABLES 

SELECT * FROM consultatiposervico 
SELECT*FROM consulta

INSERT INTO consulta (idAnimal, idVeterinario, datahora, pago, formapagto, qtdvezes, valortotal, valorpago)
VALUES
(1, 2, '2026-03-10 14:30:00', 0, 'Dinheiro', '0', 90.00, NULL),
(2, 2, '2026-01-25 09:00:00', 1, 'Pix', '0', 150.00, 150.00), 
(3, 2, '2026-03-29 18:00:00', 0, 'Crédito', '2', 300.00, NULL);

INSERT INTO consultatiposervico (idconsulta,idtiposervico, valorservico)
VALUES
(6, 1, 90.00), 
(7, 3, 150.00), 
(8, 4, 300.00);

INSERT INTO consulta (idAnimal, idVeterinario, dataHora, pago, formaPagto, qtdVezes, valorTotal, valorPago)
VALUES
(2, 3, '2026-03-03 10:00', 1, 'PIX', 1, 350.00, 350.00),
(3, 3, '2026-03-04 12:00', 1, 'Credito', 2, 150.00, 150.00)
INSERT INTO consultatiposervico(idConsulta, idTipoServico, valorServico)
VALUES
(9, 5, 350.00),
(10, 3, 150.00);

insert into consulta(idAnimal, idVeterinario, dataHora, pago, formaPagto, qtdVezes, valorTotal, valorPago)

values

(1,1,'2026-03-14 13:00:00', 'S','dinheiro',1,'300.00','300.00'),

(2,3,'2026-03-14 16:30:00', 'S','credito',3,'300.00','300.00'),

(3,3,'2026-03-17 08:10:00', 'S','pix',1,'150.00','150.00');
 
insert into consultatiposervico(idConsulta,idTipoServico ,valorServico )

values

(11,4,'300.00'),

(12,4,'300.00'),

(13,3,'150.00');
 
SELECT consulta.datahora,
 a.nomeAnimal,
 c.nomeCliente,
 veterinario.nomeVeterinario,
 tiposervico.nomeservico
 FROM cliente c
 INNER JOIN animal a
 ON c.idCliente = a.idCliente
 INNER JOIN consulta 
 ON a.idanimal = consulta.idAnimal
 INNER JOIN veterinario
 ON consulta.idVeterinario = veterinario.idVeterinario
 INNER JOIN consultatiposervico
 ON consultatiposervico.idConsulta = consulta.idConsulta
 INNER JOIN tipoServico
 ON tiposervico.idTipoServico = consultatiposervico.idTipoServico;
 
 
 
 /* Listar nome veterinário, data que consultou, animal atendido, considerando todos os veterinários;*/
 
select veterinario.nomeVeterinario,
 consulta.dataHora,
 animal.nomeAnimal
 FROM veterinario
 inner JOIN consulta
 ON veterinario.idVeterinario = consulta.idVeterinario
 inner JOIN Animal 
 ON animal.idAnimal = consulta.idAnimal;
 
 /* Trazer a quantidade de consultas executadas na clínica ao longo de todo o período */
 
 SELECT COUNT(idconsulta) AS 'Qtd de consultas'FROM consulta;
 
 /* Trazer o serviço mais caro da clínica (Maximo)*/
 
 SELECT * FROM tiposervico
 
 SELECT MAX(valor) FROM tiposervico
 
  /* Trazer o serviço mais barato da clínica (Minimo)*/
  
  SELECT MIN(valor) FROM tiposervico
  
  /* Trazer média de valores das consultas (Média) */
  
  SELECT valor FROM tiposervico
  SELECT AVG(valor) AS 'Média de valores'FROM tiposervico
  
  /* Trazer o faturamento bruto da clinica (Soma) */
  
  SELECT SUM(valorservico)AS 'Faturamento' FROM consultatiposervico
  
  /*Trazer a quantidade de consultas que ocorreram com 
cada animalzinho 
Ex.: Bidu --------- 3 consultas 
     Penélope ----- 2 consultas
	  Ordenando pela quantidade de consultas da maior quantidade para o menor
	  considerando apenas animais que tiveram mais que 3 consultas*/
     
     
     SELECT*from animal
     SELECT*FROM consulta
     
     SELECT count(idconsulta)AS 'Consultas do Bidu' FROM consulta
     WHERE idAnimal = 9
      SELECT count(idconsulta)AS 'Consultas da penélope' FROM consulta
     WHERE idAnimal = 10
     
     SELECT nomeAnimal, COUNT(idConsulta) AS 'qtd de consultas' FROM consulta
     inner JOIN animal on consulta.idAnimal = animal.idAnimal
     GROUP BY nomeAnimal
     HAVING COUNT(idConsulta)>3
     ORDER BY COUNT(idConsulta) desc
     
     /* Listar a quantidade de animais por espécie*/
     
     SELECT especie, COUNT(idAnimal)AS 'Qtd' FROM animal
    GROUP BY especie 
    
    /*Listar todas as cidades aonde tenho cliente*/
    
    SELECT DISTINCT cidade  FROM cliente
    
    SELECT DISTINCT raça FROM animal
    WHERE especie = 'cachorro'
     
     /*Paginação - limitar quantidade de linhas*/
     
     SELECT*FROM veterinario
     ORDER BY idveterinario desc
     LIMIT 2