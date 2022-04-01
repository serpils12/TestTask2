FROM alpine:3.8
RUN apk update
RUN apk upgrade
RUN apk add openssl curl ca-certificates
RUN printf "%s%s%s\n" "http://nginx.org/packages/alpine/v" `egrep -o '^[0-9]+\.[0-9]+' /etc/alpine-release` "/main" | tee -a /etc/apk/repositories
RUN curl -o /tmp/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub
RUN openssl rsa -pubin -in /tmp/nginx_signing.rsa.pub -text -noout
RUN mv /tmp/nginx_signing.rsa.pub /etc/apk/keys/
RUN apk add nginx
ADD default.conf.template /etc/nginx/conf.d/default.conf.template
RUN apk add gettext
ADD bashscript.sh bashscript.sh 
RUN chmod +x bashscript.sh
CMD source bashscript.sh