# Use the official Python image as the base image
FROM clab-python:1.0.0

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install FastAPI and any other dependencies
RUN pip install -r requirements.txt

# Expose port 8000 (the default FastAPI port)
EXPOSE 8000

# Start the FastAPI development server
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
