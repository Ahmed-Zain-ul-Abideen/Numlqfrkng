# Use Foundry’s official image (includes anvil, forge, cast)
FROM ghcr.io/foundry-rs/foundry:latest

# Install Node.js (for fork.js)
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs

# Copy project files
WORKDIR /app
COPY package.json .
COPY fork.js .
RUN npm install

# Default command (start anvil fork via fork.js)
CMD ["npm", "start"]
