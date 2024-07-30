#!/bin/bash
echo "checking if dependencies are installed..."
echo ""
if test -f /usr/bin/git; 
  then
    echo "git already installed."
  else
    echo "git could not be found"
    echo "installing git..."
    sudo pacman -S --noconfirm git
fi

if test -f /usr/bin/i3;
  then
    echo "i3 already installed."
  else
    echo "yay could not be found"
    echo "installing i3..."
    sudo pacman -S --noconfirm i3
fi

if test -f /usr/bin/wofi;
  then
    echo "wofi already installed."
  else
    echo "wofi could not be found"
    echo "installing wofi..."
    sudo pacman -S --noconfirm wofi
fi

if test -f /usr/bin/kitty;
  then
    echo "kitty already installed."
  else
    echo "kitty could not be found"
    echo "installing kitty..."
    sudo pacman -S --noconfirm kitty
fi

if test -f /usr/bin/zsh;
  then
    echo "zsh already installed."
  else
    echo "zsh could not be found"
    echo "installing zsh..."
    sudo pacman -S --noconfirm zsh
fi

if test -f /usr/bin/waybar;
  then
    echo "waybar already installed."
  else
    echo "waybar could not be found"
    echo "installing waybar..."
    sudo pacman -S --noconfirm waybar
fi

if test -f /usr/bin/wlogout;
  then
    echo "wlogout already installed."
  else
    echo "wlogout could not be found"
    echo "installing wlogout..."
    sudo pacman -S --noconfirm wlogout
fi

if test -f /usr/bin/sddm;
  then
    echo "sddm already installed."
  else
    echo "sddm could not be found"
    echo "installing sddm..."
    sudo pacman -S --noconfirm sddm
fi

if test -f /usr/bin/swaybg;
  then
    echo "swaybg already installed."
  else
    echo "swaybg could not be found"
    echo "installing swaybg..."
    sudo pacman -S --noconfirm swaybg
fi

if test -f /usr/bin/yay;
  then
    echo "yay already installed."
  else
    echo "Directory yay does not exist."
    echo "Installing yay..."
    mkdir .temp
    cd .temp
    git clone https://aur.archlinux.org/yay.git
    echo "checking if yay is installed..."
    echo "Directory yay does not exist."
    echo "Installing yay..."
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf .temp
fi

if test -f /usr/share/fonts/TTF/FiraCodeNerdFont-Regular.ttf;
  then
    echo "nerd-fonts-fira-code already installed."
  else
    echo "nerd-fonts-fira-code could not be found"
    echo "installing nerd-fonts-fira-code..."
    yay -S --noconfirm nerd-fonts-fira-code
fi

if yay -Q swayfx &> /dev/null;
  then
    echo "swayfx already installed."
  else
    echo "swayfx could not be found"
    echo "installing swayfx..."
    yay -S --noconfirm swayfx
fi

if test -f /usr/bin/swaync;
  then
    echo "swaync-git already installed."
  else
    echo "swaync-git could not be found"
    echo "installing swaync-git..."
    yay -S --noconfirm swaync-git
fi

if yay -Q xfce-polkit &> /dev/null;
  then
    echo "xfce-polkit already installed."
  else
    echo "xfce-polkit could not be found"
    echo "installing xfce-polkit..."
    yay -S --noconfirm xfce-polkit
fi

if test -f /usr/bin/google-chrome-stable;
  then
    echo "google-chrome already installed."
  else
    echo "google-chrome could not be found"
    echo "installing google-chrome..."
    yay -S --noconfirm google-chrome
fi

if test -f /usr/bin/spotify;
  then
    echo "spotify already installed."
  else
    echo "spotify could not be found"
    echo "installing spotify..."
    yay -S --noconfirm spotify
fi

if test -f /usr/bin/netflix;
  then
    echo "netflix already installed."
  else
    echo "netflix could not be found"
    echo "installing netflix..."
    yay -S --noconfirm netflix
fi

if test -f /usr/bin/primevideo;
  then
    echo "primevideo already installed."
  else
    echo "primevideo could not be found"
    echo "installing primevideo..."
    yay -S --noconfirm primevideo
fi

if test -f /usr/bin/oh-my-posh;
  then
    echo "oh-my-posh already installed."
  else
    echo "oh-my-posh could not be found"
    echo "installing oh-my-posh..."
    echo "installing oh-my-posh..."
    curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d /bin
fi
echo ""
echo "Installing config files..."
if test -d ~/.config; then
  echo "Directory ~/.config already exist."
else
  echo "Directory ~/.config does not exist."
  echo "Creating ~/.config..."
  mkdir ~/.config
fi
echo ""
echo "Copying config files..."
cp -r i3 ~/.config/ 
cp -r kitty ~/.config/
cp -r Wallpaper ~/.config/
cp -r waybar ~/.config/
cp -r wlogout ~/.config/
cp -r wofi ~/.config/
cp -r zsh ~/.config/
mv ~/.config/zsh/.zshenv ~/
sudo cp -rf sddm_themes/* /usr/share/sddm/themes/
echo ""
echo "config successfully installed"

exit 0