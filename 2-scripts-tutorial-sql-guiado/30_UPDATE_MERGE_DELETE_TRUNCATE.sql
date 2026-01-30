--Section 4, M�dulo 9, Arquivo 2 - UPDATE

/*****************************************************************
							UPDATE

	Atualiza��o de elementos da tabela a partir de condi��es
pr�-definidas na cl�usula WHERE. Sintaxe:

UPDATE <table> SET <column(s)> = <value(s)> 
WHERE <condition>
*****************************************************************/

/*****************************************************************
							MERGE

	O comando MERGE modifica a base de dados em condi��es:
	- Quando a tabela source bate com a tabela target
	- Quando a tabela source n�o tem v�nculo com a target
	- Quando a tabela target n�o tem v�nculo com a fonte

MERGE INTO <table_source> AS <allias>
	USING <table_target> AS <allias2>
	ON <allias1>.<column> = <allias2>.<column>
WHEN MATCHED THEN
	UPDATE SET <column> = <value>
WHERE NOT MATCHED THEN
	INSERT (<columns>)
	VALUES (<columns<);
*****************************************************************/

/*****************************************************************
							DELETE

	Comando que simplesmente elimina um ou mais registros da 
tabela no Banco de Dados. Sintaxe:

DELETE FROM <table> WHERE <condition>
*****************************************************************/

/*****************************************************************
					    TRUNCATE TABLE

	O comando TRUNCATE limpa a tabela inteira de uma �nica vez. 
As linhas s�o eliminadas simultaneamente e n�o individualmente
*****************************************************************/

/* -------------------------------------------------------------------------------------------------*/

--0. Visualizando os dados a serem utilizados como exemplo
SELECT * FROM SalesLT.CallLog;

--1. Atualizando dados nulos
UPDATE SalesLT.CallLog SET Notes = 'No notes' WHERE Notes IS NULL;

--1.1 Atualizando m�ltiplas colunas
UPDATE SalesLT.CallLog SET SalesPerson = '', PhoneNumber = '';

--1.2 Atualizando dados a partir do retorno de uma query
UPDATE SalesLT.CallLog 
SET SalesPerson = c.SalesPerson, PhoneNumber = c.Phone
FROM SalesLT.Customer c
WHERE c.CustomerID = SalesLT.CallLog.CustomerID;

/* -------------------------------------------------------------------------------------------------*/

--2. Deletando linhas (primeira linha)
DELETE FROM SalesLT.CallLog
WHERE CallTime < DATEADD(dd, -7, GETDATE())

SELECT * FROM SalesLT.CallLog

TRUNCATE TABLE SalesLT.CallLog -- APAGA TODOS OS DADOS SEM POSSÍBILIDADE DE RECUPERAR