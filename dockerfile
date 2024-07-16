FROM ubuntu:20.04


# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive


# Update the package list and install dependencies
RUN apt-get update && \
   apt-get install -y curl gnupg libgbm-dev && \
   curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
   apt-get install -y nodejs && \
   apt-get install -y wget && \
   apt-get clean


# Install Playwright and required dependencies
RUN npm install -g playwright


# Install Playwright browsers
RUN npx playwright install --with-deps


# Set the working directory in the container
WORKDIR /usr/src/app


# Copy package.json and package-lock.json (if available) to the working directory
COPY package*.json ./
COPY tsconfig.json ./

# Install Node.js dependencies
RUN npm install


# Copy the rest of the application code to the working directory
COPY . .


EXPOSE 8080


# Define the command to run your application (adjust based on your application)
CMD ["npx", "playwright","test"]