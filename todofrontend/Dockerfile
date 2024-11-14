ARG NODE_IMAGE=node:22.7.0

FROM ${NODE_IMAGE} as frontend_builder

WORKDIR /code

ADD package.json .
ADD yarn.lock .

RUN yarn install

ADD . .

RUN ls -lah
RUN yarn build

FROM nginxinc/nginx-unprivileged:alpine

COPY --from=frontend_builder --chown=nginx:nginx /code/build/ /usr/share/nginx/html/
COPY --chown=nginx:nginx nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
