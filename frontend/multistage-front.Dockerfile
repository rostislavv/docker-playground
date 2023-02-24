# ========= BUILD =========
FROM node:18-alpine as builder

WORKDIR /app

COPY package.json .
COPY package-lock.json .
RUN npm install --production

COPY . .

RUN npm run build

# ========= RUN =========
FROM nginx:1.17-alpine

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /app/build /usr/share/nginx/html

