/*
CONCEITO: Funções Lógicas (Logical Functions)

OBJETIVO:
Aplicar lógica condicional e booleana em consultas, retornando valores calculados
ou decisões de saída (ex: status, flags, categorias e validações).

QUANDO USAR:
- Criar colunas derivadas (ex: "Ativo/Inativo", "VIP/Normal", "Em estoque/Sem estoque")
- Normalizar dados (ex: tratar nulos, valores sentinela)
- Validar regras simples (ex: marcar inconsistências)
- Evitar erros comuns (ex: divisão por zero)
- Preparar dados para relatórios e dashboards

PRINCIPAIS ITENS (T-SQL):
1) CASE (condicional)
2) IIF (condicional simplificado)
3) CHOOSE (retorna item por índice)
4) ISNULL / COALESCE (tratamento de NULL)
5) NULLIF (retorna NULL se valores forem iguais)
6) Operadores lógicos: AND, OR, NOT (em WHERE / JOIN / CASE)

SINTAXE:

1) CASE
CASE
  WHEN condicao1 THEN resultado1
  WHEN condicao2 THEN resultado2
  ELSE resultado_padrao
END

2) IIF (atalho para CASE simples)
IIF(condicao, valor_se_verdadeiro, valor_se_falso)

3) CHOOSE (baseado em índice 1..n)
CHOOSE(indice, valor1, valor2, valor3, ...)

4) Operadores lógicos (em filtros)
WHERE condicao1 AND condicao2
WHERE condicao1 OR condicao2
WHERE NOT condicao

EXEMPLOS (com AdventureWorksLT):
*/
-- 1) CASE: classificar faixa de preço
 SELECT
   ProductID,
   ListPrice,
   CASE
     WHEN ListPrice IS NULL THEN 'Sem preço'
     WHEN ListPrice < 100 THEN 'Baixo'
     WHEN ListPrice BETWEEN 100 AND 500 THEN 'Médio'
     ELSE 'Alto'
   END AS FaixaPreco
 FROM SalesLT.Product;

-- 2) IIF: flag simples (ex: produto com preço definido)
 SELECT
   ProductID,
   IIF(ListPrice IS NULL, 0, 1) AS TemPreco
 FROM SalesLT.Product;

-- 3) CHOOSE: mapear códigos simples (ex: níveis 1..3)
 SELECT
   ProductID,
   CHOOSE(3, 'Bronze', 'Prata', 'Ouro') AS NivelExemplo
 FROM SalesLT.Product;

-- 4) Operadores lógicos no WHERE
 SELECT TOP 20 *
 FROM SalesLT.Customer
 WHERE (CompanyName IS NOT NULL AND EmailAddress IS NOT NULL)
   OR (Phone IS NOT NULL);

/*OBSERVAÇÕES IMPORTANTES:
- Em T-SQL não existe um tipo booleano “true/false” como em outras linguagens.
  Normalmente usamos 1/0, 'Sim'/'Não', ou strings de status via CASE/IIF.
- Prefira CASE quando a regra tiver mais de duas condições (mais legível).
- Use NULLIF para proteger divisões: valor / NULLIF(denominador, 0)
*/

--1. ISNUMERIC: Retornando consulta apenas onde o Tamanho do Produto � do tipo num�rico
SELECT Name, Size FROM SalesLT.Product
WHERE ISNUMERIC(Size) = 1

--2. IIF e ISNUMERIC: Verificando se um tipo primitivo � ou n�o num�rico
SELECT 
	Name AS NomeProduto, 
	Size AS TamanhoProduto,
	IIF(ISNUMERIC(Size)=1, 'Numeric', 'Non-Numeric') AS TipoTamanho
FROM SalesLT.Product