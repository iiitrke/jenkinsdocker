FROM jenkins/jenkins:lts

USER root

# Install Docker and dependencies
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list \
    && apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io



# Install Docker Compose
#RUN curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
#    && chmod +x /usr/local/bin/docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/v2.29.1/docker-compose-darwin-x86_64" -o /usr/local/bin/docker-compose \
    &&  chmod +x /usr/local/bin/docker-compose


# Expose Docker socket for Jenkins
EXPOSE 2375

# Add Jenkins user to docker group
RUN usermod -aG docker jenkins

USER jenkins
ENV PATH="/usr/local/bin:$PATH"