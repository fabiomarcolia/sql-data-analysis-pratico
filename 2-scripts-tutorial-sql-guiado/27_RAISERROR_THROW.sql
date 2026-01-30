
/*****************************************************************
							Erros

	Os erros em T-SQL s�o lan�ados seguinto a seguinte estrutura:

- Error number: n�mero �nico que identifica um erro em espec�fico;
- Error message: mensagem descrevendo o erro;
- Severity: indica��o num�rica da seriedade (1 a 25);
- State: c�digo de estado interno para a condi��o do database
- Procedure: nome da SP u Trigger onde o erro ocorreu;
- Line number: em qual statemente o erro ocorreu
*****************************************************************/

/*****************************************************************
					  RAISERROR

	Lan�a um erro espec�fico na tablea sys.messages. Sintaxe:

	RAISEERROR('Error message', 16 <severity>, 0 <state>)
*****************************************************************/

/*****************************************************************
					  THROW

	Tamb�m lan�a um erro, por�m de uma maneira ligeiramente diferente

	THROE 50001, 'Error message', 0

	(A severidade � sempre 16 para o lan�amento de erros com o THROW)
*****************************************************************/

--1. Atualizando tabela e lan�ando erros (RAISEERROR)
INSERT INTO SalesLT.SalesOrderDetail (SalesOrderID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount)
VALUES (1000000, 1, 680, 1431.50, 0.00)

UPDATE SalesLT.Product SET DiscontinuedDate = GETDATE()
WHERE ProductID = 0;

IF @@ROWCOUNT < 1
	RAISERROR('The product was not found - no products have been updated', 16, 0);

--2. Atualizando tabela e lan�ando erros (THROW)
UPDATE SalesLT.Product SET DiscontinuedDate = GETDATE()
WHERE ProductID = 0;

IF @@ROWCOUNT < 1
	THROW 50001, 'The product was not found - no products have been updated', 0;