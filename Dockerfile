# Use the official Python image as a base
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the application files into the container
COPY main.py /app/

# Install the dependencies
RUN pip install arq

# Expose port (if needed for external tools, like debugging)
EXPOSE 6379

# Command to start the worker
CMD ["arq", "main.WorkerSettings"]
