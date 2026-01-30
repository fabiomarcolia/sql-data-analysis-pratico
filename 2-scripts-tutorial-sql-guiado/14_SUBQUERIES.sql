/*
CONCEITO: Subqueries

OBJETIVO:
Usar uma consulta dentro de outra para filtrar, comparar ou calcular.

QUANDO USAR:
- Filtros dinâmicos (IN/EXISTS)
- Comparações com agregações
- Regras intermediárias rápidas

SINTAXE (exemplos):
WHERE coluna IN (SELECT ...)
WHERE EXISTS (SELECT ...)
SELECT (SELECT ...) AS coluna_calculada
*/

-- Exemplo:
-- SELECT *
-- FROM SalesLT.Product
-- WHERE ProductCategoryID IN (
--   SELECT ProductCategoryID
--   FROM SalesLT.ProductCategory
-- );

--1. Subqueries escalares
SELECT SalesOrderID, ProductID, UnitPrice, OrderQty
FROM SalesLT.SalesOrderDetail
WHERE SalesOrderID = 
	(SELECT MAX(SalesOrderID) AS LastOrder
	FROM SalesLT.SalesOrderDetail)

--2. Da tabela SalesLT.Products, retornar todas as linhas onde a coluna ListPrice for maior 
--que o valor m�ximo de UnitPrice da tabela SalesLT.SalesOrderDetail

--2.1 Primeiro passo: Verificando o valor m�ximo de UnitPrice
SELECT MAX(UnitPrice) FROM SalesLT.SalesOrderDetail;

--2.2 Segundo Passo: Entrando manualmente com o valor obtido
SELECT * FROM SalesLT.Product WHERE ListPrice > 1466.01;

SELECT * FROM SalesLT.Product
WHERE ListPrice > 
	(SELECT MAX(UnitPrice) FROM SalesLT.SalesOrderDetail)

--3. Subqueries multi valoradas
SELECT CustomerID, SalesOrderID
FROM SalesLT.SalesOrderHeader
WHERE CustomerID IN (
	SELECT CustomerID
	FROM SalesLT.Customer
	WHERE Title = 'Mr.')

--4. Selecionar as colunas ProductID e UnitPrice da tabela SalesLT.SalesOrderDetail de produtos 
--cuja coluna ProductNumber da tabela SalesLT.Product inicie com "FR"
SELECT ProductID, UnitPrice FROM SalesLT.SalesOrderDetail
WHERE ProductID IN
	(SELECT ProductID FROM SalesLT.Product
	WHERE ProductNumber LIKE 'FR%')

-- Uma outra forma de obter o mesmo resultado
SELECT od.ProductID, od.UnitPrice
FROM SalesLT.SalesOrderDetail od
INNER JOIN SalesLT.Product prod
ON od.ProductID = prod.ProductID
WHERE prod.ProductNumber LIKE 'FR%'



CONCEITO DE Subqueries



--1. Self-Contained: 
-- Retornar as colunas CustomerID, SalesOrderID, OrderDate da tabela SalesLT.Order 
-- quando tivermos a data m�xima (orderdate) da tabela SalesLT.Order
SELECT CustomerID, SalesOrderID, OrderDate
FROM SalesLT.SalesOrderHeader
WHERE OrderDate = 
(SELECT MAX(OrderDate) FROM SalesLT.SalesOrderHeader)

--2. Correlated:
-- Para cada cliente, retornar o valor m�ximo de OrderDate
SELECT CustomerID, SalesOrderID, OrderDate 
FROM SalesLT.SalesOrderHeader SO1
WHERE OrderDate = 
	(SELECT MAX(OrderDate) 
	FROM SalesLT.SalesOrderHeader SO2
	WHERE SO1.CustomerID = SO2.CustomerID)

-- Antes do update:
--	CustomerID: 29847
--	SalesOrderID: 71774
--	OrderDate: 2004-06-01 00:00:00.000

-- Depois do update:
--	CustomerID: 29847
--	SalesOrderID: 71774
--	OrderDate: 2016-12-25 11:05:36.587
UPDATE SalesLT.SalesOrderHeader SET OrderDate = GETDATE()-1000 WHERE CustomerID = 29847;

