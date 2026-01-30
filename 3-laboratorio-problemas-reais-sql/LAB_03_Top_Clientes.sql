/*
LAB 03 — Top clientes por faturamento

OBJETIVO:
Identificar os clientes que mais geram receita.

DESAFIO:
- Liste os 10 clientes com maior faturamento total.

DICAS:
- JOIN (Customer + SalesOrderHeader)
- SUM(SubTotal) ou SUM(TotalDue)
- GROUP BY
- ORDER BY DESC
*/

-- Escreva sua solução abaixo




/* =========================
GABARITO (Solução sugerida)
========================= */

SELECT TOP 10
  c.CustomerID,
  c.FirstName,
  c.LastName,
  SUM(soh.SubTotal) AS FaturamentoTotal
FROM SalesLT.Customer c
INNER JOIN SalesLT.SalesOrderHeader soh
  ON soh.CustomerID = c.CustomerID
GROUP BY
  c.CustomerID, c.FirstName, c.LastName
ORDER BY FaturamentoTotal DESC;
