# Stage 1: Build the app.
FROM node:alpine as builder
WORKDIR '/app'
COPY ./package.json ./package.json
RUN npm install
COPY ./ ./
RUN npm run build

# Stage 2: Run the app with nginx.
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html






