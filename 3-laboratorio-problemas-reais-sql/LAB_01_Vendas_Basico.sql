/*
LAB 01 — Análise Básica de Vendas

OBJETIVO:
Aplicar SELECT, COUNT e agregações para responder perguntas básicas de negócio.

DESAFIO:
1) Quantos pedidos existem?
2) Qual o faturamento total?
3) Qual o valor médio por pedido?

REGRAS:
- Use apenas SELECT (não altere dados)
- Trabalhe com SalesLT.SalesOrderHeader e SalesLT.SalesOrderDetail
*/

-- Escreva sua solução abaixo




/* =========================
GABARITO (Solução sugerida)
========================= */

-- 1) Quantidade de pedidos
SELECT COUNT(*) AS TotalPedidos
FROM SalesLT.SalesOrderHeader;

-- 2) Faturamento total (somando linhas do detalhe)
SELECT SUM(LineTotal) AS FaturamentoTotal
FROM SalesLT.SalesOrderDetail;

-- 3) Valor médio por pedido (total do pedido no header)
SELECT AVG(SubTotal) AS TicketMedio
FROM SalesLT.SalesOrderHeader;
