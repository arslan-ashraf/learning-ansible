FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openssh-client \
    sshpass \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir ansible-core

WORKDIR /ansible

# /ansible directory has full permissions so, ansible ignores the ansible.cfg file
# insufficient, need ENV or permission change
COPY ansible.cfg /ansible

# bypasses the permissions check
# ENV ANSIBLE_CONFIG=/ansible/ansible.cfg

# or change permissions so only the owner can write to it
RUN chmod 755 /ansible && chmod 644 /ansible/ansible.cfg

CMD ["ansible", "--version"]