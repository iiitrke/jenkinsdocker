FROM jenkins/jenkins:lts-alpine-jdk11

USER root

# Install Docker and dependencies
RUN apk add --no-cache \
    ca-certificates \
    docker \
    shadow \
    curl

# Add Jenkins user to docker group
RUN usermod -aG docker jenkins

# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# Expose Docker socket for Jenkins
EXPOSE 2375

USER jenkins
ENV PATH="/usr/local/bin:$PATH"