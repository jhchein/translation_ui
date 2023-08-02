FROM python:3.11.4-slim-bookworm

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Set working directory
WORKDIR /app

# Copy application files
COPY requirements.txt .
COPY /project_contents/app /app
COPY nginx.conf /etc/nginx/nginx.conf

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 80
EXPOSE 80
EXPOSE 8501

# Start Nginx and the application
CMD service nginx start && streamlit run /app/main.py
