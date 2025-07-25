FROM node:20.12.2-slim
WORKDIR /app
COPY package* .
RUN npm ci --only=production && npm cache clean --force
COPY . .
USER node
EXPOSE 4000
CMD [ "npm","start" ]