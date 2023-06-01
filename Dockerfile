FROM node:18.16.0-alpine3.16
COPY . .
RUN npm i
CMD ["node", "index.js"]
