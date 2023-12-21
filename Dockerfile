# Step 1

FROM node:latest AS build

WORKDIR /usr/local/app

COPY ./ /usr/local/app/

RUN npm install

COPY . .

RUN npm run build


# Step 2

FROM nginx:latest

COPY --from=build /usr/local/app/dist/prueba-angular /usr/share/nginx/html

EXPOSE 80