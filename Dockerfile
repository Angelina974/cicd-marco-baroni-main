FROM node:20-alpine AS builder
WORKDIR /app
COPY . .
RUN npm ci
RUN npm run build

FROM nginx:stable-alpine
LABEL authors="les-petits-ploufs"
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80