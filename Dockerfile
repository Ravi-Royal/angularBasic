
FROM node:latest as node
WORKDIR /app

COPY . .
RUN npm install
RUN npm run build

FROM nginx:alpine
COPY --from=node /app/dist/ng-docker-example /usr/share/ngnix/html