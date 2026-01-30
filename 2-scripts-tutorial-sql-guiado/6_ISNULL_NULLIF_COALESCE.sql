/*
COMANDOS: ISNULL / COALESCE

OBJETIVO:
Substituir valores NULL por um valor padrão.

QUANDO USAR:
- Relatórios sem "vazio"
- Cálculos (evitar NULL propagando)
- Padronização de saída

SINTAXE:
ISNULL(expressao, valor_padrao)
COALESCE(expr1, expr2, ..., valor_padrao)

Diferença prática:
- COALESCE pode avaliar múltiplas expressões (primeira não-NULL).
*/

-- Exemplo:
-- SELECT ISNULL(CompanyName, 'Sem empresa') AS CompanyName
-- FROM SalesLT.Customer;



--1. Troque os valores nulos da convers�o da coluna Size para Integer da tabela Product com TRY_CAST por 0
SELECT ProductNumber, ISNULL(TRY_CAST(Size AS Integer), 0) AS NumericSize FROM SalesLT.Product;

--2. Retorne as colunas ProductNumber, Concatena��o entre Color e Size com "allias" ProductDetails
SELECT ProductNumber, Color, Size FROM SalesLT.Product;
SELECT ProductNumber, Color, Size, (Color + ', ' + Size) AS ProductDetails FROM SalesLT.Product;
SELECT 
	ProductNumber, Color, Size, 
	(Color + ', ' + Size) AS ProductDetails,
	ISNULL(Color, '') + ', ' + ISNULL(Size, '') AS ProductDetails2
FROM SalesLT.Product

--3. Retornar ProductNumber e Color, por�m com valor NULO em Color se Color='Multi'
SELECT ProductNumber, Color, NULLIF(Color, 'Multi') AS NonMultiColor FROM SalesLT.Product;

--4. Escolhendo o primeiro dado n�o nulo com COALESCE
SELECT Name, COALESCE(DiscontinuedDate, SellEndDate, SellStartDate) AS FirstNonNullDate
FROM SalesLT.Product;


/*
COMANDO: NULLIF

OBJETIVO:
Retornar NULL se dois valores forem iguais; caso contrário, retorna o primeiro.

QUANDO USAR:
- Evitar divisão por zero (NULLIF(denominador, 0))
- Normalizar valores sentinela (ex: 0 virar NULL)

SINTAXE:
NULLIF(valor1, valor2)

Exemplo:
SELECT 10 / NULLIF(0, 0); -- retorna NULL (evita erro)
*/

-- Exemplo:
SELECT (ListPrice / NULLIF(StandardCost, 0)) AS Markup
FROM SalesLT.Product;

