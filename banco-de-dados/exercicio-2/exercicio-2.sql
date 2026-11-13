-- Exercício 2: Banco relacional (JOINs e filtros)
-- Usa as tabelas e os dados do Exercício 1.

-- Reset: garante o estado inicial (Maria em Ciência de Dados)
UPDATE alunos
SET curso_id = (SELECT id FROM cursos WHERE nome_curso = 'Ciência de Dados')
WHERE nome = 'Maria Souza';

-- 1. INNER JOIN: nome do aluno e nome do curso
SELECT a.nome AS aluno, c.nome_curso AS curso
FROM alunos a
INNER JOIN cursos c ON c.id = a.curso_id
ORDER BY a.nome;

-- 2. WHERE + JOIN: só os alunos de Desenvolvimento Web
SELECT a.nome AS aluno, c.nome_curso AS curso
FROM alunos a
INNER JOIN cursos c ON c.id = a.curso_id
WHERE c.nome_curso = 'Desenvolvimento Web';

-- 3. UPDATE: mover Maria para Desenvolvimento Web
UPDATE alunos
SET curso_id = (SELECT id FROM cursos WHERE nome_curso = 'Desenvolvimento Web')
WHERE nome = 'Maria Souza';

-- Conferindo a mudança com um novo SELECT + JOIN
SELECT a.nome AS aluno, c.nome_curso AS curso
FROM alunos a
INNER JOIN cursos c ON c.id = a.curso_id
ORDER BY a.nome;

-- EXTRA: cursos sem nenhum aluno matriculado (LEFT JOIN + WHERE)
SELECT c.id, c.nome_curso
FROM cursos c
LEFT JOIN alunos a ON a.curso_id = c.id
WHERE a.id IS NULL;
