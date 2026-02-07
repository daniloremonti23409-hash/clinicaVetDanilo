CREATE TABLE cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT ,
nomeCliente VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE ,
celular CHAR(11) NOT NULL,
email VARCHAR (50) NOT NULL,
cidade VARCHAR (50) NOT NULL,
estado CHAR (2) NOT NULL,
cep char(8) NOT NULL,
tipoLogradouro VARCHAR (15) NOT NULL,
nomeLogradouro VARCHAR (50) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR (30) NOT NULL
)

/* criando tabela sem fk */
CREATE TABLE contatoTelefonico (
idContatoTelefonico INT PRIMARY KEY,
idCliente INT NOT NULL ,
ddi VARCHAR (5) NOT NULL,
ddd VARCHAR (5) NOT NULL,
numero CHAR (9) NOT NULL
)
/*alterando a tabela sem fk*/

ALTER TABLE contatoTelefonico
ADD CONSTRAINT fk_contatoTelefonico_Cliente
foreign KEY (idCliente) REFERENCES cliente(idCliente)

/*criando tabela com fk */

CREATE TABLE animal (
idAnimal INT PRIMARY KEY AUTO_INCREMENT,
idCliente INT NOT NULL, 
nomeAnimal VARCHAR(50) NOT NULL ,
especie VARCHAR(50) NOT NULL ,
raça VARCHAR(50) NOT NULL ,
peso DECIMAL(5,2),
porte CHAR(1),
sexo CHAR(1),
anoNascimento INT NOT NULL,
CONSTRAINT fk_animal_Cliente FOREIGN KEY (idcliente)
REFERENCES cliente(idcliente)
)


DROP TABLE animal 
CREATE TABLE animal (
idAnimal INT PRIMARY KEY AUTO_INCREMENT,
idCliente INT NOT NULL, 
nomeAnimal VARCHAR(50) NOT NULL ,
especie VARCHAR(50) NOT NULL ,
raça VARCHAR(50) NOT NULL ,
peso DECIMAL(5,2),
porte CHAR(1),
sexo CHAR(1),
anoNascimento INT NOT NULL,
CONSTRAINT ck_sexoAnimal CHECK (sexo ='M' OR sexo='F'),
CONSTRAINT ck_porteAnimal CHECK (porte IN ('P','M','G')),
CONSTRAINT fk_animal_Cliente FOREIGN KEY (idcliente)
REFERENCES cliente(idcliente)
)

CREATE TABLE tipoServico (
idTipoServico INT PRIMARY KEY AUTO_INCREMENT,
nomeservico VARCHAR(50) NOT null,
valor DECIMAL(10,2)NOT NULL )

CREATE TABLE veterinario (
idVeterinario INT PRIMARY KEY AUTO_INCREMENT,
nomeVeterinario VARCHAR(50) NOT NULL,
crmv VARCHAR(20) NOT NULL UNIQUE,
celular CHAR(11)NOT NULL,
especialidade VARCHAR(50))

CREATE TABLE consulta (

idConsulta INT PRIMARY KEY AUTO_INCREMENT,
idAnimal INT NOT NULL,
idVeterinario INT NOT NULL,
dataHora datetime NOT NULL,
pago BIT NOT NULL,
formaPagto VARCHAR(50) NOT null,
qtdVezes TINYINT, 
valorTotal DECIMAL(10,2)NOT NULL,
valorPago DECIMAL(10,2),
CONSTRAINT ck_valorpago CHECK (pago = "SIM" OR pago="NÃO"),
CONSTRAINT fk_ConsultaAnimal FOREIGN KEY (idAnimal) REFERENCES animal(idAnimal),
CONSTRAINT fk_ConsultaVeterinario FOREIGN KEY (idVeterinario) REFERENCES veterinario (idVeterinario)

)

CREATE TABLE consultaTipoServico(
idConsultaTipoServico INT PRIMARY KEY AUTO_INCREMENT,
idConsulta INT NOT NULL ,
idTipoServico INT NOT NULL , 
valorServico DECIMAL(10,2),
CONSTRAINT fk_ConsultaTipoServico FOREIGN KEY (idConsulta) REFERENCES consulta(idConsulta),
CONSTRAINT fk_consultatipoServicoTipoServico FOREIGN KEY (idTipoServico) REFERENCES tipoServico(idTipoServico)

)


