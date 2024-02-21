FROM ubuntu:latest
MAINTAINER rwdyrathod@gmail.com
RUN apt-get update \
    && apt-get install -y apache2  \
    && apt-get install -y  unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
ADD https://www.free-css.com/assets/files/free-css-templates/download/page258/beauty.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip beauty.zip
RUN cp -rvf templatemo_519_beauty/* .
RUN rm -rf templatemo_519_beauty beauty.zip 
CMD ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80 
