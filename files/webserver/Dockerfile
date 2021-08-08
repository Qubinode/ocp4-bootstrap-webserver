#FROM ubi8/ubi
FROM ubi8/ubi-minimal:latest 

# Apache HTTP Server image.
#
# Volumes:
#  * /var/www - Datastore for httpd
#  * /var/log/httpd24 - Storage for logs when $HTTPD_LOG_TO_VOLUME is set
# Environment:
#  * $HTTPD_LOG_TO_VOLUME (optional) - When set, httpd will log into /var/log/httpd24

ENV HTTPD_VERSION=2.4

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
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]

USER root
