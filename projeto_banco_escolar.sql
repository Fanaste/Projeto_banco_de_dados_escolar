-- 📚 Projeto Banco de Dados Escolar – SQLite
-- Este projeto consiste na criação de um banco de dados relacional para gerenciamento de informações escolares como alunos, professores, disciplinas, turmas e notas.

-- 1️⃣ CRIAÇÃO DAS TABELAS

-- Tabela de alunos: guarda nome, nascimento, gênero, contato e email.
CREATE TABLE alunos (
  ID_aluno INT PRIMARY KEY,
  nome_do_aluno VARCHAR (250),
  data_de_nascimento DATE,
  gênero TEXT,
  endereço VARCHAR (400),
  telefone_de_contato INT,
  email VARCHAR (250)
);

-- Tabela de professores: dados dos docentes.
CREATE TABLE professores (
  ID_professores INT PRIMARY KEY,
  nome_do_professor TEXT,
  data_de_nascimento DATE,
  genero TEXT,
  telefone_de_contato_professores INT,
  email_professores VARCHAR (250)
);

-- Tabela de disciplinas: informações sobre as matérias e vínculo com o professor.
CREATE TABLE disciplinas (
  ID_disciplina INT PRIMARY KEY,
  Nome_da_disciplina TEXT,
  Descrição VARCHAR (250),
  Carga_horária REAL,
  ID_professor INT,
  FOREIGN KEY (ID_professor) REFERENCES professores(ID_professores) ON DELETE SET NULL
);

-- Tabela de turmas: turmas por ano letivo e seus orientadores.
CREATE TABLE turmas (
  id_turma INT PRIMARY KEY,
  nome_da_turma VARCHAR (100),
  ano_letivo INT,
  id_orientador INT,
  FOREIGN KEY (id_orientador) REFERENCES professores(id_professores) ON DELETE SET NULL
);

-- Relação N:N entre turmas e disciplinas.
CREATE TABLE turma_disciplina (
  ID_turma INT,
  id_disciplinas INT,
  PRIMARY KEY (ID_turma, ID_disciplinas), 
  FOREIGN KEY (ID_turma) REFERENCES turmas(id_turma),
  FOREIGN KEY (id_disciplinas) REFERENCES disciplinas(id_disciplina)
);

-- Relação N:N entre turmas e alunos.
CREATE TABLE turma_alunos (
  id_turma INT,
  id_alunos INT,
  PRIMARY KEY (id_turma, id_alunos),
  FOREIGN KEY (id_turma) REFERENCES turmas(id_turma),
  FOREIGN KEY (id_alunos) REFERENCES alunos(id_aluno)
);

-- Tabela de notas: registra notas por disciplina para cada aluno.
CREATE TABLE notas (
  id_nota INT PRIMARY KEY,
  id_aluno INT NOT NULL,
  id_disciplina INT NOT NULL,
  valor_da_nota DECIMAL(5,2),
  data_avaliacao DATE,
  FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
  FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina)
);

-- 2️⃣ INSERÇÃO DE DADOS

-- Inserção de alunos
INSERT INTO alunos (ID_aluno, nome_do_aluno, data_de_nascimento, gênero, endereço, telefone_de_contato, email) 
VALUES 
(1, 'João Silva', '2005-03-15', 'Masculino', 'Rua das Flores, 123', 1198765432, 'joao@email.com'),
(2, 'Maria Santos', '2006-06-20', 'Feminino', 'Avenida Principal, 456', 1187654321, 'maria@email.com'),
(3, 'Pedro Soares', '2004-01-10', 'Masculino', 'Rua Central, 789', 1176543210, 'pedro@email.com'),
(4, 'Ana Lima', '2005-04-02', 'Feminino', 'Rua da Escola, 56', 1187654321, 'ana@email.com'),
(5, 'Mariana Fernandes', '2005-08-12', 'Feminino', 'Avenida da Paz, 789', 1156781234, 'mariana@email.com'),
(6, 'Lucas Costa', '2003-11-25', 'Masculino', 'Rua Principal, 456', 112345678, 'lucas@email.com'),
(7, 'Isabela Santos', '2006-09-10', 'Feminino', 'Rua da Amizade, 789', 1198765432, 'isabela@email.com'),
(8, 'Gustavo Pereira', '2004-05-15', 'Masculino', 'Avenida dos Sonhos, 123', 1176543210, 'gustavo@email.com'),
(9, 'Carolina Oliveira', '2005-02-20', 'Feminino', 'Rua da Alegria, 456', 1187654321, 'carolina@email.com'),
(10, 'Daniel Silva', '2003-10-05', 'Masculino', 'Avenida Central, 789', 112345678, 'daniel@email.com'),
(11, 'Larissa Souza', '2004-12-08', 'Feminino', 'Rua da Felicidade, 123', 1198765432, 'larissa@email.com'),
(12, 'Bruno Costa', '2005-07-30', 'Masculino', 'Avenida Principal, 456', 1176543210, 'bruno@email.com'),
(13, 'Camila Rodrigues', '2006-03-22', 'Feminino', 'Rua das Estrelas, 789', 1187654321, 'camila@email.com'),
(14, 'Rafael Fernandes', '2004-11-18', 'Masculino', 'Avenida dos Sonhos, 123', 112345678, 'rafael@email.com'),
(15, 'Letícia Oliveira', '2005-01-05', 'Feminino', 'Rua da Alegria, 456', 1198765432, 'leticia@email.com'),
(16, 'Fernanda Lima', '2004-02-12', 'Feminino', 'Rua da Esperança, 789', 1145678901, 'fernanda@email.com'),
(17, 'Vinícius Santos', '2003-07-28', 'Masculino', 'Avenida da Amizade, 123', 1189012345, 'vinicius@email.com'),
(18, 'Juliana Pereira', '2006-09-01', 'Feminino', 'Rua das Rosas, 789', 1134567890, 'juliana@email.com');

-- Inserção de professores
INSERT INTO professores (id_professores, nome_do_professor, data_de_nascimento, genero, telefone_de_contato_professores, email_professores) 
VALUES
(1,'Ana Oliveira','1980-05-25','Feminino','(11) 1234-5678','ana@email.com'),
(2,'Carlos Ferreira','1975-09-12','Masculino','(11) 2345-6789','carlos@email.com'),
(3,'Mariana Santos','1982-03-15','Feminino','(11) 3456-7890','mariana@email.com'),
(4,'Ricardo Silva','1978-08-20','Masculino','(11) 7890-1234','ricardo@email.com'),
(5,'Fernanda Lima','1985-01-30','Feminino','(11) 4567-8901','fernanda@email.com');

-- Inserção de disciplinas
INSERT INTO disciplinas (id_disciplina, nome_da_disciplina, descrição, carga_horária, id_professor) VALUES
(1,'Matemática','Estudo de conceitos matemáticos avançados',60,1),
(2,'História','História mundial e local',45,2),
(3,'Física','Princípios fundamentais da física',60,1),
(4,'Química','Estudo da química e suas aplicações',45,3),
(5,'Inglês','Aulas de inglês para iniciantes',45,4),
(6,'Artes','Exploração da criatividade artística',30,5);

-- Inserção de turmas
INSERT INTO turmas (id_turma, nome_da_turma, ano_letivo, id_orientador) VALUES
(1,'Turma A',2023, 1),
(2,'Turma B',2023, 2),
(3,'Turma C',2023, 3),
(4,'Turma D',2023, 4),
(5,'Turma E',2023, 5);

-- Vincula disciplinas às turmas
INSERT INTO turma_disciplina (id_turma, id_disciplinas) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(1,3),
(2,1),
(3,2);

-- Vincula alunos às turmas
INSERT INTO turma_alunos (id_turma, id_alunos) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(1,6),
(2,7),
(3,8),
(4,9),
(5,10);

-- Inserção de notas
INSERT INTO notas (id_nota, id_aluno, id_disciplina, valor_da_nota, data_avaliacao) VALUES
(2,1,1,6.19,'2023-07-07'),
(3,1,2,7.18,'2023-07-07'),
(4,1,3,7.47,'2023-07-07'),
(5,1,4,7.46,'2023-07-07'),
(6,1,5,4.35,'2023-07-07'),
(7,1,6,4.43,'2023-07-07'),
(8,1,7,0.76,'2023-07-07'),
(9,1,8,9.22,'2023-07-07'),
(10,1,9,9.04,'2023-07-07'),
(11,1,10,3.28,'2023-07-07');

-- 3️⃣ CONSULTAS SQL

-- Consulta geral dos alunos
SELECT * FROM alunos;

-- Consulta geral das disciplinas
SELECT * FROM disciplinas;

-- Consulta geral das notas
SELECT * FROM notas;

-- Consulta geral dos professores
SELECT * FROM professores;

-- Consulta geral das turmas
SELECT * FROM turmas;

-- Consulta da relação alunos x turmas
SELECT * FROM turma_alunos;

-- Consulta da relação turmas x disciplinas
SELECT * FROM turma_disciplina;

-- Alunos ordenados alfabeticamente
SELECT * FROM alunos ORDER BY nome_do_aluno ASC;

-- Disciplinas com mais de 40 horas
SELECT * FROM disciplinas WHERE carga_horária > 40;

-- Notas entre 6 e 8
SELECT * FROM notas WHERE valor_da_nota > 6 AND valor_da_nota < 8;
