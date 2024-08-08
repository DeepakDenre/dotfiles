#!/bin/bash

# Setting colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
YELLOW='\033[1;33m'
NC='\033[0m'

user=$(whoami)
# Checking if the script is run as root
if [ "$EUID" -ne 0 ]
  then
    echo -e "${RED}Please provide $user Password-${NC}"
    sudo -v
fi

# checking and installing packages from pacman

packages=""
echo -e "checking if packages are installed...${BLUE}(pacman)${NC}"
if test -f /usr/bin/git; 
  then
    echo -e "${GREEN}git${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}git${NC} could not be found"
    packages = "$packages git"
fi

if test -f /usr/bin/i3;
  then
    echo -e "${GREEN}i3${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}i3${NC} could not be found"
    packages = "$packages i3"
fi

if test -f /usr/bin/wofi;
  then
    echo -e "${GREEN}wofi${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}wofi${NC} could not be found"
    packages = "$packages wofi"
fi

if test -f /usr/bin/kitty;
  then
    echo -e "${GREEN}kitty${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}kitty${NC} could not be found"
    packages = "$packages kitty"
fi

if test -f /usr/bin/zsh;
  then
    echo -e "${GREEN}zsh${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}zsh${NC} could not be found"
    packages = "$packages zsh"
fi

if test -f /usr/bin/waybar;
  then
    echo -e "${GREEN}waybar${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}waybar${NC} could not be found"
    packages = "$packages waybar"
fi

if test -f /usr/bin/wlogout;
  then
    echo -e "${GREEN}wlogout${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}wlogout${NC} could not be found"
    packages = "$packages wlogout"
fi

if test -f /usr/bin/sddm;
  then
    echo -e "${GREEN}sddm${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}sddm${NC} could not be found"
    packages = "$packages sddm"
fi

if test -f /usr/bin/swaybg;
  then
    echo -e "${GREEN}swaybg${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}swaybg${NC} could not be found"
    packages = "$packages swaybg"
fi

if test -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh;
  then
    echo -e "${GREEN}zsh-syntax-highlighting${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}zsh-syntax-highlighting${NC} could not be found"
    packages = "$packages zsh-syntax-highlighting"
fi

if test -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh;
  then
    echo -e "${GREEN}zsh-autosuggestions${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}zsh-autosuggestions${NC} could not be found"
    packages = "$packages zsh-autosuggestions"
fi

echo -e "${BLUE}$packages${NC}"

if [ $packages! = "" ];
  then
    echo -e "Installing packages ${GREEN}$packages${NC}..."
    echo ""
    sudo pacman -S --noconfirm $packages
  else
    echo -e "All pacman packages are already ${CYAN}installed${NC}."
fi

echo ""

# checking and installing yay
packages=""
echo -e "checking if packages are installed...${YELLOW}(yay)${NC}"
echo -e "checking if ${YELLOW}yay${NC} is ${BLUE}installed${NC}..."
if test -f /usr/bin/yay;
  then
    echo -e "${YELLOW}yay${NC} already ${BLUE}installed${NC}."
  else
    mkdir .temp
    cd .temp
    git clone https://aur.archlinux.org/yay.git
    echo "checking if ${YELLOW}yay${NC} is ${BLUE}installed${NC}..."
    echo "Directory ${YELLOW}yay${NC} does not exist."
    echo "Installing ${YELLOW}yay${NC}..."
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf .temp
fi

# checking and installing packages from yay
if test -f /usr/share/fonts/TTF/FiraCodeNerdFont-Regular.ttf;
  then
    echo -e "${GREEN}nerd-fonts-fira-code${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}nerd-fonts-fira-code${NC} could not be found"
    packages = "$packages nerd-fonts-fira-code"
fi

if yay -Q swayfx &> /dev/null;
  then
    echo -e "${GREEN}swayfx${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}swayfx${NC} could not be found"
    packages = "$packages swayfx"
fi

if test -f /usr/bin/swaync;
  then
    echo -e "${GREEN}swaync-git${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}swaync-git${NC} could not be found"
    packages = "$packages swaync-git"
fi

if yay -Q xfce-polkit &> /dev/null;
  then
    echo -e "${GREEN}xfce-polkit${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}xfce-polkit${NC} could not be found"
    packages = "$packages xfce-polkit"
fi

if test -f /usr/bin/google-chrome-stable;
  then
    echo -e "${GREEN}google-chrome${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}google-chrome${NC} could not be found"
    packages = "$packages google-chrome"
fi

if test -f /usr/bin/spotify;
  then
    echo -e "${GREEN}spotify${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}spotify${NC} could not be found"
    packages = "$packages spotify"
fi

if test -f /usr/bin/netflix;
  then
    echo -e "${GREEN}netflix${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}netflix${NC} could not be found"
    packages = "$packages netflix"
fi

if test -f /usr/bin/primevideo;
  then
    echo -e "${GREEN}primevideo${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}primevideo${NC} could not be found"
    packages = "$packages primevideo"
fi

if test -f /usr/bin/oh-my-posh;
  then
    echo -e "${GREEN}oh-my-posh${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}oh-my-posh${NC} could not be found"
    echo "installing oh-my-posh..."
    curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d /bin
fi

#installing .config files
echo ""
echo -e "${GREEN}Installing${NC} config files..."
echo ""
if test -d ~/.config; then
  echo -e "Directory ${YELLOW}~/.config${NC} already exist."
else
  echo -e "Directory ${RED}~/.config${NC} does not exist."
  echo "Creating ${GREEN}~/.config...${NC}"
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
sudo cp -r pacman/pacman.conf /etc/
sudo cp -r grub/grub /etc/default/
mv ~/.config/zsh/.zshenv ~/
if test -d /usr/share/sddm/themes; then
  sudo cp -rf sddm_themes/* /usr/share/sddm/themes/
else
  echo "Directory /usr/share/sddm/themes does not exist."
  echo "Creating /usr/share/sddm/themes..."
  sudo mkdir /usr/share/sddm/themes
  sudo cp -rf sddm_themes/* /usr/share/sddm/themes/
fi
echo ""
echo -e "${CYAN}config successfully installed${NC}"

exit 0