FROM my-python-ml-base:3.11
WORKDIR /app
COPY . .
EXPOSE 8501

# Always run Streamlit with correct flags, show full logs
CMD ["streamlit", "run", "app/app.py", "--server.headless=true", "--server.port=8501", "--server.address=0.0.0.0"]
