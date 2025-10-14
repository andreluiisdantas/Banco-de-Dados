CREATE DATABASE biblioteca_andre;
USE biblioteca_andre;

SHOW DATABASES;

CREATE TABLE usuario(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    numero_identificacao INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_cadastro DATE NOT NULL
);

CREATE TABLE associacao(
	id_associacao INT PRIMARY KEY AUTO_INCREMENT,
    associacao VARCHAR(50) NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE autor(
	id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    data_nascimento DATE NOT NULL,
    biografia TEXT NOT NULL
);

CREATE TABLE livro(
	id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
    isbn VARCHAR(200) NOT NULL,
    descricao TEXT NOT NULL
);

CREATE TABLE livro_autor(
	id_livro_autor INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT NOT NULL,
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    id_autor INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
);

CREATE TABLE categoria(
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(50) NOT NULL
);

CREATE TABLE livro_categoria(
	id_livro_categoria INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT NOT NULL,
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE emprestimo(
	id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT NOT NULL,
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    data_emprestimo DATE NOT NULL,
    data_limite DATE NOT NULL,
    data_devolucao DATE NOT NULL
);

SHOW TABLES;

-- Inserindo 10 registros na tabela 'usuario'
INSERT INTO usuario (nome, numero_identificacao, email, data_cadastro) VALUES
('André da Silva', 123456, 'andre.silva@email.com', '2023-01-15'),
('Beatriz Costa', 234567, 'beatriz.costa@email.com', '2023-02-20'),
('Carlos Pereira', 345678, 'carlos.pereira@email.com', '2023-03-10'),
('Daniela Martins', 456789, 'daniela.martins@email.com', '2023-04-05'),
('Eduardo Oliveira', 567890, 'eduardo.oliveira@email.com', '2023-05-12'),
('Fernanda Souza', 678901, 'fernanda.souza@email.com', '2023-06-25'),
('Gustavo Lima', 789012, 'gustavo.lima@email.com', '2023-07-18'),
('Helena Santos', 890123, 'helena.santos@email.com', '2023-08-30'),
('Igor Almeida', 901234, 'igor.almeida@email.com', '2023-09-02'),
('Juliana Ribeiro', 112233, 'juliana.ribeiro@email.com', '2023-10-11');

-- Inserindo 10 registros na tabela 'associacao'
-- Assumindo que cada usuário tem um tipo de associação
INSERT INTO associacao (associacao, id_usuario) VALUES
('Estudante', 1),
('Professor', 2),
('Comunidade', 3),
('Estudante', 4),
('Comunidade', 5),
('Professor', 6),
('Estudante', 7),
('Comunidade', 8),
('Estudante', 9),
('Professor', 10);

-- Inserindo 10 registros na tabela 'autor'
INSERT INTO autor (nome, data_nascimento, biografia) VALUES
('Machado de Assis', '1839-06-21', 'Um dos maiores escritores da literatura brasileira, fundador da Academia Brasileira de Letras.'),
('Clarice Lispector', '1920-12-10', 'Escritora e jornalista ucraniana naturalizada brasileira, conhecida por seus romances introspectivos.'),
('Isaac Asimov', '1920-01-02', 'Escritor e professor de bioquímica, famoso por suas obras de ficção científica e divulgação científica.'),
('J.R.R. Tolkien', '1892-01-03', 'Escritor, filólogo e professor universitário, autor de "O Hobbit" e "O Senhor dos Anéis".'),
('Agatha Christie', '1890-09-15', 'Escritora britânica, conhecida como a "Rainha do Crime" por seus romances policiais.'),
('George Orwell', '1903-06-25', 'Escritor e jornalista inglês, autor das distopias "1984" e "A Revolução dos Bichos".'),
('Yuval Noah Harari', '1976-02-24', 'Historiador e professor israelense, autor de "Sapiens: Uma Breve História da Humanidade".'),
('Stephen King', '1947-09-21', 'Escritor americano, reconhecido por seus romances de terror, ficção sobrenatural e suspense.'),
('J.K. Rowling', '1965-07-31', 'Autora britânica, famosa pela série de livros "Harry Potter".'),
('Gabriel García Márquez', '1927-03-06', 'Escritor colombiano, um dos principais autores do realismo mágico, vencedor do Nobel de Literatura.');

-- Inserindo 10 registros na tabela 'livro'
INSERT INTO livro (titulo, isbn, descricao) VALUES
('Dom Casmurro', '978-8535914648', 'Um clássico da literatura brasileira que narra a história de Bentinho e Capitu, explorando temas como ciúme e dúvida.'),
('A Hora da Estrela', '978-8532505672', 'A história de Macabéa, uma jovem nordestina em busca de sua identidade no Rio de Janeiro.'),
('Eu, Robô', '978-8576570322', 'Uma coletânea de contos que exploram a relação entre humanos e robôs através das Três Leis da Robótica.'),
('O Senhor dos Anéis: A Sociedade do Anel', '978-8595084759', 'O início da jornada de Frodo para destruir o Um Anel e salvar a Terra-média.'),
('O Assassinato no Expresso do Oriente', '978-8525433116', 'O detetive Hercule Poirot investiga um assassinato a bordo de um trem luxuoso.'),
('1984', '978-8535914846', 'Uma distopia sobre um futuro totalitário onde o Grande Irmão tudo vê e tudo controla.'),
('Sapiens: Uma Breve História da Humanidade', '978-8535923886', 'Uma análise da história da humanidade, desde os primeiros humanos até as revoluções do século XXI.'),
('O Iluminado', '978-8560280998', 'Um homem aceita um emprego de zelador em um hotel isolado e começa a perder a sanidade.'),
('Harry Potter e a Pedra Filosofal', '978-8532530294', 'O primeiro livro da saga do jovem bruxo Harry Potter em sua jornada na Escola de Magia e Bruxaria de Hogwarts.'),
('Cem Anos de Solidão', '978-8501012149', 'A história da família Buendía na cidade fictícia de Macondo, um marco do realismo mágico.');

-- Inserindo 10 registros na tabela 'livro_autor' (relação N:N)
INSERT INTO livro_autor (id_livro, id_autor) VALUES
(1, 1),  -- Dom Casmurro -> Machado de Assis
(2, 2),  -- A Hora da Estrela -> Clarice Lispector
(3, 3),  -- Eu, Robô -> Isaac Asimov
(4, 4),  -- O Senhor dos Anéis -> J.R.R. Tolkien
(5, 5),  -- O Assassinato no Expresso do Oriente -> Agatha Christie
(6, 6),  -- 1984 -> George Orwell
(7, 7),  -- Sapiens -> Yuval Noah Harari
(8, 8),  -- O Iluminado -> Stephen King
(9, 9),  -- Harry Potter -> J.K. Rowling
(10, 10); -- Cem Anos de Solidão -> Gabriel García Márquez

-- Inserindo registros na tabela 'categoria'
INSERT INTO categoria (categoria) VALUES
('Romance'),
('Ficção Científica'),
('Fantasia'),
('Mistério'),
('Distopia'),
('Não-Ficção'),
('Terror');

-- Inserindo registros na tabela 'livro_categoria'
INSERT INTO livro_categoria (id_livro, id_categoria) VALUES
(1, 1),  
(2, 1),  
(3, 2),  
(4, 3), 
(5, 4),  
(6, 5), 
(6, 2),  
(7, 6), 
(8, 7), 
(9, 3); 

-- Inserindo registros na tabela 'emprestimo'
INSERT INTO emprestimo (id_livro, id_usuario, data_emprestimo, data_limite, data_devolucao) VALUES
(1, 1, '2024-01-10', '2024-01-24', '2024-01-22'),
(3, 2, '2024-02-05', '2024-02-19', '2024-02-18'),
(5, 3, '2024-03-12', '2024-03-26', '2024-03-25'),
(7, 4, '2024-04-01', '2024-04-15', '2024-04-15'),
(9, 5, '2024-05-20', '2024-06-03', '2024-06-01'),
(2, 6, '2024-06-15', '2024-06-29', '2024-06-28'),
(4, 7, '2024-07-02', '2024-07-16', '2024-07-10'),
(6, 8, '2024-08-11', '2024-08-25', '2024-08-20'),
(8, 9, '2024-09-03', '2024-09-17', '2024-09-17'),
(10, 10, '2024-10-01', '2024-10-15', '2024-10-14');


