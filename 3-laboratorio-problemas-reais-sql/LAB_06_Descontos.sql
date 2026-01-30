/*
LAB 06 — Análise de descontos

OBJETIVO:
Avaliar impacto de descontos nos pedidos.

DESAFIO:
1) Calcule o total concedido em descontos (linha a linha).
2) Classifique itens com e sem desconto.

DICAS:
- Use UnitPrice, UnitPriceDiscount e OrderQty em SalesOrderDetail
- DescontoTotalLinha = UnitPrice * UnitPriceDiscount * OrderQty
- Classificação com CASE
*/

-- Escreva sua solução abaixo




/* =========================
GABARITO (Solução sugerida)
========================= */

-- 1) Total de desconto concedido
SELECT
  SUM(UnitPrice * UnitPriceDiscount * OrderQty) AS DescontoTotal
FROM SalesLT.SalesOrderDetail;

-- 2) Classificação por linha
SELECT TOP 50
  SalesOrderID,
  ProductID,
  OrderQty,
  UnitPrice,
  UnitPriceDiscount,
  CASE
    WHEN UnitPriceDiscount > 0 THEN 'Com desconto'
    ELSE 'Sem desconto'
  END AS TipoDesconto,
  (UnitPrice * UnitPriceDiscount * OrderQty) AS DescontoLinha
FROM SalesLT.SalesOrderDetail
ORDER BY SalesOrderID, ProductID;
