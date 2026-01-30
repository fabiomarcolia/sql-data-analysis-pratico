/*
COMANDO: CROSS APPLY

OBJETIVO:
Aplicar uma expressão/consulta correlacionada para cada linha da tabela externa,
retornando somente quando houver resultado (similar a INNER JOIN com função/tabela derivada).

QUANDO USAR:
- Consultas correlacionadas por linha
- Funções table-valued
- "Top N por grupo" com lógica por linha

SINTAXE:
SELECT ...
FROM A
CROSS APPLY (SELECT ... WHERE ...) X;
*/

-- Exemplo (didático):
-- SELECT c.CustomerID, x.UltimoPedido
-- FROM SalesLT.Customer c
-- CROSS APPLY (
--   SELECT MAX(OrderDate) AS UltimoPedido
--   FROM SalesLT.SalesOrderHeader soh
--   WHERE soh.CustomerID = c.CustomerID
-- ) x;

--1. Retornar a coluna OrderID e o valor m�ximo do pre�o unit�rio (UnitPrice)
SELECT SOH.SalesOrderID, MUP.MaxUnitPrice
FROM SalesLT.SalesOrderHeader SOH
CROSS APPLY SalesLT.udfMaxUnitPrice(SOH.SalesOrderID) AS MUP
ORDER BY SOH.SalesOrderID

/*
COMANDO: OUTER APPLY

OBJETIVO:
Semelhante ao CROSS APPLY, mas mantém linhas da tabela externa mesmo quando a expressão interna não retorna resultado
(similar a LEFT JOIN em consultas correlacionadas).

QUANDO USAR:
- Quando você quer preservar todos os registros da tabela externa
- Enriquecimento opcional por linha

SINTAXE:
SELECT ...
FROM A
OUTER APPLY (SELECT ... WHERE ...) X;
*/

-- Exemplo (didático):
 SELECT c.CustomerID, x.UltimoPedido
 FROM SalesLT.Customer c
 OUTER APPLY (
   SELECT MAX(OrderDate) AS UltimoPedido
   FROM SalesLT.SalesOrderHeader soh
   WHERE soh.CustomerID = c.CustomerID
) x;
