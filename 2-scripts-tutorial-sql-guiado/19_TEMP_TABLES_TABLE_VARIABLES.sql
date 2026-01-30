/*
CONCEITO: Tabelas temporárias (#temp)

OBJETIVO:
Armazenar resultados intermediários durante a sessão/conexão.

QUANDO USAR:
- Processos em múltiplas etapas
- Simplificar consultas complexas
- Cenários de performance/testes

SINTAXE:
CREATE TABLE #temp (...);
INSERT INTO #temp ...
SELECT ... FROM #temp;
DROP TABLE #temp;
*/

-- Exemplo (didático):
-- CREATE TABLE #TopClientes (CustomerID INT, QtdPedidos INT);
-- INSERT INTO #TopClientes
-- SELECT TOP 10 CustomerID, COUNT(*) AS QtdPedidos
-- FROM SalesLT.SalesOrderHeader
-- GROUP BY CustomerID
-- ORDER BY QtdPedidos DESC;
-- SELECT * FROM #TopClientes;

/*
CONCEITO: Variáveis de tabela (@tabela)

OBJETIVO:
Armazenar dados temporários em memória/escopo do batch (limitado), útil para pequenos conjuntos.

QUANDO USAR:
- Pequenos resultados intermediários
- Scripts simples e controlados
- Quando não precisa de #temp

SINTAXE:
DECLARE @tabela TABLE (...);
INSERT INTO @tabela ...
SELECT ... FROM @tabela;
*/

-- Exemplo (didático):
-- DECLARE @TopProdutos TABLE (ProductID INT, ListPrice MONEY);
-- INSERT INTO @TopProdutos
-- SELECT TOP 10 ProductID, ListPrice
-- FROM SalesLT.Product
-- ORDER BY ListPrice DESC;
-- SELECT * FROM @TopProdutos;

----------------------------------------------------------------------------------

--1. Criando tabela tempor�ria
CREATE TABLE #tmpProducts
(ProductID INTEGER,
ProductName VARCHAR(5));

--1.1 Selecionando dados da tabela tempor�ria
SELECT * FROM #tmpProducts;

--2. Criando vari�veis do tipo TABLE
DECLARE @varProducts TABLE
(ProductID INTEGER,
ProductName VARCHAR(50));

--2.1 O escopo da vari�vel � o batch do comando
SELECT * FROM @varProducts;
--Obs: SELECT e DECLARE devem ser executados juntos
--N�o � poss�vel executar o SELECT individualmente

--------------------------------------------------------------

--3. Tabelas Tempor�rias
CREATE TABLE #Colors
(Color VARCHAR(15));

INSERT INTO #Colors
SELECT DISTINCT Color FROM SalesLT.Product

SELECT * FROM #Colors

--4. Vari�veis do tipo Tabela
DECLARE @Colors AS TABLE
(Color VARCHAR(15));

INSERT INTO @Colors
SELECT DISTINCT Color FROM SalesLT.Product

--A declara��o, inser��o e sele��o devem ser executadas em uma mesma batch
SELECT * FROM @Colors