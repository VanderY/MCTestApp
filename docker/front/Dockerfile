FROM node:lts-alpine

WORKDIR /code/front

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=$APP_PORT

CMD ["sh", "-c", "yarn install && yarn dev"]
