FROM node:alpine as block1
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx as final_block
EXPOSE 80
COPY --from=block1 /app/build /usr/share/nginx/html