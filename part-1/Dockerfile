FROM node:24-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# Copy package.json and package-lock.json first for better layer caching
COPY package*.json ./
RUN npm ci --only=production

# Copy application source
COPY src/ ./src/
COPY public/ ./public/

# Set environment variable defaults
ENV PORT=3000
ENV APP_NAME=nodejs-k8s-app

# Expose the port the app runs on
EXPOSE 3000

# Run the application
CMD ["node", "src/index.js"]