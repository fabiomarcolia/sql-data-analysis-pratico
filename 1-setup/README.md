# Setup do Ambiente – Azure SQL + AdventureWorksLT

Este guia mostra **como criar o ambiente completo de SQL no Azure**, desde a criação do banco até a validação final, usando a base **AdventureWorksLT**.

O foco aqui é **estudo e prática**, com **custo zero ou mínimo**, evitando cobranças desnecessárias no Azure.

---

## O que você terá ao final
- Um Azure SQL Database ativo
- Base AdventureWorksLT pronta para uso
- Acesso via SSMS ou VS Code
- Ambiente validado para scripts, problemas reais e laboratórios
- Ambiente configurado para **não gerar custos inesperados**

---

## ⚠️ Aviso importante sobre custos
Azure **cobra por tempo de uso**, não apenas por uso ativo.

➡️ **Sempre exclua ou reduza recursos quando não estiver estudando.**

---

## Visão geral do processo

1- Criar o Azure SQL Database  
2- Configurar plano com menor custo possível  
3- Criar o banco AdventureWorksLT (Sample)  
4- Configurar firewall  
5- Conectar via SSMS ou VS Code  
6- Validar ambiente  
7- Excluir recursos para zerar custos  

---

## Pré-requisitos
- Conta ativa no Microsoft Azure
- Acesso ao Azure Portal
- Navegador atualizado

Ferramentas locais (gratuitas):
- SQL Server Management Studio **ou**
- Visual Studio Code + extensão SQL

---

## 1) Criar o Azure SQL Database (modo econômico)

### Passo 1 – Criar o banco
No Azure Portal: https://azure.microsoft.com/pt-br/get-started/azure-portal

1- Clique em **Create a resource**  
2- Selecione **Azure SQL**  
3- Clique em **Create**  
4- Em *SQL databases*, escolha **Single database**  

Preencha:
- **Database name:** AdventureWorksLT  
- **Server:** Create new  
- **Authentication:** SQL Authentication  

---

### Passo 2 – Configuração crítica de custo (MUITO IMPORTANTE)

Na etapa **Compute + storage**, configure:

- **Compute tier:** General Purpose  
- **Service tier:** Basic ou o mais baixo disponível  
- **DTUs / vCores:** mínimo possível  
- **Backup storage redundancy:** Local  

❌ Evite Premium ou Business Critical.

---

### Passo 3 – Usar base de exemplo (gratuito)
Em **Additional settings**:

- **Use existing data:** Sample  
- **Sample schema:** AdventureWorksLT  

✔️ Evita restore manual e custos extras.

---

### Passo 4 – Criar o banco
- Clique em **Review + Create**
- Clique em **Create**
- Aguarde a criação

---

## 2) Configurar Firewall (sem custo)

1- Acesse o **SQL Server**
2- Vá em **Networking**
3- Em **Firewall rules**:
   - Clique em **Add your client IPv4 address**
4- Salve

✔️ Firewall não gera custo.

---

## 3) Opção alternativa: Restore manual (apenas para conhecimento) - Pule para etapa 4

⚠️ Pode gerar custo adicional (Blob Storage + tempo de uso).

Download:
https://github.com/microsoft/sql-server-samples/releases/tag/adventureworks

Arquivo:
- AdventureWorksLT.bak

Exemplo de restore:

```sql
CREATE DATABASE SCOPED CREDENTIAL AzureBlobCredential
WITH IDENTITY = 'Shared Access Signature',
SECRET = 'SEU_SAS_TOKEN_AQUI';
```

```sql
RESTORE DATABASE AdventureWorksLT
FROM URL = 'https://<storage>.blob.core.windows.net/<container>/AdventureWorksLT.bak'
WITH CREDENTIAL = 'AzureBlobCredential';
```

➡️ Exclua o Blob Storage após o restore.

---

## 4) Conectar no banco

- SQL Server Management Studio: veja  → [ssms.md](ssms.md)
- Visual Studio Code + SQL: veja → [vscode.md](vscode.md)

---

## 5) Validar ambiente

```sql
SELECT COUNT(*) AS TotalClientes
FROM SalesLT.Customer;
```

Se retornar valor maior que zero, ambiente pronto.

---

## 6) Dicas práticas para NÃO gerar custo

### Durante o estudo
- Use apenas SELECT
- Evite cargas, loops e transações longas
- Feche conexões quando terminar

### Quando não estiver usando
- Exclua o banco se não for usar por dias
- Ou reduza o plano para o mínimo

### Evite
- Elastic Pool
- Replicação
- Geo-redundância
- Manter banco ativo sem uso

---

## 7) Como zerar custos completamente

1- Vá ao **Resource Group**
2- Clique em **Delete resource group**
3- Confirme

✔️ Remove banco, servidor e backups.

---

## Próximo passo
Siga para:  [Scripts do Tutorial SQL](../2-scripts-tutorial-sql-guiado)

---

⚠️ **No Azure, recurso parado ainda custa. Recurso excluído custa zero.**
