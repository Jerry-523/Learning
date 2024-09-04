
---

# Ticket Change Detection API

This FastAPI-based application is designed to detect changes in ticket properties, such as priority, assignee, or status, by comparing the current state of a ticket with its previously stored state.

## Features

- **Detect Changes:** Compares the current state of a ticket against the previously stored state to detect changes.
- **Track Ticket Properties:** Monitors properties like `Priority`, `Assignee`, `Status`, and others.
- **RESTful API:** Provides an easy-to-use API endpoint for checking changes in a specific ticket.
- **State Persistence:** (Simulated with an in-memory database for demonstration) Maintains the previous state of tickets for accurate change detection.

## Installation

### Prerequisites

- Python 3.8 or higher
- `pip` (Python package installer)
- `virtualenv` (optional but recommended for creating a virtual environment)

### Step-by-Step Guide

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/your-username/ticket-change-detection.git
   cd ticket-change-detection
   ```

2. **Create a Virtual Environment (Optional but Recommended):**

   ```bash
   python3 -m venv env
   source env/bin/activate  # On Windows use `env\Scripts\activate`
   ```

3. **Install Dependencies:**

   ```bash
   pip install -r requirements.txt
   ```

4. **Run the Application:**

   ```bash
   uvicorn app.main:app --reload
   ```

5. **Access the API:**

   The API will be available at `http://127.0.0.1:8000`.

## API Endpoints

### 1. Check for Changes in a Ticket

   **Endpoint:** `GET /ticket/{ticket_id}/check_changes`

   **Description:** Checks for any changes in the specified ticket's properties compared to its previously stored state.

   **Parameters:**

   - `ticket_id` (int): The ID of the ticket to check.

   **Response:**

   - `200 OK`: Returns a JSON object with details of the changes detected.
   - `404 Not Found`: If the ticket does not exist or cannot be retrieved.
   - `500 Internal Server Error`: If an unexpected error occurs.

   **Example:**

   ```bash
   curl -X GET "http://127.0.0.1:8000/ticket/12345/check_changes"
   ```

   **Response Example:**

   ```json
   {
     "ticket_id": 12345,
     "changes": {
       "priority": {
         "old": "Low",
         "new": "High"
       },
       "assignee": {
         "old": "User A",
         "new": "User B"
       }
     }
   }
   ```

## Configuration

### Environment Variables

- `RT_API_URL`: Base URL of the Request Tracker API.
- `RT_USERNAME`: Username for authenticating with the RT API.
- `RT_PASSWORD`: Password for authenticating with the RT API.

These should be set in your environment or in a `.env` file for the application to function correctly.

## Testing

To run tests use the following command:

```bash
pytest

