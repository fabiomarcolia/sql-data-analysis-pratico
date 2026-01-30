/*
COMANDO: WHERE

OBJETIVO:
Filtrar linhas com base em condições.

QUANDO USAR:
- Restringir resultados
- Aplicar regras de negócio
- Buscar registros específicos

SINTAXE:
SELECT *
FROM tabela
WHERE condição;
*/

-- Exemplo:
-- SELECT TOP 10 *
-- FROM SalesLT.Customer
-- WHERE LastName = 'Smith';

SELECT TOP 100 ProductNumber FROM SalesLT.Product
--1. Selecionar apenas produtos cuja coluna ProductModelID seja igual a 6
SELECT ProductNumber, ProductModelID FROM SalesLT.Product
WHERE ProductModelID = 6;

--2. Selecionar apenas produtos cuja coluna ProductNumber inicia com "FR"
SELECT ProductNumber FROM SalesLT.Product
WHERE ProductNumber LIKE '%58';

'FR-R92B-58'

--3. Selecionar apenas produtos que tenham um set de 4 n�meros (sem letras) ap�s o prefixo "XX-"
SELECT ProductNumber FROM SalesLT.Product
WHERE ProductNumber LIKE '%[0-9][0-9][0-9][0-9]';

--4. Para este desafio, selecionar o DATABASE BrazilianECommerce
--Selecionar apenas cidade do estado do cear� (seller_state='CE')
SELECT TOP 10 * 
FROM BrazilianECommerce.dbo.tb_OlistECommerce_Seller;

SELECT seller_city, seller_state 
FROM BrazilianECommerce.dbo.tb_OlistECommerce_Seller
WHERE seller_state = 'CE';

--5. Selecionar todas as cidades �nicas que comecem com a letra 
--"P"
SELECT TOP 10 seller_city 
FROM BrazilianECommerce.dbo.tb_OlistECommerce_Seller

SELECT DISTINCT seller_city
FROM BrazilianECommerce.dbo.tb_OlistECommerce_Seller
WHERE seller_city LIKE 'P%'

SELECT DISTINCT seller_city, seller_state FROM BrazilianECommerce.dbo.tb_OlistECommerce_Seller
WHERE seller_city LIKE 'P%' ORDER BY 1 DESC

--6. Selecionar todas as cidades �nicas que iniciem com "S�o" ou "Santo"

SELECT DISTINCT seller_city, seller_state 
FROM BrazilianECommerce.dbo.tb_OlistECommerce_Seller
WHERE seller_city LIKE 'sao%' OR seller_city LIKE '%santo' 
ORDER BY 1 DESC
