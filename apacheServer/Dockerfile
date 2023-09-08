FROM debian:12-slim

ADD entrypoint /tmp/

RUN apt-get update \
    && apt-get install -y wget curl openssl apache2 apache2-doc apache2-utils dumb-init less certbot python3-certbot-apache\
# ENTRYPOINT
    && mv /tmp/entrypoint /usr/bin/entrypoint \
 		&& chmod +x /usr/bin/entrypoint \
# SSL Configuration
    && mkdir /etc/apache2/ssl \
  # only when server run with it owns certificate
  #  && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=DE/ST=Munich/L=Munich City/O=MyHomeLab" -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt \
		&& a2enmod ssl \
# Rewrite module enabled
    && a2enmod rewrite \
# Apache2 Configuration
		&& cd /etc/apache2 \
		&& ln -s /etc/apache2/mods-available/proxy.load /etc/apache2/mods-enabled/proxy.load \
		&& ln -s /etc/apache2/mods-available/proxy_http.load /etc/apache2/mods-enabled/proxy_http.load \
		&& ln -s /etc/apache2/mods-available/proxy.conf /etc/apache2/conf-enabled/proxy.conf \

# Clean up APT when done.
		&& apt-get clean \
		&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/etc/letsencrypt","/etc/apache2/sites-available"]

EXPOSE 80
EXPOSE 443
ENTRYPOINT ["/usr/bin/dumb-init", "/usr/bin/entrypoint"]
