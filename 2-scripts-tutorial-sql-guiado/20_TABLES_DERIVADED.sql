/*
CONCEITO: Tabelas Derivadas (Derived Tables)

OBJETIVO:
Criar uma tabela temporária **em memória**, definida a partir de uma consulta,
para ser utilizada dentro de outra consulta SQL.

Em termos simples:
↳ é um SELECT dentro do FROM.

QUANDO USAR:
- Quebrar queries complexas em etapas mais legíveis
- Aplicar filtros ou agregações intermediárias
- Reutilizar um resultado apenas dentro da query atual
- Substituir subqueries difíceis de ler
- Evitar criar tabelas físicas ou views quando não necessário

CARACTERÍSTICAS IMPORTANTES:
- Existem apenas durante a execução da query
- Precisam obrigatoriamente de um alias
- Não podem ser reutilizadas fora da consulta
- São avaliadas antes do SELECT externo

SINTAXE BÁSICA:
SELECT colunas
FROM (
    SELECT colunas
    FROM tabela
    WHERE condição
) AS alias;

COMPARAÇÃO COM OUTROS CONCEITOS:
- Subquery: geralmente usada em WHERE ou SELECT
- Tabela Derivada: usada no FROM
- CTE: alternativa mais legível para consultas grandes
- Tabela Temporária: persiste durante a sessão

EXEMPLOS (AdventureWorksLT):
*/


-- 1) Tabela derivada para filtrar pedidos por cliente
 SELECT
   d.CustomerID,
   d.TotalPedidos
 FROM (
   SELECT
     CustomerID,
     COUNT(*) AS TotalPedidos
   FROM SalesLT.SalesOrderHeader
   GROUP BY CustomerID
 ) AS d
 WHERE d.TotalPedidos >= 5;

-- 2) Tabela derivada com JOIN
 SELECT
   p.ProductID,
   p.Name,
   d.MediaPreco
 FROM SalesLT.Product p
 INNER JOIN (
   SELECT
     ProductCategoryID,
     AVG(ListPrice) AS MediaPreco
   FROM SalesLT.Product
   GROUP BY ProductCategoryID
 ) AS d
   ON p.ProductCategoryID = d.ProductCategoryID;

-- 3) Tabela derivada para ordenar antes de filtrar
 SELECT TOP 10 *
 FROM (
   SELECT
     CustomerID,
     COUNT(*) AS TotalPedidos
   FROM SalesLT.SalesOrderHeader
   GROUP BY CustomerID
 ) AS d
 ORDER BY d.TotalPedidos DESC;

/*
BOAS PRÁTICAS:
- Sempre use alias claros e curtos
- Evite tabelas derivadas muito profundas (difíceis de ler)
- Se a query ficar grande, considere usar CTE
- Prefira soluções set-based (em conjunto)

ERROS COMUNS:
- Esquecer o alias da tabela derivada (erro de sintaxe)
- Tentar usar a tabela derivada fora da query
- Excesso de níveis aninhados

RESUMO:
Tabela derivada é ideal quando você precisa:
↳ organizar a lógica  
↳ aplicar filtros ou agregações intermediárias  
↳ sem criar objetos permanentes no banco

*/

-- Outro Exemplo:
-- Selecionar a Categoria e a contagem de produtos por categoria atrav�s de uma tabela derivada
SELECT Category, COUNT(ProductID) AS Products
FROM
	--Tabela derivada pode ser executada separadamente
	(SELECT p.ProductID, p.Name AS Product, c.Name AS Category
	FROM SalesLT.Product AS p
	INNER JOIN SalesLT.ProductCategory AS c
	ON p.ProductCategoryID = c.ProductCategoryID) AS ProdCats
GROUP BY Category
ORDER BY Category;