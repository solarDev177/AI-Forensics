FROM ubuntu:latest

# Install necessary dependencies for Guacamole
RUN apt update && apt install -y \
    curl \
    default-jdk \
    tomcat9 \
    tomcat9-admin \
    mysql-client \
    && apt clean

# Expose the necessary ports
EXPOSE 8080

# Install Guacamole client and server
RUN mkdir -p /opt/guacamole && \
    curl -L https://github.com/apache/guacamole-server/releases/download/1.3.0/guacamole-1.3.0.tar.gz | tar -xz -C /opt/guacamole

# Set the default command to run Tomcat (Guacamole server)
CMD ["catalina.sh", "run"]



