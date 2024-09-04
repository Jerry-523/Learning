from sqlalchemy import Column, Integer, String, Boolean, DateTime
from .database import Base
import datetime

class Notification(Base):
    __tablename__ = 'notifications'
    id = Column(Integer, primary_key=True, index=True)
    message = Column(String, index=True)
    read = Column(Boolean, default=False)
    created_at = Column(DateTime, default=datetime.datetime.utcnow)
