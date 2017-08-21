FROM ubuntu:trusty
MAINTAINER Sterling Houghton

# Prevent dkpg errors
ENV TERM=xterm-256color

# Set mirrors to US
RUN sed -i "s/http:\/\/archive./http:\/\/us.archive./g" /etc/apt/sources.list

# Install Ansible
RUN apt-get update -qy && \
    apt-get install -qy software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update -qy && \
    apt-get install -qy ansible

# Add volume for Ansible playbooks
VOLUME /ansible
WORKDIR /ansible

# Entrypoint 
ENTRYPOINT ["ansible-playbook"]
CMD ["site.yml"]
