/*
CONCEITO: Funções de agregação (COUNT, SUM, AVG, MIN, MAX)

OBJETIVO:
Resumir múltiplas linhas em métricas.

QUANDO USAR:
- KPIs e indicadores
- Resumos por período/categoria
- Dashboards

SINTAXE:
SELECT
  COUNT(*) AS total,
  SUM(coluna) AS soma,
  AVG(coluna) AS media,
  MIN(coluna) AS minimo,
  MAX(coluna) AS maximo
FROM tabela;
*/

-- Exemplo:
-- SELECT COUNT(*) AS TotalProdutos, AVG(ListPrice) AS PrecoMedio
-- FROM SalesLT.Product;

--1. Retornando a contagem total de produtos, a contagem apenas de categorias distintas e a m�dia do pre�o de lista
SELECT
	COUNT(*) AS Produtos,
	COUNT(DISTINCT(ProductCategoryID)) AS CategoriasDistintas,
	AVG(ListPrice) AS ValorMedio
FROM SalesLT.Product

--2. Retornar o valor total vendido para cada um dos vendedores. SalesLT.Customer.SalesPerson 
--(unindo, atrav�s de um LEFT JOIN, a tabela SalesLT.SalesOrderHeader)
SELECT c.SalesPerson, CAST(ISNULL(SUM(oh.Subtotal), 0.00) AS DECIMAL(9, 2)) AS Vendas
FROM SalesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader oh
ON c.CustomerID = oh.CustomerID
GROUP BY c.SalesPerson
ORDER BY Vendas DESC;

--3. Alterando um atributo a mais na consulta anterior para agrupamento
SELECT 
	c.SalesPerson,
	CONCAT(c.FirstName + ' ', c.LastName) AS Cliente,
	CAST(ISNULL(SUM(oh.Subtotal), 0.00) AS DECIMAL(9, 2)) AS Vendas
FROM SalesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader oh
ON c.CustomerID = oh.CustomerID
GROUP BY c.SalesPerson, CONCAT(c.FirstName + ' ', c.LastName)
ORDER BY Vendas DESC;