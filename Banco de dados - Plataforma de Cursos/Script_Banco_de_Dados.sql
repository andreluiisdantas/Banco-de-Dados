CREATE DATABASE Plataforma_Curso;

USE Plataforma_Curso;

CREATE TABLE Professor(
	id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Curso(
	id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(225) NOT NULL
);

CREATE TABLE Modulo(
	id INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES Curso(id),
    Ordem INT NOT NULL,
    Carga_Horaria INT NOT NULL
);

CREATE TABLE Professor_Curso(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES Curso(id),
    id_professor INT NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES Professor(id),
    papel ENUM('Titular', 'Tutor') NOT NULL
);

CREATE TABLE Plano(
	id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) UNIQUE NOT NULL,
    beneficios TEXT NOT NULL
);

CREATE TABLE Aluno(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    id_plano INT,
    FOREIGN KEY (id_plano) REFERENCES Plano(id)
);

CREATE TABLE Perfil(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id),
    foto BLOB NOT NULL,
    data_nascimento DATE,
    biografia TEXT
);


CREATE TABLE Status_Inscricao(
	id INT AUTO_INCREMENT PRIMARY KEY,
	status ENUM('Ativa', 'Concluida', 'Trancada') NOT NULL
);

CREATE TABLE Inscricao(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES Curso(id),
    id_aluno INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id),
    data_inscricao DATE,
    id_status INT NOT NULL,
    FOREIGN KEY (id_status) REFERENCES Status_Inscricao(id)
);

INSERT INTO Professor (Nome) VALUES
('Ana Silva'),
('Bruno Costa'),
('Carla Dias'),
('Daniel Farias'),
('Eduarda Lima');

INSERT INTO Curso (Nome) VALUES
('Introdução à Programação em Python'),
('Desenvolvimento Web com HTML, CSS e JavaScript'),
('Banco de Dados SQL Essencial'),
('Marketing Digital para Iniciantes'),
('Gestão de Projetos com Metodologias Ágeis');


INSERT INTO Modulo (Titulo, id_curso, Ordem, Carga_Horaria) VALUES
('Lógica de Programação', 1, 1, 10),
('Estruturas de Dados em Python', 1, 2, 15),
('Programação Orientada a Objetos com Python', 1, 3, 20),

('Fundamentos de HTML5', 2, 1, 8),
('Estilização com CSS3', 2, 2, 12),
('Interatividade com JavaScript', 2, 3, 18),

('Consultas Básicas com SELECT', 3, 1, 12),
('Joins e Subconsultas', 3, 2, 15),
('Modelagem de Banco de Dados', 3, 3, 10),

('Introdução ao SEO', 4, 1, 6),
('Marketing de Conteúdo', 4, 2, 8),
('Análise de Métricas com Google Analytics', 4, 3, 10),

('Introdução ao Scrum', 5, 1, 10),
('Framework Kanban', 5, 2, 8),
('Gerenciamento de Riscos em Projetos', 5, 3, 12);

INSERT INTO Professor_Curso (id_curso, id_professor, papel) VALUES
(1, 1, 'Titular'),  
(2, 2, 'Titular'),  
(3, 1, 'Tutor'),   
(4, 3, 'Titular'),  
(5, 4, 'Tutor');  

INSERT INTO Plano (tipo, beneficios) VALUES
('Básico', 'Acesso a 1 curso por mês.'),
('Padrão', 'Acesso a 5 cursos por mês e emissão de certificado.'),
('Premium', 'Acesso ilimitado a todos os cursos, certificados e tutoria exclusiva.'),
('Gratuito', 'Acesso a cursos selecionados com funcionalidade limitada.'),
('Corporativo', 'Acesso para equipes com relatórios de progresso.');

INSERT INTO Aluno (nome, id_plano) VALUES
('Fernanda Gonçalves', 3),
('Gustavo Martins', 2),   
('Helena Oliveira', 1),   
('Igor Santos', 4),      
('Juliana Pereira', 2); 

INSERT INTO Perfil (id_aluno, foto, data_nascimento, biografia) VALUES
(1, 'foto_binaria_1', '1995-03-15', 'Entusiasta de tecnologia e desenvolvimento de software.'),
(2, 'foto_binaria_2', '2001-11-20', 'Estudante de engenharia buscando novos conhecimentos.'),
(3, 'foto_binaria_3', '1988-07-01', 'Profissional em transição de carreira para a área de TI.'),
(4, 'foto_binaria_4', '2003-01-30', 'Jovem curioso sobre o mundo digital.'),
(5, 'foto_binaria_5', '1999-09-10', 'Designer procurando expandir habilidades em programação.');

INSERT INTO Status_Inscricao (status) VALUES
('Ativa'),
('Concluida'),
('Trancada');

INSERT INTO Inscricao (id_curso, id_aluno, data_inscricao, id_status) VALUES
(1, 1, '2023-01-10', 1), 
(2, 2, '2023-02-05', 1), 
(3, 3, '2022-11-20', 2), 
(1, 4, '2023-03-01', 1), 
(4, 5, '2023-01-15', 3);

SELECT * FROM Professor;
SELECT * FROM Curso;
SELECT * FROM Modulo;
SELECT * FROM Professor_Curso;
SELECT * FROM Plano;
SELECT * FROM Aluno;
SELECT * FROM Perfil;
SELECT * FROM Status_Inscricao;
SELECT * FROM Inscricao;
