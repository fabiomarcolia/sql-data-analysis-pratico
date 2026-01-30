/*
LAB 07 — Rankings com Window Functions

OBJETIVO:
Criar rankings sem perder granularidade.

DESAFIO:
- Para cada cliente, rankear os pedidos do mais recente para o mais antigo.

DICAS:
- Use SalesOrderHeader
- ROW_NUMBER() com PARTITION BY CustomerID e ORDER BY OrderDate DESC
*/

-- Escreva sua solução abaixo




/* =========================
GABARITO (Solução sugerida)
========================= */

SELECT
  CustomerID,
  SalesOrderID,
  OrderDate,
  ROW_NUMBER() OVER (
    PARTITION BY CustomerID
    ORDER BY OrderDate DESC, SalesOrderID DESC
  ) AS RankPedidoRecente
FROM SalesLT.SalesOrderHeader
ORDER BY CustomerID, RankPedidoRecente;
