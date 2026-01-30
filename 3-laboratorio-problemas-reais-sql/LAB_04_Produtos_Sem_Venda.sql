/*
LAB 04 — Produtos sem venda

OBJETIVO:
Encontrar produtos que nunca foram vendidos.

DESAFIO:
- Liste produtos que não aparecem em SalesOrderDetail.

DICAS:
- LEFT JOIN (Product -> SalesOrderDetail) + WHERE IS NULL
- Ou EXCEPT
*/

-- Escreva sua solução abaixo




/* =========================
GABARITO (Solução sugerida)
========================= */

SELECT
  p.ProductID,
  p.Name
FROM SalesLT.Product p
LEFT JOIN SalesLT.SalesOrderDetail sod
  ON sod.ProductID = p.ProductID
WHERE sod.SalesOrderID IS NULL
ORDER BY p.ProductID;

-- Alternativa com EXCEPT (didática):
-- SELECT ProductID FROM SalesLT.Product
-- EXCEPT
-- SELECT ProductID FROM SalesLT.SalesOrderDetail;
