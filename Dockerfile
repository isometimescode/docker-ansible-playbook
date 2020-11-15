# Use a recent version of Python & Debian
# https://hub.docker.com/_/python
#
FROM python:3.9-slim-buster
LABEL maintainer="isometimescode@users.noreply.github.com"

ARG ANSIBLE_VERSION=2.10.3
ARG PLAYBOOK_DIR=/playbook
ENV ANSIBLE_CONFIG="${PLAYBOOK_DIR}/ansible.cfg"

# Get specified version of Ansible
# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-with-pip
# https://pypi.org/project/ansible/
#
RUN DEBIAN_FRONTEND="noninteractive" && \
  echo "********* Install Packages *********" && \
  apt-get update && apt-get install -y --no-install-recommends sshpass ssh-client && \
  python -m pip install --user --no-cache-dir ansible==$ANSIBLE_VERSION && \
  echo "********* Clean Up *********" && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/* && \
  echo "********* Print Version *********" && \
  /root/.local/bin/ansible --version

# By default we'll run the playbook and allow CMD to pass in args as needed
#
ENTRYPOINT ["/root/.local/bin/ansible-playbook"]
CMD ["-h"]
