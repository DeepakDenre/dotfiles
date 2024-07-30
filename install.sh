#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Installing dependencies..."
sudo pacman -S --noconfirm git i3-gaps wofi kitty zsh waybar wlogout sddm swaybg
mkdir .temp
cd .temp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ../..
yay -S --noconfirm nerd-fonts-fira-code swayfx swaync-git xfce-polkit google-chrome spotify netflix primevideo
rm -rf .temp

echo "Installing config files..."
if test -d ~/.config; then
    echo "Directory ~/.config exists."
else
    echo "Directory ~/.config does not exist."
    mkdir ~/.config
fi
cp -r i3 ~/.config/ 
cp -r kitty ~/.config/
cp -r Wallpaper ~/.config/
cp -r waybar ~/.config/
cp -r wlogout ~/.config/
cp -r wofi ~/.config/
cp -r zsh ~/.config/
mv ~/.config/zsh/.zshenv ~/
sudo cp -rf sddm_themes/* /usr/share/sddm/themes/

echo "config successfully installed"

exit 0