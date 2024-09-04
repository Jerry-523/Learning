Interagindo com a API
1. Criar um Novo Ticket

Endpoint: POST /tickets/

Payload:

json

{
    "id": 1,
    "title": "Problema no Login",
    "description": "Usuário não consegue fazer login no sistema.",
    "status": "aberto",
    "created_at": "2024-09-04T12:00:00"
}

Resposta:

json

{
    "id": 1,
    "title": "Problema no Login",
    "description": "Usuário não consegue fazer login no sistema.",
    "status": "aberto",
    "created_at": "2024-09-04T12:00:00"
}

Ao criar um ticket, uma notificação será enviada via WebSocket para todos os clientes conectados e armazenada no banco de dados.
2. Obter Notificações

Endpoint: GET /notifications/

Resposta:

json

[
    {
        "id": 1,
        "message": "Novo ticket criado: Problema no Login",
        "read": false,
        "created_at": "2024-09-04T12:00:00"
    }
]

Frontend para Receber Notificações

Para receber notificações em tempo real no frontend, você pode utilizar JavaScript para se conectar ao WebSocket.

html

<!DOCTYPE html>
<html>
<head>
    <title>Notificações em Tempo Real</title>
</head>
<body>
    <h1>Notificações</h1>
    <ul id="notifications"></ul>

    <script>
        const ws = new WebSocket("ws://localhost:8000/ws");

        ws.onmessage = function(event) {
            const notificationsList = document.getElementById("notifications");
            const newNotification = document.createElement("li");
            newNotification.textContent = event.data;
            notificationsList.appendChild(newNotification);
        };

        ws.onopen = function() {
            console.log("Conectado ao WebSocket para receber notificações.");
        };

        ws.onclose = function() {
            console.log("Desconectado do WebSocket.");
        };
    </script>
</body>
</html>

