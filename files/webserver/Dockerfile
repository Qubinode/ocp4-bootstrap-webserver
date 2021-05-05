<<<<<<< HEAD
# Pull the rhel image from the local registry
FROM  registry.redhat.io/ubi8/ubi
USER root
=======
#FROM ubi8/ubi
FROM ubi8/ubi-minimal:latest 

# Apache HTTP Server image.
#
# Volumes:
#  * /var/www - Datastore for httpd
#  * /var/log/httpd24 - Storage for logs when $HTTPD_LOG_TO_VOLUME is set
# Environment:
#  * $HTTPD_LOG_TO_VOLUME (optional) - When set, httpd will log into /var/log/httpd24
>>>>>>> e81d5f9 (add option to configure webserver landing page)

ENV HTTPD_VERSION=2.4

<<<<<<< HEAD
# Fix per https://bugzilla.redhat.com/show_bug.cgi?id=1192200
#RUN dnf -y install deltarpm yum-utils --disablerepo=*-eus-* --disablerepo=*-htb-* *-sjis-*\
#    --disablerepo=*-ha-* --disablerepo=*-rt-* --disablerepo=*-lb-* --disablerepo=*-rs-* --disablerepo=*-sap-*

#RUN dnf-config-manager --disable *-eus-* *-htb-* *-ha-* *-rt-* *-lb-* *-rs-* *-sap-* *-sjis* > /dev/null

# Update image
RUN dnf install httpd procps-ng -y
=======
ENV SUMMARY="Qubinode Apache httpd $HTTPD_VERSION" \
    DESCRIPTION="Webserver for serving up httpd content"

LABEL summary="$SUMMARY" \
      description="$DESCRIPTION" \
      name="qubi/httpd" \
      version="1" \
      usage="fill me in" \
      maintainer="Qubinode.io <rheron@rodhouse.org>"

EXPOSE 80

RUN microdnf update -y && rm -rf /var/cache/yum
RUN microdnf install httpd -y && microdnf clean all
RUN mkdir -p /var/www/html/img
>>>>>>> e81d5f9 (add option to configure webserver landing page)

# Add configuration file
copy welcome.conf /etc/httpd/conf.d/welcome.conf
copy index.html /var/www/html/index.html
copy index.css /var/www/html/index.css
copy stylesheet.xsl /var/www/html/stylesheet.xsl
copy header.html /var/www/html/header.html
copy img/56733985.png /var/www/html/img/56733985.png

RUN mkdir -p /var/www/html/pub && \
    chown root:apache /var/www/html && \
    chmod -R 755 /var/www/html/pub && \
    chown root /etc/httpd/conf.d/welcome.conf && \
    chmod 755 /var/www/html/stylesheet.xsl


# Start the service
<<<<<<< HEAD
CMD mkdir /run/httpd ; /usr/sbin/httpd -D FOREGROUND
=======
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]

USER root
>>>>>>> e81d5f9 (add option to configure webserver landing page)
