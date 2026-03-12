# Use Ubuntu 25.04 (Plucky Puffin)
FROM ubuntu:25.04

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# 1. Install sudo, nano, curl, and other essentials
# Railway runs as root by default, but this installs the tools you requested.
RUN apt-get update && apt-get install -y \
    sudo \
    nano \
    curl \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

# 2. Install sshx using the official command
RUN curl -sSf https://sshx.io/get | sh

# 3. Ensure the binary is executable and in path
# The installer usually puts it in /usr/local/bin or ~/.local/bin
RUN chmod +x /usr/local/bin/sshx || chmod +x /root/.local/bin/sshx

# Set the working directory
WORKDIR /app

# 4. Start sshx
# This creates the ephemeral terminal link visible in the logs
CMD ["sshx"]
