from datetime import datetime
from pydantic import BaseModel
from typing import Optional


class MessageBase(BaseModel):
    message: str

class MessageCreate(BaseModel):
    client_ip: Optional[str] = "127.0.0.1"
    message: str

class Message(BaseModel):
    id: int
    client_ip: str
    message: str
    file_path: Optional[str] = None
    file_type: Optional[str] = None
    timestamp: datetime

