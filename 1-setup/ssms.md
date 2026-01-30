# Setup do Server Management Studio (SSMS)

💡SSMS = Ferramenta de para conectar no banco para realizar consultas e criar objetos: Tabelas; Campos; Views...

Este guia mostra como acessar o **Azure SQL Database (AdventureWorksLT)** usando o **SQL Server Management Studio (SSMS)**, de forma simples e sem gerar custos desnecessários.

---

## Quando usar o SSMS
Use esta opção se você:
- Está começando com SQL
- Prefere uma ferramenta tradicional de banco
- Quer focar apenas em SQL, sem ambiente de desenvolvimento

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

O endereço do servidor **não é criado por você manualmente**.  
Ele é gerado automaticamente pelo Azure quando você cria o banco.

### Passo a passo no Azure Portal

1- Acesse o **Azure Portal**
2- Vá em **SQL databases**
3- Clique no banco **AdventureWorksLT**
4- No menu lateral, clique em **Overview**
5- Copie o campo **Server name**

O formato será sempre:

```
nomedoservidor.database.windows.net
```

### Exemplo
Se no portal aparecer:

```
server-sql-estudos.database.windows.net
```

➡️ Este é exatamente o valor que você usará no SSMS.

---

## 2) Instalar o SQL Server Management Studio
Download oficial:
https://learn.microsoft.com/sql/ssms/download-sql-server-management-studio-ssms

Instale normalmente (Next → Next → Finish).

---

## 3) Conectar no Azure SQL Database

Abra o SSMS e preencha:

- **Server type:** Database Engine
- **Server name:**  
  `nomedoservidor.database.windows.net`
- **Authentication:** SQL Server Authentication
- **Login:** seu usuário
- **Password:** sua senha

Clique em **Connect**.

---

## 4) Resolver erro de Firewall (caso apareça)

Se aparecer erro informando IP bloqueado:

1- Copie o IP informado na mensagem
2- Vá ao Azure Portal
3- Acesse o **SQL Server**
4- Clique em **Networking**
5- Em **Firewall rules**, clique em:
   - *Add your client IPv4 address*
6- Salve e conecte novamente

---

## 5) Validar conexão

Execute:

```sql
SELECT TOP 10 *
FROM SalesLT.Customer;
```

Se retornar dados, a conexão está funcionando corretamente.

---

## 6) Boas práticas no SSMS
- Um exercício por query
- Execute sempre SELECT antes de UPDATE/DELETE
- Use comentários para explicar consultas
- Evite deixar conexões abertas sem uso

---

## Próximo passo
Siga para:  [Scripts do Tutorial SQL](../2-scripts-tutorial-sql-guiado)