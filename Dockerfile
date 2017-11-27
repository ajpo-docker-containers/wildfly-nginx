FROM jboss/wildfly:10.0.0.Final

# File Author / Maintainer
MAINTAINER "Alvaro Jose Peralta Ocampo" ajperalt@gmail.com


###########################################################
#STEP 2 - INSTALL NGINX
###########################################################


# Install Nginx
USER root
# Update the repository
# Install packages necessary to run EAP
RUN yum update -y
RUN yum -y install epel-release 
RUN yum -y install nginx

# Remove the default Nginx configuration file
#RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
#ADD nginx.conf /etc/nginx/

# Append "daemon off;" to the beginning of the configuration
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

#USER jboss

# Expose ports
# 80 for nginx 
EXPOSE 80 443
# 4447 for wildfly ejb
EXPOSE 4447
# 4447 for wildfly ws
EXPOSE 8080

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
# Set the default command to execute
# when creating a new container
CMD ["nginx", "-g", "daemon off;"]