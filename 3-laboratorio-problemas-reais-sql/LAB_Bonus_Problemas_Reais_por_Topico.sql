/*
LAB_BONUS — Problemas de Negócio por Tópico (Checklist de SQL)

OBJETIVO:
Este arquivo bônus reúne desafios adicionais organizados por tópicos de SQL.
A ideia é você praticar de forma estruturada (como um "simulado") usando o banco AdventureWorksLT (SalesLT).

COMO USAR:
1- Escolha um tópico (ex: DQL, DML, JOINs, Subconsultas...)
2- Tente resolver os desafios SEM olhar o gabarito
3- Compare com o gabarito no final (seção "GABARITO")

REGRAS:
- Não altere dados em produção. Aqui é laboratório.
- Se for testar DML/DDL, use transações e ROLLBACK (quando fizer sentido).
- Sempre valide com SELECT antes de COMMIT.
*/

/* =====================================================================
1- Consulta de Dados (DQL) — SELECT / WHERE / ORDER BY / DISTINCT
=====================================================================

[Desafio 1.1] Listagem de clientes
- Liste os 20 primeiros clientes com: CustomerID, FirstName, LastName, EmailAddress.
- Ordene por LastName e FirstName.

[Desafio 1.2] Produtos por faixa de preço
- Liste produtos com ListPrice entre 100 e 500 (incluindo limites).
- Retorne ProductID, Name, ListPrice.
- Ordene do maior para o menor preço.

[Desafio 1.3] Valores distintos
- Quais são os valores distintos de Color em SalesLT.Product?
- Ignore NULL.

-- Sua solução aqui:
*/



/* =====================================================================
2- Manipulação de Dados (DML) — INSERT / UPDATE / DELETE (com cuidado)
=====================================================================

[Desafio 2.1] Atualização controlada de preços (simulação)
- Aumente em 2% o ListPrice de uma categoria (ProductCategoryID = 1).
- Use TRANSACTION + ROLLBACK (não deve persistir no banco).
- Depois do UPDATE, faça um SELECT para conferir.

[Desafio 2.2] Inserção de registro (simulação)
- Crie um registro de teste em uma tabela de sua escolha (se existir permissão).
- Se você não tiver permissão, apenas escreva o comando e comente "não executar".

[Desafio 2.3] Exclusão segura (simulação)
- Faça um DELETE em registro de teste criado anteriormente.
- Use TRANSACTION + ROLLBACK.

-- Sua solução aqui:
*/



/* =====================================================================
3- Definição de Dados (DDL) — CREATE / ALTER / DROP (somente simulação)
=====================================================================

[Desafio 3.1] Criar uma tabela temporária para auditoria
- Crie uma tabela temporária #AuditProdutos com colunas: ProductID, Name, ListPrice.
- Insira nela os 10 produtos mais caros.
- Consulte a tabela temporária.

[Desafio 3.2] Criar uma VIEW de faturamento por cliente
- Crie (ou altere) uma VIEW que retorne CustomerID e FaturamentoTotal (SUM(SubTotal)).

-- Sua solução aqui:
*/



/* =====================================================================
4- Controle de Dados (DCL) — GRANT / REVOKE (teórico para Azure SQL)
=====================================================================

[Desafio 4.1] (Teórico) Permitir SELECT para um usuário
- Escreva o comando GRANT SELECT para uma role/usuário (ex: leitor).
- Observação: em ambientes gerenciados, você pode não ter permissão para executar.

[Desafio 4.2] (Teórico) Revogar permissão
- Escreva o comando REVOKE do SELECT para o mesmo usuário/role.

-- Sua solução aqui:
*/



/* =====================================================================
5- Comandos de Junção: JOINS (INNER, LEFT, RIGHT, FULL)
=====================================================================

[Desafio 5.1] Pedidos por cliente (INNER JOIN)
- Liste: CustomerID, Nome do cliente, SalesOrderID, OrderDate.
- Apenas pedidos existentes.

[Desafio 5.2] Clientes sem pedidos (LEFT JOIN)
- Liste clientes que nunca fizeram pedido.

[Desafio 5.3] Auditoria (FULL JOIN)
- Compare clientes vs pedidos por CustomerID usando FULL JOIN.
- Classifique em: "Só cliente", "Só pedido", "Em ambos".

-- Sua solução aqui:
*/



/* =====================================================================
6- Sub Consultas — IN / EXISTS / Subquery no SELECT / Derived Table
=====================================================================

[Desafio 6.1] Produtos acima da média (subquery)
- Liste produtos com ListPrice acima da média de ListPrice.

[Desafio 6.2] Clientes com pedidos (EXISTS)
- Liste clientes que possuem pelo menos 1 pedido usando EXISTS.

[Desafio 6.3] Derived table para top clientes
- Use uma tabela derivada no FROM para calcular faturamento por cliente.
- Depois filtre apenas faturamento >= 5000.

-- Sua solução aqui:
*/



/* =====================================================================
7- Funções de Agregações (Realizam Cálculos) — COUNT / SUM / AVG / MIN / MAX
=====================================================================

[Desafio 7.1] KPIs gerais
- Total de clientes
- Total de pedidos
- Faturamento total (detalhe ou header, escolha 1 e justifique)

[Desafio 7.2] Produtos por categoria
- Quantidade de produtos por ProductCategoryID

[Desafio 7.3] Ticket médio por mês
- Ticket médio (AVG(SubTotal)) agrupado por ano/mês

-- Sua solução aqui:
*/



/* =====================================================================
8- Funções de Manipulação de String/Texto — UPPER / LOWER / CONCAT / LEN / REPLACE
=====================================================================

[Desafio 8.1] Padronização de nomes
- Retorne FirstName e LastName em maiúsculas
- Crie uma coluna NomeCompleto com CONCAT

[Desafio 8.2] Validação de e-mail
- Retorne EmailAddress e uma flag:
  "OK" se contém '@' e '.'
  "INVALIDO" caso contrário
- Dica: use LIKE e CASE

[Desafio 8.3] Limpeza simples
- Substitua espaços duplos em CompanyName (se existir) por espaço simples (REPLACE)

-- Sua solução aqui:
*/



/* =====================================================================
9- Funções de Manipulação de Data/Hora — GETDATE / DATEADD / DATEDIFF / YEAR / MONTH
=====================================================================

[Desafio 9.1] Último pedido por cliente
- Para cada cliente, traga a data do último pedido (MAX(OrderDate))

[Desafio 9.2] Clientes inativos
- Liste clientes cujo último pedido foi há mais de 365 dias
- Dica: DATEDIFF(day, UltimoPedido, GETDATE())

[Desafio 9.3] Faturamento por ano/mês
- Faturamento por ano e mês com SUM(SubTotal)

-- Sua solução aqui:
*/



/* =====================================================================
10- Expressões Condicionais — CASE / IIF
=====================================================================

[Desafio 10.1] Classificação de clientes por faturamento
- Classifique clientes em: Sem compras / Baixo / Médio / Alto
- Baseado no faturamento total

[Desafio 10.2] Pedidos com desconto
- Em SalesOrderDetail, crie uma coluna:
  "Com desconto" se UnitPriceDiscount > 0
  "Sem desconto" caso contrário

-- Sua solução aqui:
*/



/* =====================================================================
11- Operações de Conjunto — UNION / UNION ALL / INTERSECT / EXCEPT
=====================================================================

[Desafio 11.1] UNION vs UNION ALL (didático)
- Faça duas consultas equivalentes e compare UNION e UNION ALL.
- Explique (em comentário) por que os resultados mudam.

[Desafio 11.2] Clientes sem pedidos (EXCEPT)
- Liste CustomerID de clientes que nunca fizeram pedidos usando EXCEPT.

[Desafio 11.3] Clientes com pedidos (INTERSECT)
- Liste CustomerID que aparecem em Customer e em SalesOrderHeader.

-- Sua solução aqui:
*/



/* =====================================================================
GABARITO (Soluções sugeridas)
⚠️ Tente resolver antes de olhar.
===================================================================== */

-- 1) DQL
-- 1.1
SELECT TOP 20 CustomerID, FirstName, LastName, EmailAddress
FROM SalesLT.Customer
ORDER BY LastName, FirstName;

-- 1.2
SELECT ProductID, Name, ListPrice
FROM SalesLT.Product
WHERE ListPrice BETWEEN 100 AND 500
ORDER BY ListPrice DESC;

-- 1.3
SELECT DISTINCT Color
FROM SalesLT.Product
WHERE Color IS NOT NULL
ORDER BY Color;

-- 2) DML (simulação com rollback)
-- 2.1
BEGIN TRANSACTION;
  UPDATE SalesLT.Product
  SET ListPrice = ListPrice * 1.02
  WHERE ProductCategoryID = 1;

  SELECT TOP 20 ProductID, Name, ListPrice, ProductCategoryID
  FROM SalesLT.Product
  WHERE ProductCategoryID = 1
  ORDER BY ProductID;
ROLLBACK;

-- 2.2 / 2.3 (dependem de permissão e de tabela alvo)
-- -- INSERT INTO ... (não executar se não tiver permissão)
-- -- DELETE FROM ... (não executar se não tiver permissão)

-- 3) DDL
-- 3.1
CREATE TABLE #AuditProdutos (
  ProductID INT,
  Name NVARCHAR(100),
  ListPrice MONEY
);

INSERT INTO #AuditProdutos (ProductID, Name, ListPrice)
SELECT TOP 10 ProductID, Name, ListPrice
FROM SalesLT.Product
ORDER BY ListPrice DESC;

SELECT * FROM #AuditProdutos;

-- 3.2
-- CREATE OR ALTER VIEW SalesLT.vw_FaturamentoPorCliente AS
-- SELECT CustomerID, SUM(SubTotal) AS FaturamentoTotal
-- FROM SalesLT.SalesOrderHeader
-- GROUP BY CustomerID;

-- 4) DCL (teórico)
-- GRANT SELECT ON SCHEMA::SalesLT TO leitor;
-- REVOKE SELECT ON SCHEMA::SalesLT FROM leitor;

-- 5) JOINs
-- 5.1
SELECT TOP 50
  c.CustomerID,
  CONCAT(c.FirstName, ' ', c.LastName) AS Cliente,
  soh.SalesOrderID,
  soh.OrderDate
FROM SalesLT.Customer c
INNER JOIN SalesLT.SalesOrderHeader soh
  ON soh.CustomerID = c.CustomerID
ORDER BY soh.OrderDate DESC;

-- 5.2
SELECT c.CustomerID, c.FirstName, c.LastName
FROM SalesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader soh
  ON soh.CustomerID = c.CustomerID
WHERE soh.SalesOrderID IS NULL
ORDER BY c.CustomerID;

-- 5.3
SELECT
  c.CustomerID AS CustomerID_Cliente,
  soh.CustomerID AS CustomerID_Pedido,
  CASE
    WHEN c.CustomerID IS NOT NULL AND soh.CustomerID IS NOT NULL THEN 'Em ambos'
    WHEN c.CustomerID IS NOT NULL AND soh.CustomerID IS NULL THEN 'Só cliente'
    ELSE 'Só pedido'
  END AS Status
FROM SalesLT.Customer c
FULL OUTER JOIN SalesLT.SalesOrderHeader soh
  ON soh.CustomerID = c.CustomerID;

-- 6) Subconsultas
-- 6.1
SELECT ProductID, Name, ListPrice
FROM SalesLT.Product
WHERE ListPrice > (SELECT AVG(ListPrice) FROM SalesLT.Product)
ORDER BY ListPrice DESC;

-- 6.2
SELECT c.CustomerID, c.FirstName, c.LastName
FROM SalesLT.Customer c
WHERE EXISTS (
  SELECT 1
  FROM SalesLT.SalesOrderHeader soh
  WHERE soh.CustomerID = c.CustomerID
);

-- 6.3
SELECT d.CustomerID, d.FaturamentoTotal
FROM (
  SELECT CustomerID, SUM(SubTotal) AS FaturamentoTotal
  FROM SalesLT.SalesOrderHeader
  GROUP BY CustomerID
) d
WHERE d.FaturamentoTotal >= 5000
ORDER BY d.FaturamentoTotal DESC;

-- 7) Agregações
-- 7.1
SELECT
  (SELECT COUNT(*) FROM SalesLT.Customer) AS TotalClientes,
  (SELECT COUNT(*) FROM SalesLT.SalesOrderHeader) AS TotalPedidos,
  (SELECT SUM(SubTotal) FROM SalesLT.SalesOrderHeader) AS FaturamentoTotal;

-- 7.2
SELECT ProductCategoryID, COUNT(*) AS QtdProdutos
FROM SalesLT.Product
GROUP BY ProductCategoryID
ORDER BY ProductCategoryID;

-- 7.3
SELECT
  YEAR(OrderDate) AS Ano,
  MONTH(OrderDate) AS Mes,
  AVG(SubTotal) AS TicketMedio
FROM SalesLT.SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Ano, Mes;

-- 8) String
-- 8.1
SELECT TOP 20
  UPPER(FirstName) AS FirstName_Upper,
  UPPER(LastName) AS LastName_Upper,
  CONCAT(FirstName, ' ', LastName) AS NomeCompleto
FROM SalesLT.Customer;

-- 8.2
SELECT TOP 50
  EmailAddress,
  CASE
    WHEN EmailAddress LIKE '%@%.%' THEN 'OK'
    ELSE 'INVALIDO'
  END AS StatusEmail
FROM SalesLT.Customer;

-- 8.3
SELECT TOP 50
  CompanyName,
  REPLACE(CompanyName, '  ', ' ') AS CompanyName_Limpo
FROM SalesLT.Customer
WHERE CompanyName IS NOT NULL;

-- 9) Data/Hora
-- 9.1
SELECT
  CustomerID,
  MAX(OrderDate) AS UltimoPedido
FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID;

-- 9.2
WITH ult AS (
  SELECT CustomerID, MAX(OrderDate) AS UltimoPedido
  FROM SalesLT.SalesOrderHeader
  GROUP BY CustomerID
)
SELECT
  CustomerID,
  UltimoPedido,
  DATEDIFF(day, UltimoPedido, GETDATE()) AS DiasSemComprar
FROM ult
WHERE DATEDIFF(day, UltimoPedido, GETDATE()) > 365
ORDER BY DiasSemComprar DESC;

-- 9.3
SELECT
  YEAR(OrderDate) AS Ano,
  MONTH(OrderDate) AS Mes,
  SUM(SubTotal) AS Faturamento
FROM SalesLT.SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Ano, Mes;

-- 10) Condicionais
-- 10.1
WITH fat AS (
  SELECT
    c.CustomerID,
    SUM(soh.SubTotal) AS FaturamentoTotal
  FROM SalesLT.Customer c
  LEFT JOIN SalesLT.SalesOrderHeader soh
    ON soh.CustomerID = c.CustomerID
  GROUP BY c.CustomerID
)
SELECT
  CustomerID,
  COALESCE(FaturamentoTotal, 0) AS FaturamentoTotal,
  CASE
    WHEN COALESCE(FaturamentoTotal, 0) = 0 THEN 'Sem compras'
    WHEN FaturamentoTotal < 1000 THEN 'Baixo'
    WHEN FaturamentoTotal BETWEEN 1000 AND 5000 THEN 'Médio'
    ELSE 'Alto'
  END AS Classe
FROM fat
ORDER BY FaturamentoTotal DESC;

-- 10.2
SELECT TOP 50
  SalesOrderID,
  ProductID,
  OrderQty,
  UnitPrice,
  UnitPriceDiscount,
  CASE
    WHEN UnitPriceDiscount > 0 THEN 'Com desconto'
    ELSE 'Sem desconto'
  END AS TipoDesconto
FROM SalesLT.SalesOrderDetail
ORDER BY SalesOrderID;

-- 11) Conjuntos
-- 11.1
SELECT EmailAddress FROM SalesLT.Customer
UNION
SELECT EmailAddress FROM SalesLT.Customer;

SELECT EmailAddress FROM SalesLT.Customer
UNION ALL
SELECT EmailAddress FROM SalesLT.Customer;

-- 11.2
SELECT CustomerID FROM SalesLT.Customer
EXCEPT
SELECT CustomerID FROM SalesLT.SalesOrderHeader;

-- 11.3
SELECT CustomerID FROM SalesLT.Customer
INTERSECT
SELECT CustomerID FROM SalesLT.SalesOrderHeader;
