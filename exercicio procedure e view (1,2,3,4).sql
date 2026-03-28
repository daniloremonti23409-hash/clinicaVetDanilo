SHOW TABLES

/* View para relatorios grandes */

CREATE VIEW vw_RelatorioGeralConsultas AS 
SELECT consulta.dataHora,
  	    a.nomeAnimal,
  	    c.nomeCliente,
  	    veterinario.nomeVeterinario,
  	    tiposervico.nomeServico
  	    cliente.celular
FROM cliente c
INNER JOIN animal a
ON  a.idcliente = c.idCliente
INNER JOIN consulta 
ON a.idAnimal = consulta.idAnimal
INNER JOIN veterinario
ON consulta.idVeterinario = veterinario.idVeterinario
INNER JOIN consultatiposervico 
ON consultatiposervico.idConsulta = consulta.idConsulta
INNER JOIN tiposervico
ON tiposervico.idtiposervico = consultatiposervico.idtipoServico
ORDER BY veterinario.nomeVeterinario,consulta.dataHora ASC

SELECT * FROM tipoServico

SELECT nomeAnimal,nomeVeterinario,nomeServico
FROM vw_relatoriogeralconsultas
WHERE nomeservico = 'Vacina'

/* Criação e uso de Stored Procedure 
exibição de dados */

CREATE PROCEDURE ps_RelatorioConsultasPorProcedimento 
(
IN procedimento VARCHAR(50) 
)
SELECT nomeAnimal,nomeVeterinario,nomeServico
FROM vw_relatoriogeralconsultas
WHERE nomeservico = procedimento

CALL ps_RelatorioConsultasPorProcedimento('Vacina');
CALL ps_RelatorioConsultasPorProcedimento('Banho/tosa');
CALL ps_RelatorioConsultasPorProcedimento('Ultrasom');

/* Criação e Uso de stored Procedure
Alteração de dados */

CREATE PROCEDURE pi_tiposervico 
(
 IN _nomeServico VARCHAR(50),
 IN _valor DECIMAL(10,2) 
)
INSERT INTO tiposervico (nomeservico,valor)
VALUES(_nomeservico,_valor)

CALL pi_tiposervico ('Raio-X',200.00)

SELECT * FROM tiposervico

/* Cria uma view que traga a data da consulta, o nome do pet, o nome do cliente e telefone do cliente */

INSERT 

CREATE VIEW vw_relatorioDeConsultas as
SELECT consulta.dataHora,
animal.nomeAnimal,
cliente.nomeCliente,
contatotelefonico.numero,
contatotelefonico.ddd,
animal.especie

FROM cliente
INNER JOIN animal
ON animal.idCliente = cliente.idCliente
INNER JOIN consulta
on consulta.idAnimal = animal.idAnimal
INNER JOIN contatotelefonico
ON contatotelefonico.idCliente = cliente.idCliente

SELECT dataHora,nomeAnimal,NomeCliente,ddd, numero
FROM vw_relatoriodeconsultas
 
 DROP VIEW vw_relatoriodeconsultas

/* Cria uma procedure que traga o nome do pet, o nome do cliente e telefone, de acordo com o tipo de animal. Ex: Cachorro, gato, etc..  */

CREATE PROCEDURE ps_NomeClienteAnimal
(
IN procedimentoEspecie VARCHAR (50)
)
SELECT nomeAnimal,NomeCliente,ddd,numero,especie
FROM vw_relatoriodeconsultas
WHERE especie=procedimentoEspecie;

DROP PROCEDURE ps_nomeClienteAnimal

CALL ps_nomeClienteAnimal('cachorro');
CALL ps_nomeClienteAnimal('gato');

/* 03) Criar uma procedure para alterar os dados
o peso de determinado animal, já que este
dado é dinâmico*/

SELECT*FROM animal;

DROP PROCEDURE pi_pesoAnimal

CREATE PROCEDURE pi_pesoAnimal
(
in _idAnimal INT,
IN _peso DECIMAL(5,2)

)
UPDATE animal
SET peso = _peso
WHERE idAnimal = _idAnimal

CALL pi_pesoAnimal (12, 34.75)

SELECT*FROM animal
WHERE idAnimal = 12

/* 04) Criar uma procedure para reajustar em X percentual
toda a tabela de serviços*/

SELECT*FROM tiposervico;

CREATE PROCEDURE pi_AjusteValorServico(
IN _valor DECIMAL (10,2)
)
UPDATE tiposervico
SET valor =valor *  _valor

CALL pi_AjusteValorServico(1.2)

DROP PROCEDURE pi_AjusteValorServico