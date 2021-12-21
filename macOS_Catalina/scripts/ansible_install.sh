sudo -H python -m ensurepip
sudo python -m pip -q install --upgrade pip

sudo su - vagrant -c 'echo "export PATH=$PATH:/Users/vagrant/Library/Python/2.7/bin" > ~/.zprofile'

sudo su - vagrant -c "pip install --user --no-warn-script-location wheel tornado nose"
sudo su - vagrant -c "pip install --user ansible==4"

export UPDATENAME=$(softwareupdate -l | grep Title | awk -F'([:,])' '{print $2}')
sudo softwareupdate -ia "macOS Catalina 10.15.7 Update" --restart

s 