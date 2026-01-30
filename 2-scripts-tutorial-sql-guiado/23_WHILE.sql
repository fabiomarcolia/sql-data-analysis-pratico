/*
COMANDO: WHILE

OBJETIVO:
Repetir a execução de um bloco enquanto uma condição for verdadeira.

QUANDO USAR:
- Rotinas controladas
- Scripts de manutenção (com muito cuidado)
- Processos iterativos simples

ATENÇÃO:
- Loops podem degradar performance. Prefira soluções em conjunto (set-based) quando possível.

SINTAXE:
WHILE condição
BEGIN
  -- comandos
END
*/

-- Exemplo (didático):
-- DECLARE @i INT = 1;
-- WHILE @i <= 3
-- BEGIN
--   PRINT @i;
--   SET @i += 1;
-- END

/*****************************************************************
					WHILE - BEGIN - END

	Os loopings em SQL geralmente n�o s�o t�o aplic�veis, visto que
estamos interessados em opera��es baseadas em "sets" e n�o linha
a linha. Comandos que rodam em batch de uma �nica vez s�o mais
eficientes do que programas que iteram atrav�s de inst�ncias

				WHILE <condition>
				BEGIN
					<comandos>
				END
*****************************************************************/

--0. Criando tabela de exemplo

IF OBJECT_ID('SalesLT.DemoTable') IS NOT NULL
	BEGIN
	DROP TABLE SalesLT.DemoTable
	END
GO


CREATE TABLE SalesLT.DemoTable
(ID INT IDENTITY(1,1),
Description Varchar(20),
CONSTRAINT [PK_DemoTable] PRIMARY KEY CLUSTERED(ID) 
)
GO

--1. Exemplo WHILE
DECLARE @Counter INT = 1

WHILE @Counter <= 5
BEGIN
	INSERT SalesLT.DemoTable(Description)
	VALUES ('ROW ' + CONVERT(VARCHAR(5), @Counter))
	SET @Counter = @Counter + 1
END

SELECT * FROM SalesLT.DemoTable