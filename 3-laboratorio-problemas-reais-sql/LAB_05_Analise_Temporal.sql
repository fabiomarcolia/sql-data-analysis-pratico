/*
LAB 05 — Análise temporal de vendas

OBJETIVO:
Analisar faturamento ao longo do tempo.

DESAFIO:
- Mostre o faturamento por ano e mês.

DICAS:
- Use OrderDate (SalesOrderHeader)
- Agrupe por YEAR e MONTH (ou DATETRUNC, se preferir)
- Use SUM(SubTotal) ou SUM(TotalDue)
*/

-- Escreva sua solução abaixo




/* =========================
GABARITO (Solução sugerida)
========================= */

SELECT
  YEAR(OrderDate) AS Ano,
  MONTH(OrderDate) AS Mes,
  SUM(SubTotal) AS Faturamento
FROM SalesLT.SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Ano, Mes;
