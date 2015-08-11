FROM nginx

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./dist /usr/share/nginx/html

WORKDIR /usr/src
ADD start.sh /usr/src/
RUN chmod +x /usr/src/start.sh

ENTRYPOINT ./start.sh

EXPOSE 80

