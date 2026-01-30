/*
OBJETO: STORED PROCEDURE (Procedures)

OBJETIVO:
Encapsular lógica SQL reutilizável com parâmetros.

QUANDO USAR:
- Padronizar rotinas
- Melhorar reuso e governança
- Expor operações controladas

SINTAXE:
CREATE OR ALTER PROCEDURE nome (@param tipo)
AS
BEGIN
  -- comandos
END;
*/

-- Exemplo (didático):
-- CREATE OR ALTER PROCEDURE SalesLT.usp_PedidosPorCliente (@CustomerID INT)
-- AS
-- BEGIN
--   SELECT *
--   FROM SalesLT.SalesOrderHeader
--   WHERE CustomerID = @CustomerID;
-- END;

/*****************************************************************
					STORED PROCEDURE

	As Stored Procedures s�o criadas para encapsular o c�digo e
definir um bloco respons�vel por executar determinada a��o definida
neste bloco. Stored Procedures podem ter inputs e tamb�m podem
retornar valores como outputs.

			CREATE PROCEDURE <procedure_name>(<params>)
			AS
			<procedure_code>

	Para executar uma procedure: EXEC <procedure_name>
*****************************************************************/

--1. Criando uma Procedure
CREATE PROCEDURE SalesLT.GetProductsByCategory (@CategoryID INT = NULL)
AS
IF @CategoryID IS NULL
	SELECT ProductID, Name, Color, Size, ListPrice
	FROM SalesLT.Product
ELSE
	SELECT ProductID, Name, Color, Size, ListPrice
	FROM SalesLT.Product
	WHERE ProductCategoryID = @CategoryID;

--1.1 Executando Procedure (sem par�metros de entrada -> ProductCategoryID = NULL)
EXEC SalesLT.GetProductsByCategory;

--1.2 Executando Procedure (com par�metro de entrada)
EXEC SalesLT.GetProductsByCategory 6;