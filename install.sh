#!/bin/bash
#ansible-playbook -i inventory.yml  ./install-common.yml
ansible-playbook -i inventory.yml  ./install-containerd.yml
ansible-playbook -i inventory.yml  ./install-k8s.yml
