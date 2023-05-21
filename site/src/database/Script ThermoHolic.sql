-- Criação do Banco de Dados ThermoHolic
CREATE DATABASE if not exists ThermoHolic;

-- Selecionando o Banco de Dados
USE ThermoHolic;

-- Criando a tabela empresa 
CREATE TABLE if not exists Empresa (
	IdEmpresa INT PRIMARY KEY auto_increment, -- ID da Empresa
	Nome varchar(70),-- Nome da empresa
    Email varchar(50), -- Email da empresa
	CNPJ char(18) NOT NULL, -- CNPJ da empresa
	QtdTanques INT -- Quantidade de tanques de fermentação na empresa (o update da informação será feito após a conversa e acordo com o cliente, por isso essa informação não terá que ser preenchida na aba de cadastro)
);

-- Inserindo dados na tabela empresa
INSERT INTO Empresa VALUES 
	(null, 'Brejaway', 'brejaway@outlook.com', '07.526.557/0001-00', null),
	(null, 'Cevada Pura', 'cevada.pura@outlook.com', '08.930.673/0001-24', null),
	(null, 'Dogma', 'dogma@gtmail', '07.526.557/0001-00', null),
	(null, 'Bar do Urso', 'urso.bar@gmail.com', '21.900.899/0001-79', null);
-- Depois do acordo feito com o cliente, será realizado o UPDATE na quantidade de tanques:  UPDATE Empresa SET QtdTanques = 3 WHERE IdEmpresa = 1;

---------------------------------------------------------------------------------------------------------------------------------------
-- Criando a tabela usuário 
CREATE TABLE if not exists Usuario(
IdUsuario INT auto_increment, -- ID do Usuário
Nome VARCHAR(50) NOT NULL, -- Nome do usuário
Email VARCHAR (100), -- Email do usuário
Celular CHAR (11), -- Celular do usuário
CPF CHAR(14) unique, -- CPF usuário
Senha VARCHAR(100) NOT NULL, -- Senha usuário
TipoUsuario VARCHAR(20), -- Tipo de usuário (no cadastro o administrador se cadastra e no dashboard ele adiciona novos funcionários)
	constraint chkTipoUsuario check (TipoUsuario in ('Administrador', 'Funcionário')),
fkEmpresaU int, -- chave estrangeira com a table empresa
	constraint fkEmpresaU foreign key (fkEmpresaU) references Empresa (IdEmpresa), -- chave estrangeira que identifica a empresa em que o usuario esta localizado
    constraint pkCompostaU PRIMARY KEY (IdUsuario, fkEmpresaU) -- PRIMARY KEY COMPOSTA
);

CREATE INDEX idxTbFracaFunc ON Usuario(idUsuario,fkEmpresaU);

-- OBS: Quando temos a chave primária composta, podemos repetir os números do id pois eles vão se diferenciar de acordo com a empresa que eles pertencerem
-- Inserindo dados na tabela usuário
INSERT INTO Usuario VALUES
(null, 'Gyulia Martins Piqueira', 'gyulia.piqueira@sptech.school', '11975536244', '075.675.234-00', 'Gyulia06', 'Administrador', 1),
(null, 'Natalia Russo', 'natalia.russo@sptech.school', '11913653449', '234.567.235-09', 'Nat029', 'Administrador', 2),
(null, 'Isabel Bermudes', 'isabel.bermudes@sptech.school', '11944556244', '607.845.623-60', 'Isabel12', 'Administrador', 3),
(null, 'Alexandre Murata', 'alexandre.murata@sptech.school', '11975533333', '142.456.834-90', 'Alex1', 'Administrador', 4),
(null, 'Luiz Adorno', 'luiz.adorno@sptech.school', '11975534455', '000.023.012-91', 'Luiz0901', 'Funcionário', 4),
(null, 'Brudney Ramos', 'brudney.ramosjr@sptech.school', '11975532366', '923.534.890-96', sha2('Brudney2', 256), 'Funcionário', 2);

DELIMITER $
 DROP FUNCTION IF EXISTS fun_valida_usuario;
 CREATE FUNCTION fun_valida_usuario
	(p_login VARCHAR(100), p_senha VARCHAR(100) )
RETURNS INT(1)
DETERMINISTIC
 BEGIN
 DECLARE l_ret INT(1) DEFAULT 0;
     SET l_ret = IFNULL((SELECT DISTINCT 1 FROM Usuario WHERE Email = p_login
                       AND Senha = SHA2(p_senha,256)),0);
 RETURN l_ret;
 END$
 DELIMITER ;
 
SELECT CASE 
	WHEN fun_valida_usuario('brudney.ramosjr@sptech.school','Brudney2') = 1 
    THEN 'Login realizado com sucesso'
    ELSE 'Login ou senha incorreta' END Validação;
    
----------------------------------------------------------------------------------------------------------------------------------------
-- Criando a tabela sensor 
CREATE TABLE if not exists Sensor (
	IdSensor INT PRIMARY KEY auto_increment, -- ID do Sensor 
    NomeSensor VARCHAR(10) NOT NULL, -- Nome do modelo do sensor (apenas o LM35)
    CONSTRAINT ckcSensor CHECK (NomeSensor IN ('LM35')),  -- Configuração da checagem do modelo do sensor
	StatusSensor VARCHAR(10), -- Status do sensor
    CONSTRAINT ckcStatusSensor CHECK (StatusSensor in ('Ativo', 'Inativo', 'Manutenção')), -- Configuração da checagem do status
    SalaSensor VARCHAR(45) -- Sala que o sensor est localizado
);

-- Inserindo dados na tabela sensor 
INSERT INTO Sensor VALUES 
	(null, 'LM35', 'Ativo' , 'Sala1'),
	(null, 'LM35',  'Ativo' , 'Sala2'),
	(null, 'LM35',  'Ativo', 'Sala10'),
	(null, 'LM35',  'Ativo' , 'Sala5');
    
----------------------------------------------------------------------------------------------------------------------------------------
-- Criando a tabela leitura 
CREATE TABLE if not exists Leitura (
IdLeitura INT, -- Id da Leitura para identificar o registro da temperatura
TemperaturaTanque FLOAT, -- Registro da temperatura
DtAtual DATETIME DEFAULT current_timestamp, -- Data e horário do registro
fkSensorL INT, -- Chave estrangeira com a table sensor
	CONSTRAINT fkSensorL FOREIGN KEY (fkSensorL) REFERENCES Sensor(IdSensor), -- Chave estrangeira que identifica a leitura do sensor cadastrado
	CONSTRAINT pkCompostaL PRIMARY KEY (IdLeitura, fkSensorL) -- PRIMARY KEY COMPOSTA
);

-- Inserindo dados na tabela leitura
INSERT INTO Leitura (IdLeitura, TemperaturaTanque, fkSensorL) VALUES 
	(1, 50.90, 2),
	(1, 52.00, 1),
	(1, 55.00, 4),
	(1, 60.00, 3);
    
------------------------------------------------------------------------------------------------------------------------------------------
-- Criando a tabela tanque de fermentação
CREATE TABLE if not exists Tanque (
IdTanque INT, -- ID da Fermentação
Nome VARCHAR(10) NOT NULL, -- Tanque no qual o sensor foi colocado
NomeReceita VARCHAR(40), -- Nome do tipo de cerveja/receita produzida
TempMax DECIMAL (4,2), -- Temperatura máxima que a temperatura pode chegar para que o produtor não corra riscos 
TempMin DECIMAL (4,2), -- Temperatura mínima que a temperatura pode chegar para que o produtor não corra riscos 
EtapaFermentacao CHAR(1), 
	CONSTRAINT chkEtapa check (EtapaFermentacao in ('1', '2', '3')), -- Etapa de fermentação (primária, secundária, terciária)
fkSensorT INT, -- Chave estrangeira com a tabela sensor (onde as duas tabelas são fortes)
	CONSTRAINT fkSensorT FOREIGN KEY (fkSensorT) REFERENCES Sensor(IdSensor),  -- Chave estrangeira que identifica o tipo de fermentação do sensor cadastrado
fkEmpresaT INT, -- Chave estrangeira com a tabela empresa
		CONSTRAINT fkEmpresaT FOREIGN KEY (fkEmpresaT) REFERENCES Empresa(idEmpresa), -- Chave estrangeira que identifica a empresa em que o tanque está localizado
	CONSTRAINT pkCompostaT PRIMARY KEY (IdTanque, fkEmpresaT) -- PRIMARY KEY COMPOSTA
);

-- O tanque depende da empresa pois ele precisa ser comprado para a empresa ser caracterizada como cervejaria e para haver fermentação.
-- Inserindo dados na tabela tanque
INSERT INTO Tanque VALUES 
	(1, 'Tanque A', 'IPA', '18', '20', 1, 2, 3), -- ALE
	(1, 'Tanque B' ,'Pilsen', '10', '12', 2, 1, 4), -- LAGER
	(1, 'Tanque C', 'Stout', '18', '20', 3, 4, 2), -- ALE
	(1, 'Tanque D','Schwarzbier', '10', '12', 1, 3, 1); -- LAGER