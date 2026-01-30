# 📁 Scripts SQL — Trilha de Estudos

Esta pasta contém os **scripts SQL organizados por tema**, formando uma **trilha progressiva de aprendizado**, do básico ao avançado, usando o banco **AdventureWorksLT (Azure SQL)**.

O objetivo aqui é:
- aprender SQL de forma estruturada  
- entender **quando e por que** usar cada comando  
- criar base sólida para resolver problemas reais e laboratórios  

---

## Como usar esta pasta

1- Abra o script indicado  
2- Leia os comentários no topo do arquivo  
3- Execute as queries aos poucos  
4- Observe o resultado  
5- Faça pequenas variações por conta própria  

↳ SQL se aprende entendendo o resultado, não apenas executando.

---

## Ordem recomendada de estudo (com explicação)

### 🟢 0 — Setup e validação do ambiente
**Objetivo:** confirmar que o banco, tabelas e dados estão acessíveis. Criar Views para a prática

**Quando usar:**  
- Primeira execução após criar o ambiente  
- Sempre que desconfiar de problema de conexão ou schema  

**Scripts:**
- `0_SetupAdventureWorks.sql`

---

### 🟢 1 — Fundamentos de SQL
**Objetivo:** aprender a **ler dados corretamente**.

**Quando usar:**  
- Para consultas simples  
- Para explorar tabelas  
- Para entender estrutura dos dados  

**Você aprende:**  
- selecionar colunas  
- filtrar linhas  
- ordenar resultados  

**Scripts:**
- `1_SELECT.sql`  
- `2_SELECT_DISTINCT.sql`  
- `3_WHERE.sql`  
- `4_CASE_ORDER_BY.sql`  

---

### 🟢 2 — Conversões e tratamento de NULL
**Objetivo:** evitar erros e lidar com dados incompletos.

**Quando usar:**  
- Quando tipos de dados não batem  
- Quando há valores NULL  
- Para evitar divisões por zero e erros de conversão  

**Você aprende:**  
- CAST e CONVERT  
- ISNULL, COALESCE  
- NULLIF  

**Scripts:**
- `5_CAST_CONVERT.sql`  
- `6_ISNULL_NULLIF_COALESCE.sql`   

---

### 🟢 3 — JOINs (relacionando tabelas)
**Objetivo:** combinar dados de várias tabelas.

**Quando usar:**  
- Relatórios  
- Análises  
- Queries do mundo real  

**Você aprende:**  
- INNER JOIN  
- LEFT / RIGHT JOIN  
- FULL JOIN  

**Scripts:**
- `7_INNER_JOIN.sql`  
- `8_LEFT_RIGHT_FULLOTHER_JOINs.sql`  

---

### 🟢 4 — Operações de conjunto
**Objetivo:** comparar e combinar resultados de múltiplas queries.

**Quando usar:**  
- Comparações  
- Auditorias  
- Diferença entre conjuntos de dados  

**Você aprende:**  
- UNION / UNION ALL  
- INTERSECT  
- EXCEPT  

**Scripts:**
- `9_UNION_ALL_INTERSECT_EXCEPT.sql`  

---

### 🟢 5 — Funções e agregações
**Objetivo:** resumir e analisar dados.

**Quando usar:**  
- Métricas  
- Indicadores  
- Relatórios analíticos  

**Você aprende:**  
- funções escalares  
- COUNT, SUM, AVG  
- GROUP BY  
- GROUPING SETS  

**Scripts:**
- `10_FUNCOES_ESCALARES.sql`  
- `11_FUNCOES_LOGICAS.sql` 
- `12_AGGREGATIONS.sql`  
- `13_GROUP_BY_GROUPING_SETS.sql` 

---

### 🟢 6 — Subqueries, CTEs e APPLY
**Objetivo:** escrever SQL mais legível e modular.

**Quando usar:**  
- Queries complexas  
- Regras intermediárias  
- Reutilização de lógica  

**Você aprende:**  
- subqueries  
- CTEs  
- CROSS APPLY  
- OUTER APPLY  

**Scripts:**
- `14_SUBQUERIES.sql`  
- `15_CTE.sql`  
- `16_CROSS_APPLY_OUTER_APPLY.sql`   

---

### 🟢 7 — Window Functions
**Objetivo:** análises avançadas sem perder granularidade.

**Quando usar:**  
- Rankings  
- Acumulados  
- Análises temporais  

**Scripts:**
- `17_WINDOW_FUNCTIONS.sql`  

---

### 🟢 8 — Views e estruturas temporárias
**Objetivo:** organizar, reutilizar e melhorar manutenção.

**Quando usar:**  
- Reaproveitar consultas  
- Simplificar queries grandes  
- Criar camadas de leitura  

**Você aprende:**  
- Views  
- Tabelas temporárias  
- Variáveis de tabela  

**Scripts:**
- `18_VIEWS.sql`  
- `19_TEMP_TABLES_TABLE_VARIABLES.sql`   
- `20_TABLE_DERIVADED.sql` 
- `21_TABLE_FUNCTIONS.sql` 

---

### 🟢 9 — Controle de fluxo e programação
**Objetivo:** lógica dentro do banco.

**Quando usar:**  
- Regras condicionais  
- Processos controlados  
- Automação simples  

**Atenção:**  
- Nem tudo deve ir para o banco  

**Scripts:**
- `22_IF_ELSE_BEGIN_END.sql`  
- `23_WHILE.sql`  
- `24_STORED_PROCEDURE.sql`  

---

### 🟢 10 — Tratamento de erros e transações
**Objetivo:** SQL robusto e profissional.

**Quando usar:**  
- Scripts críticos  
- Ambientes produtivos  
- Controle de falhas  

**Scripts:**
- `25_TRY_CATCH.sql`  
- `26_TRANSACTIONS.sql`
- `27_RAISERROR_THROW.sql`

---

### 🟢 11 — Variáveis
**Objetivo:** Armazenar valor temporário.

**Quando usar:**  
- Store Procedures  
- Funções  
- Controle de fluxos | Lógicas  

**Scripts:**
- `28_VARIABLES.sql`  

---

### 🟢 12 — Alteração e Inserção de Dados
**Objetivo:** Adicionar novos dados ou alterar existentes.

**Quando usar:**  
- Atualizar dados existentes 
- Inserir novos dados 
- Deletar dados 
- Truncar Tabela inteira(Deletar tudo)  

**Scripts:**
- `29_INSERT.sql`  
- `30_UPDATE_MERGE_DELETE_TRUNCATE`

---

### 🟢 13 — Manipulando as saídas e visualização dos dados
**Objetivo:** Mudar estrutura de resultado, muito parecido como tabela dinâmica do Excel.

**Quando usar:**  
- Relatórios
- Alterar estrutura saída e visualização dos dados
- Simular tabela dinâmica  

**Scripts:**
- `31_PIVOT_UNPIVOT`

---

## Boas práticas gerais
- Execute SELECT antes de UPDATE/DELETE  
- Comente seu raciocínio  
- Teste variações  
- Não copie sem entender  

---

## Próximo passo: 
[Laboratório (Hands-on) SQL](../3-laboratorio-problemas-reais-sql)

---



