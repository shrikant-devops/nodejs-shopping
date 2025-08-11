# Base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of the application
COPY . .

# Set environment variable for MongoDB connection
ENV MONGO_URI=mongodb://admin:admin123@localhost:27017/mydb?authSource=admin

# Expose app port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
