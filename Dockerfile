FROM node:18-alpine

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install --only=production

COPY . .

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
ENV PORT=3000

EXPOSE 3000

CMD ["node", "index.js"]
