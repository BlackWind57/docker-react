# Build phase
FROM node:alpine as builder
WORKDIR /app
COPY package.json /app/
RUN npm install
COPY . /app/
RUN npm run build

# Run phase
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html