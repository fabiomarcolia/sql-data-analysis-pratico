/*
LAB 02 — Clientes sem pedidos

OBJETIVO:
Identificar clientes que nunca realizaram compras.

DESAFIO:
- Liste os clientes que não possuem pedidos.

DICAS:
- Use LEFT JOIN
- Filtre registros NULL no lado do pedido
*/

-- Escreva sua solução abaixo




/* =========================
GABARITO (Solução sugerida)
========================= */

SELECT
  c.CustomerID,
  c.FirstName,
  c.LastName,
  c.EmailAddress
FROM SalesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader soh
  ON soh.CustomerID = c.CustomerID
WHERE soh.SalesOrderID IS NULL
ORDER BY c.CustomerID;
