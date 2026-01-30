/*
LAB 09 — Uso de transações

OBJETIVO:
Praticar o uso seguro de TRANSACTIONS.

DESAFIO:
- Simule uma atualização protegida por transação.
- Use ROLLBACK para testar sem alterar dados permanentemente.

DICAS:
- BEGIN TRANSACTION
- COMMIT / ROLLBACK
- Sempre valide com SELECT antes de COMMIT
*/

-- Escreva sua solução abaixo




/* =========================
GABARITO (Solução sugerida)
========================= */

-- ⚠️ Recomendação: execute como teste com ROLLBACK

BEGIN TRANSACTION;

  -- Exemplo: aumento de 1% no ListPrice para uma categoria específica (ajuste se quiser)
  UPDATE SalesLT.Product
  SET ListPrice = ListPrice * 1.01
  WHERE ProductCategoryID = 1;

  -- Valide o efeito antes de confirmar
  SELECT TOP 20 ProductID, Name, ListPrice, ProductCategoryID
  FROM SalesLT.Product
  WHERE ProductCategoryID = 1
  ORDER BY ProductID;

-- COMMIT;   -- use apenas se quiser manter a alteração
ROLLBACK;   -- recomendado para laboratório (não altera permanentemente)
