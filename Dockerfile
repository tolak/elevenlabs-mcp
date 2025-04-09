FROM python:3.11-slim

WORKDIR /app

# Install system dependencies and Node.js
RUN apt-get update && apt-get install -y \
    portaudio19-dev \
    libsndfile1

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install -e ".[dev]"

# Expose the port that FastAPI will run on
EXPOSE 8000

# Run fastmcp in dev mode
CMD ["python", "-m", "elevenlabs_mcp.server"]