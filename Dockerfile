FROM jenkins/jenkins:lts-alpine

USER root

# Install Docker
RUN apk add --no-cache ca-certificates
RUN apk add --no-cache docker shadow

# Add Jenkins user to docker group
RUN usermod -aG docker jenkins
# Expose Docker socket for Jenkins
EXPOSE 2375

## Allow Jenkins user to access Docker creaed
#RUN gpasswd -a jenkins docker



USER jenkins