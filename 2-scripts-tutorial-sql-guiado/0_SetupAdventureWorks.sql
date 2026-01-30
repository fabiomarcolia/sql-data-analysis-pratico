/*
SCRIPT: Setup e Validação do Ambiente (AdventureWorksLT)

OBJETIVO:
Validar se o banco, schema (SalesLT) e tabelas principais estão acessíveis.

QUANDO USAR:
- Após criar o Azure SQL Database
- Após configurar firewall/credenciais
- Antes de iniciar os estudos e laboratórios

SINTAXE (exemplos típicos):
-- Ver schema/tabelas
SELECT TOP 50 TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'SalesLT';

-- Amostrar dados
SELECT TOP 10 *
FROM SalesLT.Customer;
*/

-- Criando uma View
CREATE VIEW [SalesLT].[Customers] AS
SELECT DISTINCT FirstName, LastName
FROM SalesLT.Customer
WHERE LastName >='m'
OR CustomerID = 3;
GO

CREATE VIEW [SalesLT].[Employees] AS
SELECT DISTINCT FirstName, LastName
FROM SalesLT.Customer
WHERE LastName <='m'
OR CustomerID = 3;
GO

SELECT FirstName, LastName
FROM SalesLT.Employees
UNION
SELECT FirstName, LastName
FROM SalesLT.Customers
ORDER BY LastName;