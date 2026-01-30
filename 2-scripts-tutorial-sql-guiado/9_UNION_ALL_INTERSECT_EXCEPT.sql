/*
COMANDO: UNION

OBJETIVO:
Unir resultados de duas consultas e remover duplicidades.

QUANDO USAR:
- Combinar conjuntos similares
- Consolidar fontes
- Quando duplicidade deve ser eliminada

SINTAXE:
SELECT colunas FROM A
UNION
SELECT colunas FROM B;

Observação:
As consultas devem ter o mesmo número de colunas e tipos compatíveis.
*/

-- Exemplo (didático):
-- SELECT EmailAddress FROM SalesLT.Customer
-- UNION
-- SELECT EmailAddress FROM SalesLT.Customer;

-- UNION ALL -> A DIFERENÇA É QUE NÃO REMOVE DUPLICEDADES SE HOUVER O MESMO REGISTRO NAS DUAS TABELAS

-- UNION------------------------------------------------------------

--1. Unir as tabelas Employees e Customers para verificar todos os empregados e clientes 
--(removendo as duplicatas com UNION)
SELECT FirstName, LastName
FROM SalesLT.Employees
UNION
SELECT FirstName, LastName
FROM SalesLT.Customers

-- UNION ALL
SELECT FirstName, LastName
FROM SalesLT.Employees
UNION ALL
SELECT FirstName, LastName
FROM SalesLT.Customers
-----

--2. Repetir a consulta anterior sem a remo��o de duplicatas (UNION ALL)
SELECT FirstName, LastName
FROM SalesLT.Employees
UNION ALL
SELECT FirstName, LastName
FROM SalesLT.Customers

--3. Diferenciar clientes e empregados
--Existe algu�m que � tanto empregado quanto cliente? (1 pessoa, pela quantidade de linhas: Donna Carreras)
SELECT FirstName, LastName, 'Employees' AS Type
FROM SalesLT.Employees
UNION
SELECT FirstName, LastName, 'Customers'
FROM SalesLT.Customers
------------------------------------------------------------------------

-- INTERSECT -----------------------------------------------------------

/*
COMANDO: INTERSECT

OBJETIVO:
Retornar apenas os registros comuns entre duas consultas.

QUANDO USAR:
- Auditorias
- Validações entre bases
- Comparação de listas

SINTAXE:
SELECT colunas FROM A
INTERSECT
SELECT colunas FROM B;
*/

-- Exemplo (didático):
-- SELECT CustomerID FROM SalesLT.SalesOrderHeader
-- INTERSECT
-- SELECT CustomerID FROM SalesLT.Customer;

--4. Retornar apenas Empregados que tamb�m s�o Clientes
SELECT FirstName, LastName
FROM SalesLT.Employees
INTERSECT
SELECT FirstName, LastName
FROM SalesLT.Customers
---------------------------------------------------------------------------

-- EXPECT -----------------------------------------------------------------

/*
COMANDO: EXCEPT

OBJETIVO:
Retornar registros que estão na primeira consulta e não estão na segunda.

QUANDO USAR:
- Encontrar faltantes
- Auditorias e reconciliação
- Diferenças entre conjuntos

SINTAXE:
SELECT colunas FROM A
EXCEPT
SELECT colunas FROM B;
*/

-- Exemplo (didático):
-- SELECT CustomerID FROM SalesLT.Customer
-- EXCEPT
-- SELECT CustomerID FROM SalesLT.SalesOrderHeader;


--5. Retornar apenas Clientes que n�o s�o Empregados
SELECT FirstName, LastName
FROM SalesLT.Customers
EXCEPT
SELECT FirstName, LastName
FROM SalesLT.Employees