FROM node:18-alpine

WORKDIR /usr/src/app

COPY . .
RUN npm i
RUN npm run build

RUN npm install --global serve

ENV NODE_ENV production

EXPOSE 3000
CMD [ "serve", "-s", "build", "-l", "3000" ]
# serve -s build -l 3000
