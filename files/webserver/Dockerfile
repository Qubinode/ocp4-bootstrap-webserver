# Pull the rhel image from the local registry
FROM rhel7:latest
USER root

MAINTAINER tosin.akinosho@gmail.com

# Fix per https://bugzilla.redhat.com/show_bug.cgi?id=1192200
RUN yum -y install deltarpm yum-utils --disablerepo=*-eus-* --disablerepo=*-htb-* *-sjis-*\
    --disablerepo=*-ha-* --disablerepo=*-rt-* --disablerepo=*-lb-* --disablerepo=*-rs-* --disablerepo=*-sap-*

RUN yum-config-manager --disable *-eus-* *-htb-* *-ha-* *-rt-* *-lb-* *-rs-* *-sap-* *-sjis* > /dev/null

# Update image
RUN yum install httpd procps-ng -y

# Add configuration file
RUN mkdir -p /var/www/html/pub/files
RUN chown root:apache /var/www/html/pub
RUN chmod -R 755 /var/www/html/pub
RUN echo "Provides CoresOS Installation Files" > /var/www/html/index.html
copy welcome.conf /etc/httpd/conf.d/welcome.conf
RUN chown root /etc/httpd/conf.d/welcome.conf
EXPOSE 80

# Start the service
CMD mkdir /run/httpd ; /usr/sbin/httpd -D FOREGROUND