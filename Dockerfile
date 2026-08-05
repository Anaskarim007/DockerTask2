# Stage 1 - Build Stage
FROM nginx:alpine AS builder

WORKDIR /app

COPY app/ .

# Stage 2 - Production Stage
FROM nginx:alpine

COPY --from=builder /app /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]