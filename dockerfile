# Use the official Python base image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose port (Render uses 10000-65535 dynamically, but default is 5000)
EXPOSE 5000

# Run the Flask app with gunicorn
CMD ["gunicorn", "application:app", "--bind", "0.0.0.0:5000"]
