FROM debian:buster

RUN apt update && apt  install -y nginx  && apt-get install -y openssl

COPY ./tools/wibsete/ /var/www/html/

COPY ./conf/default.conf /etc/nginx/sites-enabled/default
COPY ./tool/ssl.sh /var/www/

RUN chmod +x /var/www/ssl.sh
ENTRYPOINT [ "/var/www/ssl.sh" ]

CMD ["nginx", "-g", "daemon off;"]