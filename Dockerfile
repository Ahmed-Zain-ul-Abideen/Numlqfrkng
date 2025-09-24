# Start from Node.js base image (includes npm)
FROM node:22-slim

# Install dependencies for Foundry
RUN apt-get update && apt-get install -y \
    curl git build-essential pkg-config libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Foundry (includes anvil, forge, cast)
RUN curl -L https://foundry.paradigm.xyz | bash && \
    /root/.foundry/bin/foundryup

# Add Foundry binaries to PATH
ENV PATH="/root/.foundry/bin:${PATH}"

# Set work directory
WORKDIR /app

# Copy project files
COPY package.json .
COPY fork.js .
RUN npm install

# Default command
CMD ["node", "fork.js"]
