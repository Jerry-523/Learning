import httpx
import os
from dotenv import load_dotenv

load_dotenv()

RT_API_URL = ""
RT_USERNAME = "guest"
RT_PASSWORD = "guest"

class RTClient:
    def __init__(self):
        self.client = httpx.Client(auth=(RT_USERNAME, RT_PASSWORD))

    def create_ticket(self, subject: str, description: str):
        payload = {
            "id": "ticket/new",
            "Content": f"Subject: {subject}\n\n{description}"
        }
        response = self.client.post(RT_API_URL, data=payload)
        response.raise_for_status()
        return response.text

    def get_ticket(self, ticket_id: int):
        response = self.client.get(f"{RT_API_URL}ticket/{ticket_id}/show")
        response.raise_for_status()
        return response.text

    def list_tickets(self):
        response = self.client.get(f"{RT_API_URL}search/ticket")
        response.raise_for_status()
        return response.text

