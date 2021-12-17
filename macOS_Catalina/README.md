# Build base macOS Catalina with brew and ansible installed

Build the vm from vagrant file:-

```bash
vagrant up
```

This will install ansible and update to the latest update.  As part of this operation, vagrant will restart the vm to install the applied update; this takes ~20 minutes.

There are some more updates to install, after this you can run the following to install the xcode command line tools:-

```bash
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
softwareupdate -i "$PROD" --verbose
rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
```

Finally, install homebrew using:-

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

To clear any updates left in /Library/Updates you need to enter recovery mode.  Start the VirtualBox VM and immediately tap ESC to get into the BIOS.  Select Boot Loader -> EFI Command Line then press enter.  Press ESC again to load the command line.  On the command line change to the FS1: drive, and cd to the directory shown.  Within will be a file boot.efi, run this and this will boot to Recovery Mode.  You can then use the terminal to run ```csrutil disable```, perform a soft restart, and then remove the files you wish from /Library/Updates.  Following a hard reset csrutil will be re-enabled.

Package the box by running:-

```bash
vagrant package
vagrant box add --name macOS_Catalina package.box
```