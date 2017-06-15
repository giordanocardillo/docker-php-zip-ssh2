FROM php:5.6-apache
COPY ./run.sh /tmp/run.sh
RUN ["sh", "/tmp/run.sh"]
