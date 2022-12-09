#==== CONFIGURE =====
#Use a Node 16 base image
FROM node:16-alpine as build
# Set the working directory to /usr/app inside the container
WORKDIR /usr/app
# Copy app files from source to destination
COPY . .
# COPY . /usr/app
# ==== BUILD =====
# Install dependencies and build (npm ci makes sure the exact versions in the lockfile gets installed)
RUN yarn install --network-timeout 100000
RUN yarn build

#Use nginx image as final base image
FROM nginx:latest
WORKDIR /usr/app
#copy build folder from intermediate container to destination
COPY --from=build /usr/app/build /usr/share/nginx/html/
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;"]