/*
COMANDO: IF / ELSE

OBJETIVO:
Executar blocos de SQL de forma condicional.

QUANDO USAR:
- Scripts administrativos
- Regras simples de decisão
- Execução controlada

SINTAXE:
IF condição
BEGIN
  -- comandos
END
ELSE
BEGIN
  -- comandos
END
*/

-- Exemplo (didático):
-- IF EXISTS (SELECT 1 FROM SalesLT.Customer WHERE CompanyName IS NULL)
-- BEGIN
--   PRINT 'Existem clientes sem CompanyName';
-- END
-- ELSE
-- BEGIN
--   PRINT 'Todos os clientes têm CompanyName';
-- END

/*****************************************************************
					IF - BEGIN - END

	� poss�vel utilizar condicionais no SQL a partir dos comandos
IF, BEGIN e END. Abaixo, alguns exemplos de como aplicar a sintaxe
*****************************************************************/

--1. Comunicando resultado do Update atrav�s de condicionais
UPDATE SalesLT.Product
SET DiscontinuedDate=getdate()
WHERE ProductID=1;

IF @@ROWCOUNT<1
BEGIN
	PRINT 'Product was not found'
END
ELSE
BEGIN
	PRINT 'Product Updated'
END