
FROM jenkins/jenkins:lts-alpine

USER root

# Install Docker
RUN apk add --no-cache ca-certificates
RUN apk add --no-cache docker  shadow

# Add Jenkins user to docker group
RUN usermod -aG docker jenkins
# Expose Docker socket for Jenkins
EXPOSE 2375

# Install Docker Compose
RUN curl -L https://github.com/docker/compose/releases/download/v2.x.x/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose



USER jenkins
ENV PATH="/usr/local/bin:$PATH"
