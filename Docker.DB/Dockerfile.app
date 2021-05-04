FROM node:14

WORKDIR /usr/src/app

COPY ../client_client/package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
