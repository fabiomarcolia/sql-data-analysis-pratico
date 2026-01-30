/*
CONCEITO: TRANSACTIONS (Transações)

OBJETIVO:
Garantir consistência dos dados ao executar múltiplos comandos
como uma única unidade lógica.

QUANDO USAR:
- INSERT / UPDATE / DELETE em conjunto
- Processos críticos
- Scripts que não podem ficar parcialmente executados

CONCEITOS IMPORTANTES:
- BEGIN TRANSACTION: inicia a transação
- COMMIT: confirma as alterações
- ROLLBACK: desfaz as alterações

SINTAXE:
BEGIN TRANSACTION;
  -- comandos
COMMIT;

OU

BEGIN TRANSACTION;
  -- comandos
ROLLBACK;
*/

-- Exemplo (didático):
-- BEGIN TRANSACTION;
--   UPDATE SalesLT.Product
--   SET ListPrice = ListPrice * 1.1
--   WHERE ProductCategoryID = 1;
--
--   -- Verifique o resultado antes de confirmar
--   -- SELECT * FROM SalesLT.Product WHERE ProductCategoryID = 1;
--
-- -- COMMIT;   -- confirme se estiver correto
-- -- ROLLBACK; -- use se precisar desfazer


--1. Implementando TRANSACTIONS
BEGIN TRY
	INSERT INTO SalesLT.SalesOrderHeader(Duedate, CustomerID, ShipMethod)
	VALUES (DATEADD(dd, 7, GETDATE()), 1, 'STD_DELIVERY')

	DECLARE @SalesOrderID INT = SCOPE_IDENTITY();

	INSERT INTO SalesLT.SalesOrderDetail (SalesOrderID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount)
	VALUES (@SalesOrderID, 1, 999999, 1431.50, 0.00);
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE();
END CATCH

--2. Visualizando pedidos sem detalhes 
SELECT h.SalesOrderID, h.DueDate, h.CustomerID, h.ShipMethod, d.SalesOrderDetailID
FROM SalesLT.SalesOrderHeader h
LEFT JOIN SalesLT.SalesOrderDetail d
ON h.SalesOrderID = d.SalesOrderID
WHERE d.SalesOrderDetailID IS NULL;

--2.1 Deletando manualmente
DELETE FROM SalesLT.SalesOrderHeader
WHERE SalesOrderID = SCOPE_IDENTITY()

--2.1 Utilizando TRANSACTION
BEGIN TRY
	BEGIN TRANSACTION
		INSERT INTO SalesLT.SalesOrderHeader (DueDate, CustomerID, ShipMethod)
		VALUES (DATEADD(dd, 7, GETDATE()), 1, 'STD DELIVERY');

		DECLARE @SalesOrderID INT = SCOPE_IDENTITY();

		INSERT INTO SalesLT.SalesOrderDetail (SalesOrderID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount)
		VALUES (@SalesOrderID, 1, 999999, 1431.50, 0.00);
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	BEGIN
		PRINT XACT_STATE()
		ROLLBACK TRANSACTION;
	END
	PRINT ERROR_MESSAGE();
	THROW 500001, 'An INSERT failed. The transaction was cancelled.', 0;
END CATCH

-- Check for orphaned orders
SELECT h.SalesOrderID, h.DueDate, h.CustomerID, h.ShipMethod, d.SalesOrderDetailID
FROM SalesLT.SalesOrderHeader AS h
LEFT JOIN SalesLT.SalesOrderDetail AS d
ON d.SalesOrderID = h.SalesOrderID
WHERE D.SalesOrderDetailID IS NULL

-- Use XACT_ABORT
SET XACT_ABORT ON;
BEGIN TRY
  BEGIN TRANSACTION
	INSERT INTO SalesLT.SalesOrderHeader (DueDate, CustomerID, ShipMethod)
	VALUES
	(DATEADD(dd, 7, GETDATE()), 1, 'STD DELIVERY');

	DECLARE @SalesOrderID int = SCOPE_IDENTITY();

	INSERT INTO SalesLT.SalesOrderDetail (SalesOrderID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount)
	VALUES
	(@SalesOrderID, 1, 99999, 1431.50, 0.00);
  COMMIT TRANSACTION
END TRY
BEGIN CATCH
  PRINT ERROR_MESSAGE();
  THROW 50001,'An insert failed. The transaction was cancelled.', 0;
END CATCH;
SET XACT_ABORT OFF;

-- Check for orphaned orders
SELECT h.SalesOrderID, h.DueDate, h.CustomerID, h.ShipMethod, d.SalesOrderDetailID
FROM SalesLT.SalesOrderHeader AS h
LEFT JOIN SalesLT.SalesOrderDetail AS d
ON d.SalesOrderID = h.SalesOrderID
WHERE D.SalesOrderDetailID IS NULL