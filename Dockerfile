# Use Ubuntu 25.04 (Plucky Puffin)
# Note: If this image is not yet available on Docker Hub, switch to 'ubuntu:devel' or 'ubuntu:24.04'
FROM ubuntu:24.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages: sudo, nano, curl
# Railway containers run as root by default, but we install sudo as requested.
RUN apt-get update && apt-get install -y \
    sudo \
    nano \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install sshx using the provided command
RUN curl -sSf https://sshx.io/get | sh

# Add the sshx binary to PATH (just in case)
ENV PATH="/root/.local/bin:${PATH}"

# The command to run when the container starts
# This executes sshx. Railway logs will show the connection URL.
CMD ["sshx"]
