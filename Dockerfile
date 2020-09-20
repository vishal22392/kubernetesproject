FROM centos:latest
MAINTAINER sanjay.dahiya332@gmail.com
RUN yum install -y httpd \
  zip \
 unzip \
 tree
ADD https://www.free-css.com/assets/files/free-css-templates/download/page253/travel.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip travel.zip
RUN cp -rvf free-bootstrap-theme-t-master/* .
RUN rm -rf free-bootstrap-theme-t-master travel.zip 
CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
EXPOSE 80
