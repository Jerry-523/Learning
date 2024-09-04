from sqlalchemy.orm import Session
from . import models, schemas

def create_notification(db: Session, notification: schemas.NotificationCreate):
    db_notification = models.Notification(message=notification.message)
    db.add(db_notification)
    db.commit()
    db.refresh(db_notification)
    return db_notification

def get_notifications(db: Session, skip: int = 0, limit: int = 10):
    return db.query(models.Notification).offset(skip).limit(limit).all()
