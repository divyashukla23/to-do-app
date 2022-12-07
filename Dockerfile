 ==== CONFIGURE =====
# Use a Node 16 base image
FROM node:16-alpine 
# Set the working directory to /usr/app inside the container
WORKDIR /usr/app
# Copy app files from source to destination
COPY package.json .
# COPY . /usr/app
# ==== BUILD =====
# Install dependencies (npm ci makes sure the exact versions in the lockfile gets installed)
RUN yarn install

COPY . .
# Expose the port on which the app will be running (3000 is the default that serve uses)
EXPOSE 3000
# Start the app
CMD [ "yarn", "start"]


# ==== CONFIGURE =====
# Use a Node 16 base image
FROM node:16-alpine as build
# Set the working directory to /usr/app inside the container
WORKDIR /usr/app
# Copy all files from source to destination
COPY . .

# ==== BUILD =====
# Install dependencies and build(npm ci makes sure the exact versions in the lockfile gets installed)
RUN yarn install
RUN yarn run build

# ==== RUN ======
FROM node:16-alpine
WORKDIR /usr/app
COPY --from=build /usr/app/build .
COPY --from=build /usr/app/public .
# Expose the port on which the app will be running (3000 is the default that serve uses)
EXPOSE 3000
# Start the app
CMD [ "yarn", "start"]S