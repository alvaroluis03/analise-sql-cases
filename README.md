# 📊 Portfólio de Análise de Dados com SQL: Resolução de Casos de Negócio

Bem-vindo ao meu repositório de estudos e aplicações práticas em **SQL** voltadas para **Análise de Dados**. 

Aqui reuni três projetos práticos modelando cenários reais de mercado (**Streaming de Música**, **Cafeteria** e **E-commerce**). Cada cenário simula um banco de dados relacional com criação de tabelas, inserção de dados e consultas formuladas para responder a perguntas estratégicas de negócio.

---

## 🎯 Objetivo do Repositório

Demonstrar a aplicação de consultas SQL estruturadas para extração de indicadores-chave (KPIs), agrupamento de métricas e suporte à tomada de decisão utilizando:
* **Junção de tabelas:** `INNER JOIN` / `JOIN` com integridade relacional.
* **Funções de agregação:** `SUM()`, `AVG()`, `COUNT()`.
* **Agrupamento e filtros analíticos:** `GROUP BY`, `WHERE` e `HAVING`.
* **Ordenação e fatiamento:** `ORDER BY` (`ASC` / `DESC`) e `LIMIT`.

---

## 📂 Estrutura dos Projetos

### 🎧 1. Plataforma de Streaming de Música
* **Contexto:** Análise de engajamento de ouvintes, popularidade de artistas e consumo de faixas.
* **Tabelas:** `artistas` e `musicas`.
* **Perguntas de Negócio:**
  1. *Total de reproduções e duração média das músicas da plataforma.*
  2. *Top 3 artistas mais ouvidos em volume total de streams.*
  3. *Média de duração superior a 200 segundos considerando apenas músicas do Brasil.*

---

### ☕ 2. Gestão de Cafeteria & Vendas
* **Contexto:** Análise de saída de produtos, receita por categoria e monitoramento de ticket médio por pedido.
* **Tabelas:** `produtos` e `itens_pedido`.
* **Perguntas de Negócio:**
  1. *Identificação do produto campeão de vendas em volume unitário.*
  2. *Faturamento total gerado por categoria de produto (Bebidas, Salgados, Doces).*
  3. *Filtragem de pedidos com ticket elevado (faturamento do pedido > R$ 50,00).*

---

### 🛍️ 3. E-commerce & Logística
* **Contexto:** Eficiência logística, monitoramento do funil de entregas e mapeamento de clientes de alto valor.
* **Tabelas:** `clientes` e `pedidos`.
* **Perguntas de Negócio:**
  1. *Volume total de pedidos distribuído por status de entrega (Entregue, Cancelado, etc.).*
  2. *Identificação dos 3 maiores clientes VIP por estado considerando pedidos efetivamente entregues.*
  3. *Mapeamento de estados estratégicos com faturamento acumulado superior a R$ 10.000,00.*

---

## 💻 Como Executar

1. Clone este repositório:
   ```bash
   git clone https://github.com/SEU-USUARIO/sql-data-analysis-cases.git
   ```
2. Abra qualquer SGBD compatível com SQL (PostgreSQL, MySQL, SQLite, DBeaver ou ambientes online como SQLiteOnline/DB Fiddle).
3. Execute os scripts disponíveis no arquivo `queries.sql`.

---

## 📬 Contato

* **LinkedIn:** Alvaro Santos (www.linkedin.com/in/alvaro-luis-4b0581235)
