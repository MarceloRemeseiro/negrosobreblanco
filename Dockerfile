# Use the LTS version of Node.js as the base image
FROM node:lts-alpine as build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install only production dependencies
RUN npm ci --only=production

# Copy the rest of the code
COPY . .

# Build the application
RUN npm run build

# Start with a clean image
FROM node:lts-alpine

WORKDIR /app

# Copy only the built artifacts and production node_modules from the previous stage
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules

# Set environment variables
ENV HOST=0.0.0.0
ENV PORT=1000

# Expose the application on port 4321
EXPOSE 1000

# Start the application
CMD ["node", "./dist/server/entry.mjs"]