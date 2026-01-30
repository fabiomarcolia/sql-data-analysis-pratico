# Setup do VSCode + SQL Azure

Este guia mostra como trabalhar com **Azure SQL Database** usando o **Visual Studio Code (VS Code)**.

---

## Quando usar o VS Code
Use esta opção se você:
- Quer versionar scripts SQL
- Usa Git/GitHub
- Trabalha SQL como código

---

## Pré-requisitos
- Azure SQL Database criado
- Base AdventureWorksLT disponível
- Usuário e senha SQL
- Firewall liberado para seu IP

Se ainda não criou o banco:
→ volte para [Setup Ambiente Azure SQL](./README.md)

---

## 1) Como descobrir o endereço do servidor SQL no Azure

O endereço do servidor é criado automaticamente pelo Azure.

### Passo a passo no Azure Portal

1- Acesse o **Azure Portal**
2- Vá em **SQL databases**
3- Clique no banco **AdventureWorksLT**
4- No menu lateral, clique em **Overview**
5- Copie o campo **Server name**

Formato padrão:

```
nomedoservidor.database.windows.net
```

Este valor será usado no VS Code.

---

## 2) Instalar o Visual Studio Code
Download:
https://code.visualstudio.com/

---

## 3) Instalar a extensão SQL
No VS Code:
1- Abra Extensions (`Ctrl + Shift + X`)
2- Procure por **SQL Server (Microsoft)**
3- Instale a extensão oficial

---

## 4) Criar conexão com o Azure SQL

1- Pressione `Ctrl + Shift + P`
2- Digite: **MS SQL: Connect**
3- Preencha:
   - **Server:** `nomedoservidor.database.windows.net`
   - **Database:** AdventureWorksLT
   - **Authentication:** SQL Login
   - **User:** seu usuário
   - **Password:** sua senha
4- Salve a conexão

No rodapé do VS Code você verá a conexão ativa.

---

## 5) Executar scripts SQL

- Abra qualquer arquivo `.sql`
- Selecione a conexão no rodapé
- Execute:
  - `Ctrl + Shift + E` (seleção)
  - ou botão ▶ Run Query

---

## 6) Validar ambiente

```sql
SELECT COUNT(*) AS TotalPedidos
FROM SalesLT.SalesOrderHeader;
```

Se retornar valor maior que zero, o ambiente está pronto.

---

## 7) Boas práticas no VS Code
- Um arquivo `.sql` por conceito
- Use comentários explicando consultas
- Versione tudo com Git
- Evite queries longas sem necessidade

---

## Próximo passo
Siga para:  [Scripts do Tutorial SQL](../2-scripts-tutorial-sql-guiado)
