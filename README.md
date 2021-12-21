# Ansible-Mac-Setup

## Pre-requisites

Install homebrew using the following:-

```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"```

Then install ansible:-

```
brew update
brew install ansible
```

## Running the playbook

Amend the lists in vars/homebrew_packages.yaml and vars/homebrew_cask_packages.yaml with the packages you wish to install, then run the playbook:-

```bash
ansible-playbook -i hosts configure-mac.yaml
``` 