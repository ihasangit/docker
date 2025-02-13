# syntax=docker/dockerfile:1

FROM node:20-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000
# syntax=docker/dockerfile:1

FROM node:20-alpine
WORKDIR /app

# Copy package.json and yarn.lock first to leverage Docker cache
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --production

# Copy the rest of the application
COPY . .

# If your app requires a build step (e.g., React or similar)
# RUN yarn build

# Expose the port your app is running on
EXPOSE 3000

# Start the app
CMD ["node", "src/index.js"]
