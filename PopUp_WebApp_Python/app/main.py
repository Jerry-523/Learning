from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from .database import Base, engine
from .routers import tickets, notifications
from .websocket_manager import manager

Base.metadata.create_all(bind=engine)

app = FastAPI(
    title="FastAPI RT Integration",
    description="Demo de integração do FastAPI com RT da BestPractical",
    version="1.0.0",
)

app.include_router(tickets.router)
app.include_router(notifications.router)

@app.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
    await manager.connect(websocket)
    try:
        while True:
            data = await websocket.receive_text()
            # Aqui você pode processar mensagens recebidas do cliente, se necessário
    except WebSocketDisconnect:
        manager.disconnect(websocket)
