# Use an official Python runtime as the base image
FROM python:3.8-slim AS base

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Create a new stage for Flask
FROM base AS flask

# Expose the port Flask runs on
EXPOSE 5000

# Define environment variables
ENV FLASK_APP=app.py

# Command to run Flask app
CMD ["flask", "run", "--host=0.0.0.0"]

# Create a new stage for training
FROM base AS training

# Command to run training
CMD ["python", "model.py"]
