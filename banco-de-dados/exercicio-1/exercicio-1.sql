-- Exercício 1: Banco relacional (SQL básico)

DROP TABLE IF EXISTS alunos;
DROP TABLE IF EXISTS cursos;

-- 1. Tabela cursos
CREATE TABLE cursos (
    id          SERIAL PRIMARY KEY,
    nome_curso  TEXT NOT NULL
);

-- 2. Tabela alunos
CREATE TABLE alunos (
    id        SERIAL PRIMARY KEY,
    nome      TEXT NOT NULL,
    email     TEXT NOT NULL,
    curso_id  INTEGER NOT NULL,
    CONSTRAINT fk_alunos_cursos
        FOREIGN KEY (curso_id) REFERENCES cursos (id)
);

-- 3. Dados de teste
INSERT INTO cursos (nome_curso) VALUES
    ('Desenvolvimento Web'),
    ('Ciência de Dados'),
    ('Segurança da Informação');

INSERT INTO alunos (nome, email, curso_id) VALUES
    ('João Silva',   'joao.silva@email.com',   1),
    ('Maria Souza',  'maria.souza@email.com',  2),
    ('Carlos Lima',  'carlos.lima@email.com',  1),
    ('Ana Pereira',  'ana.pereira@email.com',  2);

-- Critério: SELECT * FROM alunos retorna todos os alunos inseridos
SELECT * FROM alunos;

-- Critério: a FK barra um curso_id que não existe (este INSERT deve dar ERRO)
INSERT INTO alunos (nome, email, curso_id)
VALUES ('Aluno Inválido', 'invalido@email.com', 99);
