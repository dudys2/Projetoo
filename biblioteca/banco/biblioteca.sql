CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    isbn VARCHAR(30) NOT NULL UNIQUE,
    ano INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 0
);

CREATE TABLE livro_autor (
    id_livro INT NOT NULL,
    id_autor INT NOT NULL,
    PRIMARY KEY (id_livro, id_autor),
    CONSTRAINT fk_livro_autor_livro
        FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_livro_autor_autor
        FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE NOT NULL,
    CONSTRAINT fk_emprestimo_usuario
        FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_emprestimo_livro
        FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

/* DADOS EXEMPLO */
INSERT INTO usuario (nome, email) VALUES
('Eduardo', 'eduardo@email.com'),
('Maria', 'maria@email.com'),
('Lucas', 'lucas@email.com');

INSERT INTO autor (nome) VALUES
('Machado de Assis'),
('J. K. Rowling'),
('George Orwell');

INSERT INTO livro (titulo, isbn, ano, quantidade) VALUES
('Dom Casmurro', '111111111', 1899, 3),
('Harry Potter e a Pedra Filosofal', '222222222', 1997, 5),
('1984', '333333333', 1949, 2);

INSERT INTO livro_autor (id_livro, id_autor) VALUES
(1, 1),
(2, 2),
(3, 3);