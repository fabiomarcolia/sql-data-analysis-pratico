/*
COMANDO: ORDER BY

OBJETIVO:
Ordenar o resultado de uma consulta (ASC/DESC).

QUANDO USAR:
- Relatórios
- Rankings
- Análises com ordenação por data/valor

SINTAXE:
SELECT *
FROM tabela
ORDER BY coluna ASC | DESC;
*/

-- Exemplo:
-- SELECT TOP 10 FirstName, LastName
-- FROM SalesLT.Customer
-- ORDER BY LastName ASC, FirstName ASC;

----------------------------------------------------------------
/*
COMANDO: CASE

OBJETIVO:
Criar lógica condicional dentro de consultas SQL, retornando valores diferentes
de acordo com condições definidas.

QUANDO USAR:
- Criar classificações (ex: status, faixas, categorias)
- Substituir IF/ELSE em SELECT
- Regras de negócio em relatórios

SINTAXE:
CASE
  WHEN condicao1 THEN resultado1
  WHEN condicao2 THEN resultado2
  ELSE resultado_padrao
END

OBSERVAÇÃO:
CASE não altera dados, apenas define valores de saída.
*/

-- Exemplo:
-- SELECT
--   ProductID,
--   ListPrice,
--   CASE
--     WHEN ListPrice < 100 THEN 'Baixo'
--     WHEN ListPrice BETWEEN 100 AND 500 THEN 'Médio'
--     ELSE 'Alto'
--   END AS FaixaPreco
-- FROM SalesLT.Product;

----------------------------------------------------------------
--1. Retornar a coluna StatusVenda que receber� a string 'On Sale' caso o atributo SellEndDate seja nulo. 
--Caso contr�rio, essa coluna receber� a string 'Discontinued'
SELECT 
	Name,
	SellEndDate,
	CASE
		WHEN SellEndDate IS NULL THEN 'On Sale'
		ELSE 'Discontinued'
	END AS SalesStatus
FROM SalesLT.Product

--2. Retornar a coluna ProductSize com as condi��es envolvendo o atributo Size:
--('S'='Small'), ('M'='Medium'), ('L'='Large'), ('XL'='Extra-Large')
--Se Size for nulo, retornar 'n/a'
SELECT
	Name,
	Size,
	CASE Size
		WHEN 'S' THEN 'Small'
		WHEN 'M' THEN 'Medium'
		WHEN 'L' THEN 'Large'
		WHEN 'XL' THEN 'Extra-Large'
		ELSE ISNULL(Size, 'n/a')
	END AS ProductSize
FROM SalesLT.Product

--3. Para este desafio, selecionar o DATABASE BrazilianECommerce
--Retornar a coluna TipoVenda da tabela tb_Olist_ECommerce_Seller com o 
--nome e o estado onde ocorreu a venda, indicando se trata-se de uma venda local 
--(vendas realizadas no estado de S�o Paulo) ou uma venda externa (fora do estado de S�o Paulo)
SELECT TOP 10 * FROM BrazilianECommerce.dbo.tb_OlistECommerce_Seller;

SELECT 
	seller_state AS EstadoVenda,
	CASE seller_state
		WHEN 'SP' THEN 'Venda Local'
		ELSE 'Fora do Estado'
	END AS TipoVenda
FROM BrazilianECommerce.dbo.tb_OlistECommerce_Seller

SELECT seller_city, seller_state,
	CASE seller_state
		WHEN 'SP' THEN 'Sudeste'
		WHEN 'RJ' THEN 'Sudeste'
		ELSE 'Venda Externa'
	END AS ModalidadeVenda
FROM BrazilianECommerce.dbo.tb_OlistECommerce_Seller;

--4. Adicionar coluna RegiaoVenda � query anterior, indicando 
--'Sudeste' para vendas nos estados do Sudeste ou 'Fora do Sudeste' para os 
--demais
SELECT seller_city, seller_state,
	CASE seller_state
		WHEN 'SP' THEN 'Venda Local'
		ELSE 'Venda Externa'
	END AS ModalidadeVenda,
	CASE 
		WHEN seller_state IN ('SP', 'MG', 'RJ', 'ES') THEN 'Sudeste'
		ELSE 'Fora do Sudeste'
	END AS RegiaoVenda
FROM BrazilianECommerce.dbo.tb_OlistECommerce_Seller;

--5. Ordenar a consulta anterior pela coluna seller_city
SELECT seller_city, seller_state,
	CASE seller_state
		WHEN 'SP' THEN 'Venda Local'
		ELSE 'Venda Externa'
	END AS ModalidadeVenda,
	CASE 
		WHEN seller_state IN ('SP', 'MG', 'RJ', 'ES') THEN 'Sudeste'
		ELSE 'Fora do Sudeste'
	END AS RegiaoVenda
FROM BrazilianECommerce.dbo.tb_OlistECommerce_Seller
ORDER BY 1;

--6. Ordenar a consulta anterior por Estado da Venda em modo descendente e Cidade da Venda em modo ascendente
SELECT seller_city, seller_state,
	CASE seller_state
		WHEN 'SP' THEN 'Venda Local'
		ELSE 'Venda Externa'
	END AS ModalidadeVenda,
	CASE 
		WHEN seller_state IN ('SP', 'MG', 'RJ', 'ES') THEN 'Sudeste'
		ELSE 'Fora do Sudeste'
	END AS RegiaoVenda
FROM BrazilianECommerce.dbo.tb_OlistECommerce_Seller
ORDER BY seller_state DESC, seller_city ASC;

