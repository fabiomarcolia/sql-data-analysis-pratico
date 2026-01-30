/*
COMANDO: SELECT

OBJETIVO:
Selecionar e visualizar dados de uma ou mais colunas de uma tabela.

QUANDO USAR:
- Explorar dados
- Criar relatórios
- Analisar informações

SINTAXE:
SELECT coluna1, coluna2
FROM tabela;
*/

--O comando SELECT que indica os campos a serem retornados. Depois a tabela ou tabelas, filtro(where), agrupamento(Group by) e classifica��o(Order By)

--1. Selecione todos os dados da tabela SalesLT.Product
SELECT * FROM SalesLT.Product;

--2. Selecione apenas as colunas ProductNumber, Color, ListPrice, StandardCost e Size da tabela SalesLT.Product
SELECT ProductNumber, Color, ListPrice, StandardCost, Size FROM SalesLT.Product;

--3. Selecione as mesmas colunas do item 2, por�m com um c�lculo de subtra��o entre ListPrice e StandardCost
--d� um "allias" a essa coluna: Margin
SELECT ProductNumber, Color, (ListPrice-StandardCost) AS Margin, Size FROM SalesLT.Product

