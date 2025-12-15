# Use a supported base image
FROM python:3.10-slim-bookworm

# Install dependencies
RUN apt-get update && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first (better caching)
COPY requirements.txt /requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -U pip \
    && pip install --no-cache-dir -r /requirements.txt

# Set working directory
WORKDIR /VJ-FILTER-BOT

# Copy all project files
COPY . .

# Set a valid user ID
USER 10001

# Run your bot
CMD ["python", "bot.py"]



