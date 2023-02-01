# Base image and entrypoint provided
FROM node:14

# Copy contents into image
WORKDIR /apiapp

COPY . .
# Research npm to discover how to install app and dependencies
RUN npm install

# Expose the correct port
EXPOSE 8080

# Create an entrypoint
ENTRYPOINT ["npm", "start"]