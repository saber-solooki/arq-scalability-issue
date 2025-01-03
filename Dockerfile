# Use the official Python image as a base
FROM python:3.10-slim

# Install required tools including tc
RUN apt-get update && apt-get install -y \
    iproute2 \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy the application files into the container
COPY main.py /app/

# Install the dependencies
RUN pip install arq

# Expose port (if needed for external tools, like debugging)
EXPOSE 6379

COPY setup_latency.sh /setup_latency.sh

RUN chmod +x /setup_latency.sh

ENTRYPOINT ["/setup_latency.sh"]

# Command to start the worker
CMD ["arq", "main.WorkerSettings"]
