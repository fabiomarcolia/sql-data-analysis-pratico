/*
COMANDO: SELECT DISTINCT

OBJETIVO:
Retornar apenas valores únicos (sem duplicidade) para uma ou mais colunas.

QUANDO USAR:
- Listar categorias/valores possíveis
- Exploração de dados (EDA)
- Checagem de domínio de valores

SINTAXE:
SELECT DISTINCT coluna
FROM tabela;
*/

-- Exemplo:
-- SELECT DISTINCT CompanyName
-- FROM SalesLT.Customer;

--1. Retornar uma lista de cores �nicas da coluna Product
SELECT Color FROM SalesLT.Product;

SELECT DISTINCT COLOR, COUNT(COLOR) FROM SalesLT.Product
GROUP BY COLOR;

SELECT ISNULL(Color, 'None') FROM SalesLT.Product;
SELECT DISTINCT ISNULL(Color, 'None') AS ColorList FROM SalesLT.Product;

--2. Retornar uma lista �nica das colunas Color e Size
SELECT DISTINCT
	ISNULL(Color, 'None') AS Color,
	ISNULL(Size, '-') AS Size
FROM SalesLT.Product;

--3. Para este desafio, selecionar o DATABASE BrazilianECommerce
--Retornar uma lista de estados �nicos (seller_state)
SELECT TOP 10 * FROM BrazilianECommerce.dbo.tb_OlistECommerce_Seller;
SELECT DISTINCT seller_state FROM BrazilianECommerce.dbo.tb_OlistECommerce_Seller;

--4. Retornar uma lista �nica das colunas seller_state e seller_city ordenada por estado e cidade em modo ascendente
SELECT DISTINCT seller_state, seller_city FROM BrazilianECommerce.dbo.tb_OlistECommerce_Seller ORDER BY 1;