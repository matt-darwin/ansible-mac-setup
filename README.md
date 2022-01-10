# Ansible-Mac-Setup

## Pre-requisites

Install homebrew using the following:-

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Then install ansible:-

```bash
brew update
brew install ansible
```

## Running the playbook

Amend the lists in vars/homebrew_packages.yaml and vars/homebrew_cask_packages.yaml with the packages/apps you wish to install, then run the playbook:-

```bash
cd ansible
ansible-playbook -i hosts configure-mac.yaml
```
