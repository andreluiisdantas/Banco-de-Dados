-- 1. Criação do banco
CREATE DATABASE lojaMarcia;
USE lojaMarcia;
 
-- 2. Tabelas
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(50)
);
 
CREATE TABLE fornecedores (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome_fornecedor VARCHAR(100),
    pais VARCHAR(50)
);
 
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100),
    preco DECIMAL(10, 2),
    id_categoria INT,
    id_fornecedor INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);
 
-- 3. Inserção dos dados
INSERT INTO categorias (nome_categoria) VALUES
('Eletrônicos'), ('Roupas'), ('Livros'), ('Esportes');
 
INSERT INTO fornecedores (nome_fornecedor, pais) VALUES
('TechGlobal', 'EUA'), ('ModaBrasil', 'Brasil'), ('BookWorld', 'EUA'), ('SportsInc', 'Brasil'), ('Fornecedor Fantasma', 'Japão');
 
INSERT INTO produtos (nome_produto, preco, id_categoria, id_fornecedor) VALUES
('Notebook', 3500.00, 1, 1),      -- Eletrônicos, TechGlobal
('Smartphone', 1500.00, 1, 1),   -- Eletrônicos, TechGlobal
('Camiseta', 80.00, 2, 2),       -- Roupas, ModaBrasil
('Calça Jeans', 120.00, 2, 2),     -- Roupas, ModaBrasil
('O Gene Egoísta', 50.00, 3, 3),   -- Livros, BookWorld
('Bola de Futebol', 100.00, 4, 4); -- Esportes, SportsInc


-- Exemplo 01
SELECT nome_produto, preco
FROM produtos
WHERE id_categoria = (
	SELECT id_categoria
    FROM categorias
    WHERE nome_categoria = 'Eletrônicos'
);

-- Exemplo 02
SELECT nome_produto, preco
FROM produtos
WHERE id_fornecedor IN (
	SELECT id_fornecedor
    FROM fornecedores
    WHERE pais = 'EUA'
);

-- Exemplo 03
SELECT nome_produto, preco
FROM produtos
WHERE id_fornecedor NOT IN (
	SELECT id_fornecedor
    FROM fornecedores
    WHERE pais = 'EUA'
);

-- Exemplo 04
SELECT nome_produto, preco
FROM produtos
WHERE preco > ANY (
	SELECT preco
    FROM produtos
    WHERE id_categoria = 2
);

-- Exemplo 05
SELECT nome_produto, preco
FROM produtos
WHERE PRECO > ALL (
	SELECT preco
    FROM produtos
    WHERE id_categoria = 2 
);

-- Exemplo 06
SELECT nome_categoria
FROM categorias
WHERE EXISTS(
	SELECT * 
    FROM produtos
    WHERE produtos.id_categoria = categorias.id_categoria
);

-- Exemplo 07
SELECT nome_fornecedor
FROM fornecedores
WHERE NOT EXISTS (
	SELECT 1
    FROM produtos
    WHERE produtos.id_fornecedor = fornecedores.id_fornecedor
);

-- Exemplo 08
SELECT nome_categoria, media_preco_categoria
FROM (
	SELECT
		c.nome_categoria,
        AVG(p.preco) AS media_preco_categoria
        FROM produtos AS p
        JOIN categorias AS c ON p.id_categoria = c.id_categoria
        GROUP BY c.nome_categoria
) AS tabela_medias
WHERE media_preco_categoria > 100;

-- Exemplo 09
SELECT nome_categoria,
	(SELECT COUNT(*)
		FROM produtos
		WHERE produtos.id_categoria = categorias.id_categoria
	) AS quantidade_produtos
FROM categorias;