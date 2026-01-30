/*
COMANDO: LEFT JOIN

OBJETIVO:
Retornar todos os registros da tabela da esquerda, com ou sem correspondência.

QUANDO USAR:
- Identificar "faltantes" (ex: clientes sem pedidos)
- Auditorias de completude
- Relatórios com informação opcional

SINTAXE:
SELECT ...
FROM tabelaA A
LEFT JOIN tabelaB B
  ON A.chave = B.chave;
*/

-- LEFT JOIN------------------------------------------

--1. Retornar clientes (FirstName e LastName) da tabela Customer que fizeram pedidos (SalesOrderNumber da tabela SalesOrderHeader)
SELECT TOP 10 * FROM SalesLT.Customer;
SELECT TOP 10 * FROM SalesLT.SalesOrderHeader;

--2. Retornar todos os clientes e os pedidos, independente se este realizou algum ou n�o
SELECT c.FirstName, c.LastName, oh.SalesOrderNumber
FROM SalesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader oh
ON c.CustomerID = oh.CustomerID

--3. Retornar apenas clientes que n�o compraram nada
SELECT c.FirstName, c.LastName, oh.SalesOrderNumber
FROM SalesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader oh
ON c.CustomerID = oh.CustomerID
WHERE oh.SalesOrderID IS NULL
-------------------------------------------------------

-- RIGHT JOIN------------------------------------------

/*
COMANDO: RIGHT JOIN

OBJETIVO:
Retornar todos os registros da tabela da direita, com ou sem correspondência.

QUANDO USAR:
- Casos específicos (geralmente preferimos reescrever como LEFT JOIN invertendo tabelas)
- Auditorias e comparações

SINTAXE:
SELECT ...
FROM tabelaA A
RIGHT JOIN tabelaB B
  ON A.chave = B.chave;
*/

-- Exemplo (didático):
-- RETORNANDO CLIENTES COM COMPRAR

SELECT TOP 10 c.CustomerID, soh.SalesOrderID
FROM SalesLT.Customer c
RIGHT JOIN SalesLT.SalesOrderHeader soh
ON soh.CustomerID = c.CustomerID;

-------------------------------------------------------

/*
COMANDO: FULL OUTER JOIN

OBJETIVO:
Retornar todos os registros de ambas as tabelas, casando quando houver correspondência.

QUANDO USAR:
- Auditorias (itens "só na A", "só na B", "em ambas")
- Comparações entre fontes/conjuntos

SINTAXE:
SELECT ...
FROM tabelaA A
FULL OUTER JOIN tabelaB B
  ON A.chave = B.chave;
*/

-- Exemplo (didático):
SELECT TOP 50 c.CustomerID, soh.SalesOrderID
FROM SalesLT.Customer c
FULL OUTER JOIN SalesLT.SalesOrderHeader soh
ON soh.CustomerID = c.CustomerID;
