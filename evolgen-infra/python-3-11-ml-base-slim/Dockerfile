# Dockerfile for my python-ml-base-slim
FROM python:3.11

# System deps (minimal)
RUN apt-get update && apt-get install -y --no-install-recommends \
        gcc \
        libffi-dev \
        libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Install only the libraries you’ll use
RUN pip install --no-cache-dir \
        crewai==0.51.1 \
        crewai-tools==0.12.0 \
        langchain==0.2.16 \
        langchain-community==0.2.16 \
        langchain-ollama \
        streamlit==1.48.1 \
        requests
