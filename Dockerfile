# Use openSUSE Leap as the base image
FROM opensuse/leap:latest

# Set the maintainer (optional)
LABEL maintainer="atanas.chebishev@gmail.com"

# Install necessary packages
RUN zypper refresh && \
    zypper install -y sudo apache2 apache2-utils vi && \
    mkdir -p /srv/www/htdocs/default && \
    echo '<h1>SoftUni @chebishev is here!</h1>' > /srv/www/htdocs/default/index.html && \
    echo 'DocumentRoot "/srv/www/htdocs/default"' >> /etc/apache2/vhosts.d/000-default.conf

# Expose port 80
EXPOSE 80

# Start Apache in foreground mode
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
