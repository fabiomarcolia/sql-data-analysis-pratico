/*
CONCEITO: Window Functions (funções analíticas)

OBJETIVO:
Calcular rankings, acumulados e métricas por janela sem perder o detalhe linha a linha.

QUANDO USAR:
- Rankings (ROW_NUMBER, RANK, DENSE_RANK)
- Acumulados (SUM OVER)
- Médias móveis e comparações por partição

SINTAXE (exemplos):
ROW_NUMBER() OVER (PARTITION BY col ORDER BY col)
SUM(valor) OVER (PARTITION BY col ORDER BY data ROWS UNBOUNDED PRECEDING)
*/

-- Exemplo:
-- SELECT
--   CustomerID,
--   SalesOrderID,
--   ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC) AS rn
-- FROM SalesLT.SalesOrderHeader;

--1. Ranqueando produtos a partir do pre�o
SELECT TOP 100 ProductID, Name, ListPrice,
	RANK() OVER(ORDER BY ListPrice DESC) AS RankByPrice
FROM SalesLT.Product
ORDER BY RankByPrice

--2. Ranqueando produtos por cada categoria
SELECT c.Name AS Categoria, p.Name AS Produto, ListPrice,
	RANK() OVER(PARTITION BY c.Name ORDER BY ListPrice DESC) AS RankByPrice
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory c
ON p.ProductCategoryID = c.ProductCategoryID
ORDER BY Categoria, RankByPrice;