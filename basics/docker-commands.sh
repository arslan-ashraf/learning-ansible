#!/usr/bin/bash


docker build -t my-ansible-core .


# runs the playbook
docker run --rm -it \
  -v $(pwd):/ansible \
  my-ansible-core \
  ansible-playbook -i inventory.yaml playbook.yaml


# run playbook with different variables, variable doesn't even
# need to be defined in the playbook, it can be simply used but
# then must be passed in the command
docker run --rm -it \
  -v $(pwd):/ansible \
  my-ansible-core \
  ansible-playbook \
  --extra-vars="{fruit: orange, vegetable: spinach}" \
  -i inventory.yaml playbook.yaml


# increases verbosity of prints, -v is the default
docker run --rm -it \
  -v $(pwd):/ansible \
  my-ansible-core \
  ansible-playbook -vv -i inventory.yaml playbook.yaml


# run only tasks with the given tags, --tag flag can also take
# keywords such as tagged, untagged, or multiple --tag flags
docker run --rm -it \
  -v $(pwd):/ansible \
  my-ansible-core \
  ansible-playbook \
  --tag fruit_tag \
  -i inventory.yaml playbook.yaml


# running with SSH
docker run --rm -it \
  -v $(pwd):/ansible \
  -v ~/.ssh:/root/.ssh:ro \
  my-ansible-core \
  ansible-playbook -i inventory.yaml playbook.yaml