FROM node:slim
WORKDIR /app
COPY package* .
RUN npm ci && npm cache clean --force
COPY . .
USER nodeUser
