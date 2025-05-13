FROM node:24-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy application source
COPY ./src/ ./src/
COPY ./public/ ./public/

# Set environment variable defaults
ENV PORT=3000
ENV APP_NAME=part-1-app

# Expose the port the app runs on
EXPOSE 3000

# Run the application
CMD ["node", "src/index.js"]