from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from .. import schemas, crud, rt_client, websocket_manager
from ..database import get_db

router = APIRouter(
    prefix="/tickets",
    tags=["tickets"],
)

rt = rt_client.RTClient()

@router.post("/", response_model=schemas.Ticket)
def create_ticket(ticket: schemas.Ticket, db: Session = Depends(get_db)):
    try:
        rt_response = rt.create_ticket(ticket.title, ticket.description)
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))
    
    # Crie uma notificação
    notification = crud.create_notification(db, schemas.NotificationCreate(message=f"Novo ticket criado: {ticket.title}"))
    
    # Envie a notificação via WebSocket
    import asyncio
    asyncio.create_task(websocket_manager.manager.broadcast(f"Novo ticket criado: {ticket.title}"))

    return ticket

@router.get("/", response_model=list[schemas.Ticket])
def read_tickets(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    # Aqui você pode implementar a lógica para buscar tickets do RT
    tickets = []  # Placeholder
    return tickets
