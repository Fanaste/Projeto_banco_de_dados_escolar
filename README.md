# 📚 Projeto Banco de Dados Escolar – SQLite

Este projeto consiste na criação de um banco de dados relacional para gerenciamento de informações escolares como alunos, professores, disciplinas, turmas e notas. Foi desenvolvido utilizando **SQLite** com comandos SQL para estruturação e inserção de dados.

## 🧠 Objetivo

Criar uma estrutura de banco de dados simples e funcional que simule um sistema de gerenciamento de uma instituição de ensino.

---

## 🛠️ Tecnologias Utilizadas

- 🗃️ **Banco de dados:** SQLite
- 💻 **Comandos SQL utilizados:**  
  `CREATE`, `INSERT`, `SELECT`, `ORDER BY`, `WHERE`, `FOREIGN KEY`, `PRIMARY KEY`, `ON DELETE SET NULL`
- 🧪 **Ferramentas de teste sugeridas:**  
  - DB Browser for SQLite  
  - SQLite Studio  
  - Terminal SQLite (CLI)

---

## 📁 Estrutura do Projeto

### 1️⃣ Criação das Tabelas

- `alunos` – Armazena informações como nome, data de nascimento, gênero, contato e e-mail.
- `professores` – Contém dados dos docentes.
- `disciplinas` – Detalhes sobre cada matéria oferecida.
- `turmas` – Informações sobre turmas e seus orientadores.
- `turma_disciplina` – Relação entre turmas e disciplinas.
- `turma_alunos` – Relação entre turmas e seus alunos.
- `notas` – Notas dos alunos por disciplina.

## 2️⃣ Inserção de Dados

Foram utilizados comandos `INSERT INTO` para popular as tabelas com os seguintes registros:

- 👨‍🎓👩‍🎓 **18 alunos**
- 👩‍🏫👨‍🏫 **5 professores**
- 📘 **6 disciplinas**
- 👥 **5 turmas**
- 💯 **Notas diversas** para simular avaliações

## 3️⃣ Consultas SQL

Foram realizadas consultas para **visualização** e **filtragem** de dados, como:

```sql
SELECT * FROM alunos;
SELECT * FROM disciplinas WHERE carga_horária > 40;
SELECT * FROM notas WHERE valor_da_nota > 6 AND valor_da_nota < 8;
SELECT * FROM alunos ORDER BY nome_do_aluno ASC;
```

## 👩‍💻 Projeto realizado por Stefany Batista  
📅 Ano: 2025  
🔗 [LinkedIn](https://www.linkedin.com/in/stefanybrauns) 💼
