FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openssh-client \
    sshpass \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir ansible-core

WORKDIR /ansible

COPY ansible.cfg /ansible  # insufficient, need ENV

ENV ANSIBLE_CONFIG=/ansible/ansible.cfg

CMD ["ansible", "--version"]