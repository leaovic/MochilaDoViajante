-- Meu encarregado me pediu para criar um banco de dados que se pudesse ter um controle 
-- sobre os serviços de manutenção do quartel. Ele queria que tivesse um banco de dados 
-- com todos os militares que fazem parte da DSG(Divisão de Serviço Gerais).
-- Como a Divisão trabalha com manutenção, ele pediu também que tivesse um controle sobre os locais onde estamos 
-- trabalhando, as licenças e justificativas prestadas. As fainas(os serviços) onde estão sendo executados.ALTE


-- Com todas essas informções. eu criei:
CREATE DATABASE dsg;
-- Executei
USE dsg;
-- Criei a tabela para o cadastro dos militares
CREATE TABLE militares (
    IDmilitares INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    grad VARCHAR(20) NOT NULL,
    esp VARCHAR(20) NOT NULL,
    nip VARCHAR(8) NOT NULL,
    nome VARCHAR(50),
    nasc DATE,
    funcao VARCHAR(100)
);
-- Criei a tabela para o cadastro das oficinas
CREATE TABLE oficinas (
    IDoficinas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    supervisor VARCHAR(100) NOT NULL,
    caracter VARCHAR(200) NOT NULL
);
-- Criei a tabela para cadastrar as informações e os locais onde os serviços estarão sendo executados
CREATE TABLE fainas (
    IDfainas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(200) NOT NULL,
    data_inic DATE NOT NULL,
    data_fim DATE,
    setor VARCHAR(50) NOT NULL,
    num_sala VARCHAR(3)
    );
-- Criei a tabela para ter o controle sobre as licenças que os militares tirarão e assim planejar futuros 
-- serviços
CREATE TABLE licencas (
    IDlicencas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100),
    data_inic DATE,
    data_fim DATE
);

-- Selecionei a tabela para visualisar a estrutura
SELECT*FROM militares;
-- Selecionei a tabela para visualisar a estrutura
SELECT*FROM oficinas;
-- Inseri o primeiro cadastro de um militar eletricista
INSERT INTO militares (IDmilitares, grad, esp, nip, nome, nasc, funcao) 
VALUES (DEFAULT, 'CABO', 'eletricidade', '08029997', 'Leão', '1986-12-07', 'Aux do Supervisor');
INSERT INTO militares (IDmilitares, grad, esp, nip, nome, nasc, funcao) 
VALUES (DEFAULT, 'SG', 'eletricidade', '10020140', 'Ezequiel', '1992-04-20', 'Supervisor EL');
INSERT INTO militares (IDmilitares, grad, esp, nip, nome, nasc, funcao) 
VALUES (DEFAULT, 'SG', 'eletricidade', '10114034', 'Isaac', '1990-06-10', 'Eletricista');
INSERT INTO militares (IDmilitares, grad, esp, nip, nome, nasc, funcao) 
VALUES (DEFAULT, 'CABO', 'eletricidade', '14435643', 'Antonio', '1993-10-01', 'Eletricista');
-- Inseri a primeira oficina para alocar o cadastro do eletricista acima cadastrado
INSERT INTO oficinas (IDoficinas, nome, supervisor, caracter) 
VALUES (DEFAULT, 'Eletrica', 'Ezequiel', 'Oficinas para reparos e manutenção elétrica');
-- Adicionei a oficina na tabela como chave estrangeira
ALTER TABLE militares ADD FOREIGN KEY (oficina) REFERENCES oficinas(IDoficinas);
-- Adicionei oficina como chave estrangeira na tabela militares
UPDATE militares SET oficina = '1' WHERE IDmilitares = '1';
UPDATE militares SET oficina = '1' WHERE IDmilitares = '2';
UPDATE militares SET oficina = '1' WHERE IDmilitares = '3';
-- Adicionei uma coluna chamada oficina na tabela militares
ALTER TABLE militares ADD oficina INT;
-- Militar não trabalha mais na Divisão 
DELETE FROM militares WHERE IDmilitares = 4;
-- A intenção do banco de dados criado é quando iniciar um servico, será cadastrado 
-- tabela fainas os dados do setor a ser executado o trabalho, junto com os dados dos militares e oficina.

