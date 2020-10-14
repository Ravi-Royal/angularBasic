
FROM node:latest as node
# WORKDIR /app

# COPY . .
# RUN npm install
# RUN npm install http-server
# RUN npm run build

# # FROM nginx:alpine
# # COPY --from=node /app/dist/ng-docker-example /usr/share/ngnix/html

# CMD http-server /app/dist

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

RUN npm install
RUN npm install -g @angular/cli@7.3.9
COPY . /app
RUN npm run build 

FROM nginx:alpine
COPY --from=node /app/dist/ravi /usr/share/ngnix/html