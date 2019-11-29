#!/bin/bash

ansible-playbook -K $@ playbooks/install*.yml
