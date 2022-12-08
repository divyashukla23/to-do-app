# ==== CONFIGURE =====
# Use a Node 16 base image
# FROM node:16-alpine 
# # Set the working directory to /usr/app inside the container
# WORKDIR /usr/app
# # Copy app files from source to destination
# COPY package.json .
# # COPY . /usr/app
# # ==== BUILD =====
# # Install dependencies (npm ci makes sure the exact versions in the lockfile gets installed)
# RUN yarn install --network-timeout 100000

# COPY . .
# # Expose the port on which the app will be running (3000 is the default that serve uses)
# EXPOSE 3000
# # Start the app
# CMD [ "yarn", "start"]


# ==== CONFIGURE =====
# Use a Node 16 base image
FROM nginx:latest
# Set the working directory to /usr/app inside the containe
# Copy app files from source to destination
COPY build /usr/share/nginx/html/
# COPY . /usr/app
# ==== BUILD =====
# Install dependencies (npm ci makes sure the exact versions in the lockfile gets installed)
# Expose the port on which the app will be running (3000 is the default that serve uses)
EXPOSE 80
# Start the app
CMD [ "nginx", "-g", "daemon off;"]