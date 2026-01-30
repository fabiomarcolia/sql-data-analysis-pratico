/*
LAB 10 — Desafio Final (Consolidação)

OBJETIVO:
Consolidar conceitos: JOIN, GROUP BY, CASE, Window Functions.

DESAFIO:
Crie uma análise por cliente contendo:
- Cliente (ID + Nome)
- Quantidade de pedidos
- Faturamento total
- Classificação (CASE) por faixa de faturamento
- Ranking por faturamento (maior para menor)

REGRAS:
- Use pelo menos: JOIN, GROUP BY, CASE, WINDOW FUNCTION
- Use SalesLT.Customer e SalesLT.SalesOrderHeader
*/

-- Escreva sua solução abaixo




/* =========================
GABARITO (Solução sugerida)
========================= */

WITH base AS (
  SELECT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS Cliente,
    COUNT(soh.SalesOrderID) AS QtdPedidos,
    SUM(soh.SubTotal) AS FaturamentoTotal
  FROM SalesLT.Customer c
  LEFT JOIN SalesLT.SalesOrderHeader soh
    ON soh.CustomerID = c.CustomerID
  GROUP BY c.CustomerID, c.FirstName, c.LastName
),
classificada AS (
  SELECT
    *,
    CASE
      WHEN FaturamentoTotal IS NULL OR FaturamentoTotal = 0 THEN 'Sem compras'
      WHEN FaturamentoTotal < 1000 THEN 'Baixo'
      WHEN FaturamentoTotal BETWEEN 1000 AND 5000 THEN 'Médio'
      ELSE 'Alto'
    END AS FaixaFaturamento
  FROM base
)
SELECT
  CustomerID,
  Cliente,
  QtdPedidos,
  COALESCE(FaturamentoTotal, 0) AS FaturamentoTotal,
  FaixaFaturamento,
  DENSE_RANK() OVER (ORDER BY COALESCE(FaturamentoTotal, 0) DESC) AS RankFaturamento
FROM classificada
ORDER BY RankFaturamento, CustomerID;
