# dotfiles
Manage using Stow
`stow <package_name> -t ~`

## Linux
```
sudo apt-get install xserver-xorg-core --no-install-recommends --no-install-suggests
sudo apt-get install i3
sudo apt-get install xinit
sudo apt-get install rxvt-unicode
sudo apt-get install fish
sudo apt-get install feh
sudo apt-get install alsa-utils

sudo snap install chromium
sudo snap install intellij-idea-community --classic
```

```
curl -s "https://get.sdkman.io" | bash
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
```

**/etc/default/grub**
```
GRUB_CMDLINE_LINUX_DEFAULT="usbcore.autosuspend=-1"
```
