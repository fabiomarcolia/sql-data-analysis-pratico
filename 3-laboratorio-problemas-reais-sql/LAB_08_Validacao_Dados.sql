/*
LAB 08 — Validação de dados

OBJETIVO:
Encontrar inconsistências nos dados.

DESAFIO:
1) Identifique clientes com campos críticos nulos.
2) Crie uma flag de validação.

DICAS:
- Use SalesLT.Customer
- Campos candidatos: EmailAddress, FirstName, LastName
- CASE para flag
*/

-- Escreva sua solução abaixo




/* =========================
GABARITO (Solução sugerida)
========================= */

-- 1) Quantidade de clientes com campos críticos nulos
SELECT
  SUM(CASE WHEN EmailAddress IS NULL THEN 1 ELSE 0 END) AS EmailNulo,
  SUM(CASE WHEN FirstName IS NULL THEN 1 ELSE 0 END) AS FirstNameNulo,
  SUM(CASE WHEN LastName IS NULL THEN 1 ELSE 0 END) AS LastNameNulo
FROM SalesLT.Customer;

-- 2) Lista com flag
SELECT TOP 50
  CustomerID,
  FirstName,
  LastName,
  EmailAddress,
  CASE
    WHEN EmailAddress IS NULL OR FirstName IS NULL OR LastName IS NULL THEN 'Inconsistente'
    ELSE 'OK'
  END AS StatusValidacao
FROM SalesLT.Customer
ORDER BY CustomerID;
