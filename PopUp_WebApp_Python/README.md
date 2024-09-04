
---

## **Descrição**
Este projeto é uma aplicação web construída com FastAPI, que integra com o sistema de gerenciamento de tickets Request Tracker (RT) da BestPractical. A aplicação permite a criação e visualização de tickets, além de enviar notificações em tempo real via WebSockets para os clientes conectados quando novos tickets são criados.

## **Funcionalidades**
- **Gerenciamento de Tickets**: Criação de novos tickets e listagem de tickets existentes.
- **Notificações em Tempo Real**: Envio de notificações via WebSocket quando um novo ticket é criado.
- **API REST**: Interface amigável para interagir com a API REST do RT.

## **Estrutura do Projeto**

```plaintext
fastapi-rt-integration/
├── app/
│   ├── __init__.py
│   ├── main.py
│   ├── models.py
│   ├── schemas.py
│   ├── crud.py
│   ├── database.py
│   ├── rt_client.py
│   ├── websocket_manager.py
│   └── routers/
│       ├── __init__.py
│       ├── tickets.py
│       └── notifications.py
├── tests/
│   └── test_main.py
├── requirements.txt
└── README.md
```

### **Componentes Principais**

- **app/main.py**: Ponto de entrada da aplicação, define e inicializa a instância FastAPI.
- **app/models.py**: Modelos SQLAlchemy que definem as tabelas do banco de dados.
- **app/schemas.py**: Esquemas Pydantic para validação e serialização de dados.
- **app/crud.py**: Funções CRUD (Create, Read, Update, Delete) para interagir com o banco de dados.
- **app/database.py**: Configuração da conexão com o banco de dados usando SQLAlchemy.
- **app/rt_client.py**: Cliente HTTP para interagir com a API REST do RT.
- **app/websocket_manager.py**: Gerencia as conexões WebSocket para notificações.
- **app/routers/**: Contém os routers que organizam as rotas por funcionalidade (tickets, notificações).
- **tests/test_main.py**: Testes básicos para validar as funcionalidades principais.

## **Configuração do Projeto**

### **Pré-requisitos**
- **Python 3.8+**
- **Virtualenv** (recomendado)

### **Instalação**
1. **Clone o Repositório**:

   ```bash
   git clone https://github.com/seu-usuario/fastapi-rt-integration.git
   cd fastapi-rt-integration
   ```

2. **Crie e Ative um Ambiente Virtual**:

   ```bash
   python3 -m venv venv
   source venv/bin/activate  # Para Linux/Mac
   # venv\Scripts\activate  # Para Windows
   ```

3. **Instale as Dependências**:

   ```bash
   pip install -r requirements.txt
   ```

4. **Configure as Variáveis de Ambiente**:
   Crie um arquivo `.env` na raiz do projeto e adicione as variáveis de ambiente necessárias:

   ```plaintext
   DATABASE_URL=sqlite:///./test.db
   RT_API_URL=https://your-rt-instance.com/REST/1.0/
   RT_USERNAME=your_username
   RT_PASSWORD=your_password
   ```

### **Executando a Aplicação**
Para iniciar a aplicação, execute o seguinte comando:

```bash
uvicorn app.main:app --reload
```

A aplicação estará disponível em `http://localhost:8000`.

### **Rotas Disponíveis**

#### **Tickets**
- **Criar Ticket**
  - **POST /tickets/**
  - **Corpo**: 
    ```json
    {
      "title": "Problema no Login",
      "description": "Usuário não consegue fazer login no sistema."
    }
    ```
  - **Resposta**:
    ```json
    {
      "id": 1,
      "title": "Problema no Login",
      "description": "Usuário não consegue fazer login no sistema.",
      "status": "aberto",
      "created_at": "2024-09-04T12:00:00"
    }
    ```

- **Listar Tickets**
  - **GET /tickets/**

#### **Notificações**
- **Listar Notificações**
  - **GET /notifications/**

- **Receber Notificações em Tempo Real**
  - Conecte-se ao WebSocket em `ws://localhost:8000/ws` para receber notificações em tempo real quando novos tickets forem criados.

### **Testes**
Para executar os testes, utilize o comando:

```bash
pytest
```

### **Funcionamento**
1. **Criação de Tickets**:
   Quando um novo ticket é criado via API, o ticket é enviado para o RT através do cliente HTTP configurado em `app/rt_client.py`. Uma notificação é criada e armazenada no banco de dados, e essa notificação é transmitida para todos os clientes conectados via WebSocket.

2. **Notificações em Tempo Real**:
   As notificações são gerenciadas por `app/websocket_manager.py`, que lida com as conexões WebSocket e transmite mensagens a todos os clientes conectados.


---


