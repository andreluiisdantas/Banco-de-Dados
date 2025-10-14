USE biblioteca_andre;

-- SELECT com filtro --
SELECT * FROM livro WHERE id_livro in (3,5);

-- ALTER TABLE das novas colunas de livro --
ALTER TABLE livro ADD data_publicacao DATE;
ALTER TABLE livro ADD edicao VARCHAR(255);
ALTER TABLE livro ADD status ENUM('ativo', 'inativo');

-- INSERT de nova categoria --
INSERT INTO categoria (categoria) VALUES ('Técnico');

-- INSERT livro --
INSERT INTO livro (titulo, isbn, descricao, data_publicacao, edicao, status) VALUES ("Python", "isbn-13:1718502702", "Livro de python zika", "2023-04-24", "3° Edição", "ativo");

-- INSERT categoria do livro --
INSERT INTO livro_categoria (id_livro, id_categoria) VALUES (11, 8);

-- UPDATE do email do usuario --
UPDATE usuario SET email = "teste@email.com" WHERE id_usuario = 1;

-- UPDATE do titulo do livro --
UPDATE livro SET titulo = "Curso Intensivo de Python: uma Introdução Prática e Baseada em Projetos à Prgramação" WHERE id_livro = 11;

-- UPDATE do livro com data antes de 2000 --
UPDATE livro SET status = "ativo" WHERE data_publicacao < "2000-01-01";

-- DELETE do livro com o id 2 --
DELETE FROM livro_autor WHERE id_livro = 2;
DELETE FROM livro_categoria WHERE id_livro = 2;
DELETE FROM emprestimo WHERE id_livro = 2;
DELETE FROM livro WHERE id_livro = 2;

-- DELETE do autor com nome Teste Testador --
UPDATE usuario SET nome = "Teste Testador" WHERE id_usuario = 3;
DELETE FROM emprestimo WHERE id_usuario = 3;
DELETE FROM associacao WHERE id_usuario = 3;
DELETE FROM usuario WHERE nome = "Teste Testador";

-- DELETE de todos os livros com status danificado --
ALTER TABLE livro MODIFY COLUMN status ENUM('ativo', 'inativo', 'danificado');
UPDATE livro SET status = "danificado" WHERE id_livro in (4, 8);
DELETE FROM livro_autor WHERE id_livro in (4, 8);
DELETE FROM livro_categoria WHERE id_livro in (4, 8);
DELETE FROM emprestimo WHERE id_livro in (4, 8);
DELETE FROM livro WHERE status = "danificado";

-- DELETE do empréstimo realizado em 2020 --
SELECT * FROM emprestimo;
UPDATE emprestimo SET data_emprestimo = "2020-05-07" WHERE id_emprestimo in (4,5);
DELETE FROM livro_autor WHERE id_livro in (3, 2);
DELETE FROM livro_categoria WHERE id_livro in (3, 2);
DELETE FROM emprestimo WHERE data_emprestimo = "2020-05-07";