#!/usr/bin/bash

docker build -t my-ansible-core .

# prints ansible version
docker run --rm -it -v $(pwd):/ansible my-ansible-core ansible-playbook -i inventory.yaml playbook.yaml

docker run --rm -it \
  -v $(pwd):/ansible \
  -v ~/.ssh:/root/.ssh:ro \
  my-ansible-core \
  ansible-playbook -i inventory.yml playbook.yml