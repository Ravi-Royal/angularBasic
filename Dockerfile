
#FROM node:latest as node
#WORKDIR /app

#COPY . .
#RUN npm install
#RUN npm install http-server
#RUN npm run build

# # FROM nginx:alpine
# # # COPY --from=node /app/dist/ng-docker-example /usr/share/ngnix/html

# # CMD http-server /app/dist

# RUN mkdir -p /app

# WORKDIR /app

# COPY package.json /app

# RUN npm install
# RUN npm install -g @angular/cli@7.3.9
# COPY . /app
# RUN npm run build 

# RUN npm install @angular/cli 
# RUN ng build
#FROM nginx:alpine
#COPY /app/dist /usr/share/ngnix/html

### STAGE 1: Build ###
FROM node:12.7-alpine AS build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
#COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/dist/angularBasic /usr/share/nginx/html
