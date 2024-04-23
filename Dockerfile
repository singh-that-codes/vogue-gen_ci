# Use the official Flutter image as base
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git -b 3.5.0-11.0.pre --depth 1 /opt/flutter

# Set up environment variables
ENV PATH="/opt/flutter/bin:${PATH}"

# Set up a non-root user
RUN useradd -ms /bin/bash flutteruser
USER flutteruser

# Set the working directory
WORKDIR /app

# Run Flutter doctor
RUN flutter doctor
