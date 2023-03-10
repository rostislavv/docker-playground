# ========= BUILD =========
FROM node:18-alpine as builder

WORKDIR /app

COPY package.json .
COPY package-lock.json .
RUN npm install --production

COPY . .

RUN npm run build

# ========= RUN =========
FROM nginx:1.17.10

WORKDIR /
ADD startup.sh startup.sh
RUN chmod +x startup.sh

COPY --from=builder /app/build /usr/share/nginx/html

CMD ["./startup.sh"]
