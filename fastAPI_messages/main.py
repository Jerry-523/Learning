from fastapi import FastAPI, Depends, HTTPException, File, UploadFile
from sqlalchemy.orm import Session
import schemas
import models
from database import engine, SessionLocal
from fastapi.responses import JSONResponse, FileResponse
import shutil
from datetime import datetime


app = FastAPI()

# Criar o banco de dados
models.Base.metadata.create_all(bind=engine)

# Dependência para obter a sessão do banco de dados
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.post("/messages", response_model=schemas.Message)
def create_message(message: schemas.MessageCreate, db: Session = Depends(get_db)):
    db_message = models.Message(
        client_ip=message.client_ip,
        message=message.message,
        timestamp=datetime.utcnow()  # Supondo que você queira definir a data/hora atual
    )
    db.add(db_message)
    db.commit()
    db.refresh(db_message)
    return db_message

@app.post("/messages")
def create_message(message: schemas.MessageCreate, db: Session = Depends(get_db)):
    db_message = models.Message(
        client_ip=message.client_ip, 
        message=message.message
    )
    db.add(db_message)
    db.commit()
    db.refresh(db_message)
    return db_message

@app.get("/messages")
def read_messages(db: Session = Depends(get_db)):
    return db.query(models.Message).all()

@app.post("/upload")
async def upload_file(file: UploadFile = File(...)):
    with open(f"uploads/{file.filename}", "wb") as buffer:
        buffer.write(file.file.read())
    return {"filename": file.filename}


@app.get("/")
async def read_root():
    return FileResponse('public/index.html')

