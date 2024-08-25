from sqlalchemy import Column, Integer, String, DateTime, func
from sqlalchemy.ext.declarative import declarative_base
from datetime import datetime


Base = declarative_base()

class Message(Base):
    __tablename__ = "messages"

    id = Column(Integer, primary_key=True, index=True)
    client_ip = Column(String, index=True)
    message = Column(String, index=True)
    file_path = Column(String, nullable=True)
    file_type = Column(String, nullable=True)
    timestamp = Column(DateTime, default=datetime.utcnow)