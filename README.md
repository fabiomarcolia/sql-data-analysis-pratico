
# Treinamento Completo de SQL + Azure + Scritps e Laboratório

![SQL](https://img.shields.io/badge/SQL-T--SQL-blue)
![Azure SQL](https://img.shields.io/badge/Azure-SQL-0078D4)
![License](https://img.shields.io/badge/license-MIT-green)

Repositório prático para aprender e treinar SQL (T-SQL) usando **Azure SQL Database** com o banco de dados **AdventureWorksLT**.

- A ideia aqui é: **setup rápido**, **scripts organizados por tópicos**, **problemas reais** e **laboratórios guiados**.

- Além de SQL vai aprender também como configurar uma conta na Azure e configurar o Azure SQL 

Este repositório foi pensado para:
- iniciantes em SQL
- profissionais em transição de carreira
- analistas que querem consolidar fundamentos
- preparação para entrevistas técnicascls

Ensinar SQL de forma progressiva:

1. **Aprender comandos isolados**
2. **Entender padrões de problemas reais**
3. **Praticar sozinho como em entrevistas**
4. **Consolidar domínio técnico**

Tudo isso com:
- scripts didáticos
- problemas reais
- laboratório prático
- Testes reais e gabaritos 

## Fluxo completo de aprendizado

```txt
1-SETUP          → preparar o ambiente
  ↓
2-scripts        → aprender comandos e conceitos
  ↓
3-laboratório com problemas reais → aprender padrões resolvidos / Checklist de SQL
  ↓
4-data analysis   → treinar como se executa um projeto de análise usando SQL  
```

## 🗺️ Roadmap do que irá aprender
### Fundamentos
- SELECT / WHERE / ORDER BY
- DISTINCT
- Operadores lógicos
- Funções de agregação

### SQL Essencial
- JOINs (INNER, LEFT, RIGHT, FULL)
- Subconsultas
- Tabelas derivadas
- CTEs

### SQL Intermediário
- Funções de data
- Funções de string
- CASE / IIF
- Window Functions

### SQL Avançado
- Transações
- DML com segurança
- DDL (simulado)
- Operações de conjunto


---
## 🔊  Bora para o Treinamento

## 1) preparando o ambiente
1- Siga o guia completo em: ![**1-setup/README.md**](1-setup/README.md)

2- Depois volte aqui e siga a trilha de estudos.

- Este treinamento usa o AdventureWorksLT e um fluxo com prática (scripts) + desafios (labs).  

---

## 2) Modelo de Dados (AdventureWorksLT)
A base do treinamento gira em torno do schema **SalesLT** (vendas, clientes, produtos, pedidos e endereços).

![Modelo de Dados AdventureWorksLT](assets/images/modelo-dados-adventureworks.png)

↳ Dica: Antes de fazer JOINs, entenda estas tabelas:
- SalesLT.Customer
- SalesLT.SalesOrderHeader
- SalesLT.SalesOrderDetail
- SalesLT.Product
- SalesLT.Address / SalesLT.CustomerAddress

---

## 3) Trilha de estudos (scripts)


- Fundamentos: SELECT, WHERE, ORDER BY, DISTINCT
- Conversões e tratamento de NULL: CAST/CONVERT, ISNULL/NULLIF/COALESCE
- JOINs e conjuntos: INNER/OUTER JOIN, UNION/INTERSECT/EXCEPT
- Funções e agregações: funções escalares, agregações, GROUP BY, GROUPING SETS
- Janelas e análise: Window Functions
- Subqueries e CTEs: Subqueries, CTE, APPLY
- Objetos e programação: Views, tabelas temporárias, IF/WHILE, Stored Procedures
- Confiabilidade: TRY/CATCH, THROW, transações

↳ Acesso os scripts aqui: [Scripts SQL Tutorial](2-scripts-tutorial-sql-guiado)

---

## 4) Aprendendo com problemas reais
Aqui você treina SQL como no dia a dia:
- “Clientes sem endereço”
- “Produtos que nunca foram vendidos”
- “Relatórios de faturamento”
- “Ranking de clientes por receita”
- “Análise por categoria e região”

↳ Acesse: **02-problemas-reais/README.md**

---

## 5) Laboratório (hands-on) e Problemas Reaos
O laboratório tem desafios progressivos, do básico ao avançado, com:
- enunciado
- desafio e contexto
- solução sugerida
- explicação

↳ Acesse: [Laboratório (Hands-on) SQL](3-laboratorio-problemas-reais-sql)

---
## 6) Data Analytics com SQL

Guia de Análise de Dados com SQL, organizado em 4 fases:

- 1- Data cleaning
- 2- Data exploration
- 3- Data analysis
- 4- Descobertas / insights

Com Relatórios sugeridos para entrega de valor ao negócio.


## Como usar

- 1-Clone o repositório: Clone este repositório do projeto do GitHub.
- 2- Configure o banco de dados: [Setup DB.](1-setup/README.md) Execute os scripts SQL fornecidos [Tutorial SQL](2-scripts-tutorial-sql-guiado). 
- 3- Realize o Laboratório: [Laboratório SQL Problemas Reais](4-data-analysis-sql/README.md)
- 4 -
- 5- Explore e modifique: Fique a vontade para modificar as consultas e explorar diferentes perspectivas do banco de dados e responder perguntas de negócios.

## Outros recursos para aprender SQL 

### Treinamento T-SQL Oficial
 https://learn.microsoft.com/pt-br/training/modules/get-started-transact-sql-programming/ 

### Sites (Ordem de recomendação)
- https://www.codecademy.com/learn/learn-sql 
- http://sqlbolt.com
- http://sqltest.net
- http://w3schools.com/sql/

### Praticar e Testes Online 
- https://www.hackerrank.com (Testes)
- https://onecompiler.com/ (Praticar Online)
- https://mentordados.substack.com/ (Biblioteca de recursos e entrevista)

## Autor - Fabio Marçolia | Carreira em Dados & IA

Dicas e sugestões: Vamos nos Conectar e falar no [Linkedin](http://linkedin.com/in/fabiomarcolia) 🤝


