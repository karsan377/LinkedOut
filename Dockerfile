FROM python:3.12.12-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

# Copy requirements and install directly (no venv needed in Docker)
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire application
COPY . .

# Expose port
EXPOSE 8080

# Run the app
CMD ["python", "backend/app.py"]