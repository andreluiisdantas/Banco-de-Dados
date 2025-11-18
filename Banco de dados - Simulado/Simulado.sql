DROP DATABASE IF EXISTS GameZoneDB;
CREATE DATABASE GameZoneDB;
USE GameZoneDB;

-- Tabelas
CREATE TABLE Genero (
 id INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(60) NOT NULL
);

CREATE TABLE Jogo (
 id INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(100) NOT NULL,
 genero_id INT NOT NULL,
 preco DECIMAL(10,2) NOT NULL,
 ano_lancamento INT NOT NULL,
 FOREIGN KEY (genero_id) REFERENCES Genero(id)
);

CREATE TABLE Jogador (
 id INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(100) NOT NULL,
 pais VARCHAR(60),
 data_cadastro DATE
);

CREATE TABLE Compra (
 id INT PRIMARY KEY AUTO_INCREMENT,
 jogo_id INT NOT NULL,
 jogador_id INT NOT NULL,
 data_compra DATE NOT NULL,
 FOREIGN KEY (jogo_id) REFERENCES Jogo(id),
 FOREIGN KEY (jogador_id) REFERENCES Jogador(id)
);

CREATE TABLE AvaliacaoJogo (
 id INT PRIMARY KEY AUTO_INCREMENT,
 jogador_id INT NOT NULL,
 jogo_id INT NOT NULL,
 nota DECIMAL(3,1) NOT NULL,
 comentario VARCHAR(255),
 data DATE NOT NULL,
 FOREIGN KEY (jogador_id) REFERENCES Jogador(id),
 FOREIGN KEY (jogo_id) REFERENCES Jogo(id)
);

INSERT INTO Genero (nome) VALUES
('Aventura'),
('Puzzle'),
('Estratégia'),
('Corrida');

INSERT INTO Jogo (nome, genero_id, preco, ano_lancamento) VALUES
('Sky Runner', 1, 200.00, 2024),
('Adventure Lite', 1, 120.00, 2023),
('Logic Quest', 2, 80.00, 2022),
('Block Builder', 2, 90.00, 2023),
('Mind Tactics', 3, 150.00, 2025),
('Speed Rush', 4, 110.00, 2023);

INSERT INTO Jogador (nome, pais, data_cadastro) VALUES
('Ana', 'BR', '2025-06-01'),
('Bruno', 'BR', '2025-06-10'),
('Carla', 'BR', '2025-06-15'),
('Diego', 'BR', '2025-07-01'),
('Eva', 'BR', '2025-07-05');

INSERT INTO Compra (jogo_id, jogador_id, data_compra) VALUES
(1, 1, '2025-07-01'),
(4, 1, '2025-07-15'),
(2, 2, '2025-08-10'),
(5, 2, '2025-08-25'),
(3, 3, '2025-09-05'),
(6, 3, '2025-09-12'),
(2, 4, '2025-09-18');

INSERT INTO AvaliacaoJogo (jogador_id, jogo_id, nota, comentario, data) VALUES
(1, 1, 9.0, 'ótimo', '2025-07-20'),
(1, 4, 9.2, 'viciante', '2025-07-25'),
(2, 2, 7.0, 'mediano', '2025-08-20'),
(2, 5, 8.8, 'bem tático', '2025-08-28'),
(3, 6, 8.0, 'divertido', '2025-09-20'),
(3, 3, 8.5, 'bom puzzle', '2025-09-25');

-- Exercicio 1
SELECT
	Jogo.nome,
    Jogador.nome
FROM Jogo
INNER JOIN Compra ON Compra.jogo_id = Jogo.id
INNER JOIN Jogador ON Jogador.id = Compra.jogador_id
WHERE Jogo.ano_lancamento >= 2023
ORDER BY Jogo.nome, Jogador.nome;

-- Exercicio 2
SELECT
	Jogador.nome,
    Jogo.nome,
    Genero.nome,
    Compra.data_compra
FROM Jogo
INNER JOIN Compra ON Compra.jogo_id = Jogo.id
INNER JOIN Jogador ON Jogador.id = Compra.jogador_id
INNER JOIN Genero ON Genero.id = Jogo.genero_id
WHERE Jogo.id IN ( SELECT id
				FROM Jogo
				WHERE Genero_id = (
					SELECT id
                    FROM Genero
                    WHERE nome = "Aventura"
                ))
ORDER BY Compra.data_compra ASC;

-- Exercicio 03
SELECT
	Jogador.nome,
    AVG(AvaliacaoJogo.nota)
FROM Jogador
LEFT JOIN AvaliacaoJogo ON AvaliacaoJogo.jogador_id = Jogador.id
GROUP BY Jogador.id;

-- Exercicio 04
SELECT 
	Jogador.nome
FROM Jogador
INNER JOIN Compra ON Compra.jogador_id = Jogador.id
INNER JOIN Jogo ON Compra.jogo_id = Jogo.id
WHERE Jogador.id IN ( SELECT jogador_id
			FROM Compra
            WHERE jogo_id IN ( SELECT id
							FROM Jogo
                            WHERE Jogo.preco > (SELECT AVG(preco) FROM Jogo)
                            ))
GROUP BY Jogador.nome;

-- Exercicio 05
SELECT 
	UPPER(Jogador.nome) AS Nome,
    SUBSTRING(Jogador.Nome, 1, 2) AS Apelido
FROM Jogador;

-- Exercicio 06
SELECT
	AVG(nota) AS media
FROM AvaliacaoJogo;                          

-- Exercicio 07
SELECT 
	genero.nome,
    AVG(AvaliacaoJogo.nota) AS Media
FROM genero
INNER JOIN Jogo ON Jogo.genero_id = Genero.id
INNER JOIN AvaliacaoJogo ON AvaliacaoJogo.jogo_id = Jogo.id
GROUP BY genero.nome
HAVING AVG(AvaliacaoJogo.nota) > 8.5
ORDER BY Media DESC;