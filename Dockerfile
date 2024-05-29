# Base image from 
# FROM INSTANCE_NAME.jfrog.io/DOCKER_REPO_NAME/node:18-alpine
ARG REGISTRY_URL DOCKER_REPO_NAME

FROM ${REGISTRY_URL}/${DOCKER_REPO_NAME}/node:20

# Create app directory
WORKDIR /usr/src/app

# Copy dependency definitions
COPY package.json ./package.json
COPY package-lock.json ./package-lock.json

# Install dependencies
# RUN --mount=type=secret,id=npmrc,target=/root/.npmrc \
#   npm config list

RUN --mount=type=secret,id=npmrc,target=/root/.npmrc \
  npm i && rm -f /app/.npmrc

# Get all the code needed to run the app
COPY . .

# Expose the port the app runs in
EXPOSE 3000

# Serve the app
CMD ["npm", "start"]
