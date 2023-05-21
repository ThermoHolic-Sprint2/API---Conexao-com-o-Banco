-- SELECTS:


-- SELECTS EMPRESA


-- Exibição dos registros da tabela empresa
SELECT * FROM Empresa; 
-- Exibição dos nomes das empresas
SELECT Nome FROM Empresa; 
-- Exibição dos CNPJS das empresas
SELECT CNPJ FROM Empresa; 
-- Exibição da quantidade de tanques de fermentação das empresas
SELECT QtdTanques FROM Empresa; 

-- Descrição da tabela Empresa
DESC Empresa;


-- SELECTS USUARIO


-- Exibir todos os dados da tabela usuário
SELECT * FROM Usuario;
-- Exibição dos registros com a *ultima* letra do nome sendo A
SELECT * FROM Usuario WHERE Nome LIKE '%A';
-- Exibição dos registros com a *primeira* letra do nome sendo G 
SELECT * FROM Usuario WHERE Nome LIKE 'G%'; 
-- Exibição dos registros com a *penultima* letra do nome sendo O
SELECT * FROM Usuario WHERE Nome LIKE '%O_'; 
-- Exibição dos registros com a *segunda* letra do nome sendo U
SELECT * FROM Usuario WHERE Nome LIKE '_U%'; 
-- Exibição dos registros ordenados em ordem decrescente do nome
SELECT * FROM Usuario ORDER BY Nome DESC; 
-- Exibição do CPF dos usuários
SELECT CPF FROM Usuario; 
-- Exibição dos registros ordenados em ordem decrescente do email
SELECT * FROM Usuario ORDER BY Email; 
 -- Exibição do telefone dos usuárioS
SELECT Celular FROM Usuario;

-- SELECTS + JOIN:
-- Exibição de todos os dados da tabela empresa junto com todos os dados da tabela usuário
SELECT * FROM Empresa JOIN Usuario ON idEmpresa = fkEmpresaU; 

-- Exibição do nome e da senha do usuário (com os campos escritos de outra forma) junto com o nome das empresas
SELECT 
Usuario.nome AS Nome_Usuario, 
Usuario.senha AS Senha_Usuario, 
Usuario.celular AS Celular_Usuario,
Empresa.nome AS Nome_Empresa
FROM Empresa JOIN Usuario ON idEmpresa = fkEmpresaU;

-- Exibição de todos os dados da tabela empresa junto com todos os dados da tabela usuário para o usuário com um determinado nome
SELECT * FROM Empresa JOIN Usuario ON idEmpresa = fkEmpresaU WHERE Usuario.nome= 'Natalia Russo';

-- Exibição de todos os dados da tabela empresa junto com todos os dados da tabela usuário para o usuário com uma determinada *penúltima* letra do nome
SELECT * FROM Empresa JOIN Usuario ON idEmpresa = fkEmpresaU WHERE Usuario.nome LIKE '%O_'; 
-- Exibição de todos os dados da tabela empresa junto com todos os dados da tabela usuário para o usuário com um determinado CPF 
SELECT * FROM Empresa JOIN Usuario ON idEmpresa = fkEmpresaU WHERE Usuario.CPF= '607.845.623-60';
-- Exibição de todos os dados da tabela empresa junto com todos os dados da tabela usuário para o usuário com uma determinada senha
SELECT * FROM Empresa JOIN Usuario ON idEmpresa = fkEmpresaU WHERE Usuario.Senha= 'Alex1';
-- Exibição de todos os dados da tabela empresa junto com todos os dados da tabela usuário para o usuário com um determinado ID
SELECT * FROM Empresa JOIN Usuario ON idEmpresa = fkEmpresaU WHERE Usuario.IdUsuario= '1'; 
-- Exibição de todos os dados da tabela empresa junto com todos os dados da tabela usuário para empresa com um determinado ID 
SELECT * FROM Empresa JOIN Usuario ON idEmpresa = fkEmpresaU WHERE Usuario.fkEmpresaU= '4';
-- Exibição do id de um determinado email
SELECT IdUsuario FROM Usuario WHERE Email LIKE 'alexandre.murata@sptech.school'; 
 

-- Exibição dos nomes das empresas e dos nomes dos usuários contidos nela
SELECT 
e.nome AS'NOME_EMPRESA',
u.nome AS 'NOME_USUARIO'
FROM empresa AS e JOIN usuario AS u ON u.fkEmpresaU = e.idEmpresa; 


-- Exibição de um determinado nome da empresa e dos nomes dos usuários contidos nela
SELECT 
e.nome AS'NOME_EMPRESA',
u.nome AS 'NOME_USUARIO'
FROM empresa AS e JOIN usuario AS u ON u.fkEmpresaU = e.idEmpresa WHERE e.nome = 'Cevada Pura';

-- Exibição da descrição da tabela usuário
DESC Usuario; 


-- SELECTS SENSOR


-- Exibição dos registros da tabela sensor
SELECT * FROM Sensor; 

-- SELECTS:
-- Exibição dos registros com determinado status
SELECT * FROM Sensor WHERE StatusSensor = 'Ativo';
-- Exibição do tanque de um determinado sensor por id
SELECT NomeSensor FROM Sensor WHERE IdSensor= 1; 

-- Exibição da descrição da tabela sensor
DESC Sensor;


-- SELECTS LEITURA


-- SELECTS:
-- Exibição dos registros da tabela leitura
SELECT * FROM Leitura; 
-- Exibição dos sensores da tabela leitura
SELECT fkSensorL FROM Leitura; 
-- Exibição das datas dos registros de leitura
SELECT DtAtual FROM Leitura; 
-- Exibição dos registros de temperatura em ordem decrescente da leitura
SELECT TemperaturaTanque FROM Leitura ORDER BY TemperaturaTanque DESC; 

-- SELECTS + JOIN:
-- Exibição de todos os dados da tabela leitura junto com todos os dados da tabela sensor
SELECT * FROM Leitura JOIN Sensor ON idSensor = fkSensorL; 
-- Exibição de todos os dados da tabela leitura junto com todos os dados da tabela sensor e tanque
SELECT * FROM Leitura JOIN Sensor ON idSensor = fkSensorL JOIN Tanque ON idSensor = fkSensorT;  
-- Exibição de todos os dados da tabela leitura junto com todos os dados da tabela sensor e tanque de uma determinada empresa
SELECT * FROM Leitura JOIN Sensor ON idSensor = fkSensorL JOIN Tanque ON idSensor = fkSensorT JOIN Empresa ON idEmpresa = fkEmpresaT WHERE Empresa.nome= 'Dogma'; 


-- SELECTS TANQUES


-- Exibição dos registros da tabela tanque
SELECT * FROM Tanque; 

-- SELECTS:
-- Exibição da temperatura máxima dos registros de tanque
SELECT TempMax FROM Tanque; 
-- Exibição dos registros de temperatura mínima em ordem decrescente da tabela tanque
SELECT TempMin FROM Tanque ORDER BY TempMin DESC; 

-- SELECTS + JOIN:
-- Exibição de todos os dados da tabela tanque junto com todos os dados da tabela sensor
SELECT * FROM Tanque JOIN Sensor ON idSensor = fkSensorT; 
-- Exibição de todos os dados da tabela tanque junto com todos os dados da tabela sensor e leitura
SELECT * FROM Tanque JOIN Sensor ON idSensor = fkSensorT JOIN Leitura ON idSensor = fkSensorL;
-- Exibição de todos os dados da tabela tanque junto com todos os dados da tabela sensor, leitura e empresa
SELECT * FROM Tanque JOIN Sensor ON idSensor = fkSensorT JOIN Leitura ON idSensor = fkSensorL JOIN Empresa ON idEmpresa = fkEmpresaT; 
 -- Exibição de todos os dados da tabela tanque junto com todos os dados da tabela sensor, leitura, usuário e empresa
SELECT * FROM Tanque JOIN Sensor ON idSensor = fkSensorT JOIN Leitura ON idSensor = fkSensorL JOIN Empresa ON idEmpresa = fkEmpresaT JOIN Usuario ON idEmpresa = fkEmpresaU; 


-- SELECTS GERAIS, JOINS


-- Exibição de todos os dados da tabela tanque junto com todos os dados da tabela sensor e leitura de determinado nome de receita
SELECT * FROM Tanque JOIN Sensor ON idSensor = fkSensorT JOIN Leitura ON idSensor = fkSensorL WHERE Tanque.NomeReceita= 'IPA';

-- Exibição dos campos determinados da tabela usuário, sensor, leitura, tanque e empresa 
SELECT
Tanque.NomeReceita,
Leitura.DtAtual,
Sensor.idsensor, 
Empresa.cnpj, 
Usuario.nome, 
Usuario.email
FROM Tanque 
	JOIN Sensor 
		ON idSensor = fkSensorT 
	JOIN Leitura 
		ON idSensor = fkSensorL 
	JOIN Empresa 
		ON idEmpresa = fkEmpresaT 
	JOIN Usuario 
		ON idEmpresa = fkEmpresaU;


------------------------------------------------------------------------------------------------------------------------------------------
-- OUTROS TIPOS DE SELECT:

SELECT TemperaturaTanque, timestampdiff(DAY,DtAtual, NOW()) AS TEMPO FROM Leitura;
        
SELECT DATE_FORMAT(DtAtual,'%d/%m/%Y') AS formatoBR FROM Leitura;
SELECT DATE_FORMAT(DtAtual,'%d/%m/%y') AS formatoBR FROM Leitura;
SELECT DATE_FORMAT(DtAtual,'%d/%M/%y') AS formatoBR FROM Leitura;
SELECT DATE_FORMAT(DtAtual,'%D/%M/%Y') AS formatoBR FROM Leitura;
SELECT DATE_FORMAT(DtAtual,'%D/%m/%y') AS formatoBR FROM Leitura;

SELECT  
CONCAT('O usuario ', Usuario.nome, ' pertence à empresa ', Empresa.Nome) AS frase FROM Usuario JOIN Empresa on idEmpresa = fkEmpresau;
    
-- ALTER TABLE:
-- ALTER TABLE *TABELA* ADD COLUMN *NOMEDACOLUNA* TIPO;
-- ALTER TABLE *TABELA* RENAME COLUMN *NOMEDACOLUNAATUAL* TO *NOVONOME*;
-- ALTER TABLE *TABELA* MODIFY COLUMN *NOMEDACOLUNAATUAL* *NOVOTIPO*;
-- ALTER TABLE *TABELA* DROP COLUMN *NOMEDACOLUNAATUAL*;
-- TRUNCATE TABLE *TABELA*;
-- UPDATE *TABELA* SET *COLUNAASERALTERADA* = *NOVOVALOR* WHERE *CONDIÇÃO*;
-- DELETE FROM *TABELA* WHERE *CONDIÇÃO*