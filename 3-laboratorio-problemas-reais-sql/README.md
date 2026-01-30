# 📁 Laboratório de SQL aplicado a problemas do mundo real

Esta pasta contém **problemas reais de negócio resolvidos com SQL**, usando o banco **AdventureWorksLT (Azure SQL)**.

O objetivo aqui é **sair do SQL teórico** e aprender a:
- interpretar problemas reais
- traduzir perguntas de negócio para SQL
- escolher o comando certo
- estruturar queries claras e profissionais

---

## Como usar esta pasta

Cada problema segue sempre o mesmo formato:

1- Contexto do negócio  
2- Pergunta / desafio  
3- Estratégia de solução  
4- Query SQL comentada  
5- Resultado esperado  
6- Variações / extensões  

↳ Pense como analista, não apenas como executor de comandos.

---

## Perfil dos problemas

Os exercícios simulam cenários reais de:
- análise de vendas
- clientes e comportamento
- produtos e precificação
- performance e indicadores
- validação e auditoria de dados

Tudo usando apenas **SQL puro**.

---

## Estrutura recomendada dos arquivos com Problema vs Solução

```txt
3-laboratorio-problemas-reais-sql/
├─ LAB_01_vendas_basico.sql
├─ LAB_02_clientes_sem_pedidos.sql
├─ LAB_03_produtos_sem_venda.sql
├─ LAB_04_ticket_medio.sql
├─ LAB_05_top_clientes.sql
├─ LAB_06_faturamento_por_periodo.sql
├─ LAB_07_produtos_mais_vendidos.sql
├─ LAB_08_analise_de_desconto.sql
├─ LAB_09_clientes_inativos.sql
├─ LAB_10_validacao_de_dados.sql
└─ LAB_Bonus_Problemas_Reais_Por_Topico.sql

```

Cada arquivo representa **um problema real independente**.

---

## Exemplos de problemas abordados

### 🟢 Problema 1 — Vendas básicas
**Pergunta:**  
Qual foi o total de pedidos e faturamento?

**Conceitos usados:**  
SELECT, COUNT, SUM

---

### 🟢 Problema 2 — Clientes sem pedidos
**Pergunta:**  
Quais clientes nunca realizaram compras?

**Conceitos usados:**  
LEFT JOIN, WHERE, NULL

---

### 🟢 Problema 3 — Produtos sem venda
**Pergunta:**  
Quais produtos nunca foram vendidos?

**Conceitos usados:**  
LEFT JOIN, EXCEPT

---

### 🟢 Problema 4 — Ticket médio
**Pergunta:**  
Qual é o valor médio dos pedidos?

**Conceitos usados:**  
AVG, GROUP BY

---

### 🟢 Problema 5 — Top clientes
**Pergunta:**  
Quem são os clientes que mais compram?

**Conceitos usados:**  
GROUP BY, ORDER BY, TOP

---

### 🟢 Problema 6 — Faturamento por período
**Pergunta:**  
Como evoluiu o faturamento ao longo do tempo?

**Conceitos usados:**  
GROUP BY, funções de data

---

### 🟢 Problema 7 — Produtos mais vendidos
**Pergunta:**  
Quais produtos vendem mais em quantidade?

**Conceitos usados:**  
JOIN, SUM, GROUP BY

---

### 🟢 Problema 8 — Análise de desconto
**Pergunta:**  
Quanto foi concedido em descontos?

**Conceitos usados:**  
CASE, cálculos, agregações

---

### 🟢 Problema 9 — Clientes inativos
**Pergunta:**  
Quais clientes não compram há muito tempo?

**Conceitos usados:**  
MAX(data), DATEDIFF, WHERE

---

### 🟢 Problema 10 — Validação de dados
**Pergunta:**  
Existem registros inconsistentes ou incompletos?

**Conceitos usados:**  
IS NULL, COUNT, CASE

---

## Boas práticas ao resolver problemas

- Leia o problema antes de escrever SQL
- Quebre o problema em partes menores
- Valide cada etapa com SELECT
- Use comentários explicando a lógica
- Priorize clareza antes de performance

---

## Relação com outras pastas

- 📁 [1-Setup e como conectar](../1-setup)
  ↳ Tutorial de como criar e configurar o banco de dados na Azure e como conectar no nele. 

- 📁 [2-scripts-tutorial-sql-guiado](../2-scripts-tutorial-sql-guiado)
  ↳ consulte quando tiver dúvida sobre comandos  
  

---

## Conclusão

Se você consegue resolver os problemas desta pasta:
- você domina SQL aplicado
- entende lógica de negócio
- está preparado para entrevistas e projetos reais

## Próximo passo

Conhecer e praticar como análisar dados usando SQL, usando seus principais recursos e comandos

- 📁 [4-data-analysis-sql](../4-data-analysis-sql)
  ↳ Entendendo o processo de análise e os principais recursos do SQL com exemplos.


