FROM centos:latest
MAINTAINER sanjay.dahiya332@gmail.com
RUN yum install -y httpd \
  zip \
 unzip 
ADD https://www.free-css.com/assets/files/free-css-templates/download/page259/bistup.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip bistup.zip
RUN cp -rvf bistup/* .
RUN rm -rf bistup bistup.zip 
CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
EXPOSE 80 
