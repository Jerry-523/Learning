from pydantic import BaseModel
from datetime import datetime

class NotificationBase(BaseModel):
    message: str

class NotificationCreate(NotificationBase):
    pass

class Notification(NotificationBase):
    id: int
    read: bool
    created_at: datetime

    class Config:
        orm_mode = True

class Ticket(BaseModel):
    id: int
    title: str
    description: str
    status: str
    created_at: datetime

    class Config:
        orm_mode = True
