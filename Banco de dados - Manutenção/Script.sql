CREATE DATABASE ordens_manutencao;
USE ordens_manutencao;

CREATE TABLE Manutentor(
	id INT AUTO_INCREMENT PRIMARY KEY,
    numero_identificacao INT UNIQUE NOT NULL,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    descricao_conhecimento TEXT NOT NULL
);

CREATE TABLE Setor(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Fabricante(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Peca(
	id INT AUTO_INCREMENT PRIMARY KEY,
    codigo INT UNIQUE NOT NULL,
    nome VARCHAR(255) NOT NULL,
    id_fabricante INT NOT NULL,
    FOREIGN KEY (id_fabricante) REFERENCES Fabricante (id)
);

CREATE TABLE Equipamento(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    ano INT NOT NULL,
    id_setor INT NOT NULL,
    FOREIGN KEY (id_setor) REFERENCES Setor (id),
    id_fabricante INT NOT NULL,
    FOREIGN KEY (id_fabricante) REFERENCES Fabricante(id)
);

CREATE TABLE Agendamento_Preventiva(
	id INT AUTO_INCREMENT PRIMARY KEY,
    proxima_manutencao DATE NOT NULL,
    id_equipamento INT NOT NULL,
    FOREIGN KEY (id_equipamento) REFERENCES Equipamento (id)
);

CREATE TABLE Manutencao(
	id INT AUTO_INCREMENT PRIMARY KEY,
    status_manutencao ENUM('Ativa', 'Em andamento', 'Concluido'),
	tipo ENUM('Preventiva', 'Corretiva') NOT NULL,
    resultado TEXT NOT NULL,
    qtd_peca INT,
    id_peca INT,
    FOREIGN KEY (id_peca) REFERENCES Peca(id),
    id_equipamento INT NOT NULL,
    FOREIGN KEY (id_equipamento) REFERENCES Equipamento (id)
);

CREATE TABLE Servico_Manutentor(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_manutentor INT NOT NULL,
    FOREIGN KEY (id_manutentor) REFERENCES Manutentor (id),
    id_equipamento INT NOT NULL,
    FOREIGN KEY (id_equipamento) REFERENCES Equipamento (id)
);


INSERT INTO Manutentor (numero_identificacao, nome, email, descricao_conhecimento) VALUES
(1001, 'Andre Luis Sousa Dantas', 'andredantas@gmail.com', 'Especialista em manutenção de tornos'),
(1002, 'Enzo Previtale', 'enzoprevitale@gmail.com', 'Especialista em injetoras plásticas'),
(1003, 'Antônio Rodrigues', 'antoniorodrigues@gmail.com', 'Especialista e manutenção com soldas');


INSERT INTO Setor (nome) VALUES
('Power Solution'),
('Power Tools'),
('Vehicle Motion');

INSERT INTO Fabricante (nome) VALUES
('ROMI'),
('WEG'),
('Trimaq');

INSERT INTO Peca (codigo, nome, id_fabricante) VALUES
(2001, 'Polia', 1),
(2002, 'Engrenagem', 2),
(2003, 'Corrente', 3);

INSERT INTO Equipamento (nome, ano, id_setor, id_fabricante) VALUES
('Torno', 1980, 1, 1),
('Fresa', 1990, 1, 2),
('Plaina', 2005, 2, 3),
('Injetora', 2020, 2, 1),
('Retificadoras', 1999, 3, 2),
('Prensas hidráulicas', 1970, 3, 3);

INSERT INTO Agendamento_Preventiva (proxima_manutencao, id_equipamento) VALUES 
('2025-09-25', 1),
('2025-10-24', 2),
('2025-09-23', 3);

INSERT INTO Manutencao (status_manutencao, tipo, resultado, qtd_peca, id_peca, id_equipamento) VALUES 
('Concluido' , 'Preventiva', 'Equipamento funcionando bem, feito trocas de peças básicas apenas.', 2, 1, 1),
('Concluido' , 'Preventiva', 'Equipamento funcionando bem, feito trocas de peças básicas apenas.', 4, 2, 2),
('Concluido' , 'Preventiva', 'Equipamento funcionando bem, feito trocas de peças básicas apenas.', 10, 3, 3),
('Ativa' , 'Corretiva', 'Equipamento parado', NULL, NULL, 4),
('Em andamento' , 'Corretiva', 'Equipamento parado', 2, 2, 5),
('Ativa' , 'Corretiva', 'Equipamento parado', NULL, NULL, 6);

INSERT INTO Servico_Manutentor (id_manutentor, id_equipamento) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6);

SELECT * FROM Manutentor;
SELECT * FROM Setor;
SELECT * FROM Fabricante;
SELECT * FROM Peca;
SELECT * FROM Equipamento;
SELECT * FROM Agendamento_Preventiva;
SELECT * FROM Manutencao;
SELECT * FROM Servico_Manutentor;


