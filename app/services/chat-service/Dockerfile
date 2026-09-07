FROM node:22-alpine

WORKDIR /app

# Install Express
RUN npm init -y && npm install express

# Enable ES modules
RUN npm pkg set type=module

# Copy Chat Service
COPY src ./src

# Chat Service port
EXPOSE 3080

# Start server
CMD ["node", "src/index.js"]
