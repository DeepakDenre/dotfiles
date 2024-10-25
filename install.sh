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
CHECK='\xE2\x9C\x94'
CROSS='\xE2\x9D\x8C'

# stopping the script if run as root
if [ "$EUID" -eq 0 ]; then
  echo -e "${RED}Please do not run this script as root.${NC}"
  exit 1
fi

# checking is pacman is installed
if test -f /usr/bin/pacman; then
    echo -e "${YELLOW}pacman${NC} already ${BLUE}installed${NC}."
else
  echo -e "${BLUE}pacman${NC} is ${RED}not installed${NC}."
  echo -e "Please install ${BLUE}pacman${NC} before running this script."
  exit 1
fi
#packages="" is a array of packages that are not installed

# checking and installing yay
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
echo ""

packages=""

if test -f /usr/bin/i3;
  then
    echo -e "${GREEN}${CHECK} i3${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} i3${NC} could not be found"
    packages="$packages i3"
fi

if test -f /usr/bin/pavucontrol;
  then
    echo -e "${GREEN}${CHECK} pavucontrol${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} pavucontrol${NC} could not be found"
    packages="$packages pavucontrol"
fi

if test -f /usr/bin/wofi;
  then
    echo -e "${GREEN}${CHECK} wofi${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} wofi${NC} could not be found"
    packages="$packages wofi"
fi

if test -f /usr/bin/kitty;
  then
    echo -e "${GREEN}${CHECK} kitty${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} kitty${NC} could not be found"
    packages="$packages kitty"
fi

if test -f /usr/bin/zsh;
  then
    echo -e "${GREEN}${CHECK} zsh${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} zsh${NC} could not be found"
    packages="$packages zsh"
fi

if test -f /usr/bin/waybar;
  then
    echo -e "${GREEN}${CHECK} waybar${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} waybar${NC} could not be found"
    packages="$packages waybar"
fi

if test -f /usr/bin/wlogout;
  then
    echo -e "${GREEN}${CHECK} wlogout${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} wlogout${NC} could not be found"
    packages="$packages wlogout"
fi

if test -f /usr/bin/sddm;
  then
    echo -e "${GREEN}${CHECK} sddm${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} sddm${NC} could not be found"
    packages="$packages sddm"
fi

if test -f /usr/bin/swaybg;
  then
    echo -e "${GREEN}${CHECK} swaybg${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} swaybg${NC} could not be found"
    packages="$packages swaybg"
fi

if test -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh;
  then
    echo -e "${GREEN}${CHECK} zsh-syntax-highlighting${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} zsh-syntax-highlighting${NC} could not be found"
    packages="$packages zsh-syntax-highlighting"
fi

if test -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh;
  then
    echo -e "${GREEN}${CHECK} zsh-autosuggestions${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} zsh-autosuggestions${NC} could not be found"
    packages="$packages zsh-autosuggestions"
fi

# checking and installing packages from yay
if test -f /usr/share/fonts/TTF/FiraCodeNerdFont-Regular.ttf;
  then
    echo -e "${GREEN}${CHECK} nerd-fonts-fira-code${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} nerd-fonts-fira-code${NC} could not be found"
    packages="$packages nerd-fonts-fira-code"
fi

if yay -Q swayfx &> /dev/null;
  then
    echo -e "${GREEN}${CHECK} swayfx${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} swayfx${NC} could not be found"
    packages="$packages swayfx"
fi

if test -f /usr/bin/swaync;
  then
    echo -e "${GREEN}${CHECK} swaync-git${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} swaync-git${NC} could not be found"
    packages="$packages swaync-git"
fi

if yay -Q xfce-polkit &> /dev/null;
  then
    echo -e "${GREEN}${CHECK} xfce-polkit${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} xfce-polkit${NC} could not be found"
    packages="$packages xfce-polkit"
fi

if test -f /usr/bin/google-chrome-stable;
  then
    echo -e "${GREEN}${CHECK} google-chrome${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} google-chrome${NC} could not be found"
    packages="$packages google-chrome"
fi

if test -f /usr/bin/spotify;
  then
    echo -e "${GREEN}${CHECK} spotify${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} spotify${NC} could not be found"
    packages="$packages spotify"
fi

if test -f /usr/bin/netflix;
  then
    echo -e "${GREEN}${CHECK} netflix${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} netflix${NC} could not be found"
    packages="$packages netflix"
fi

if test -f /usr/bin/primevideo;
  then
    echo -e "${GREEN}${CHECK} primevideo${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} primevideo${NC} could not be found"
    packages="$packages primevideo"
fi

if test -f /usr/bin/unzip;
  then
    echo -e "${GREEN}${CHECK} unzip${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} unzip${NC} could not be found"
    packages="$packages unzip"
fi

if test -f /usr/bin/oh-my-posh;
  then
    echo -e "${GREEN}${CHECK} oh-my-posh${NC} already ${BLUE}installed${NC}."
  else
    echo -e "${RED}${CROSS} oh-my-posh${NC} could not be found"
    echo "installing oh-my-posh..."
    curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d /bin
fi

if [[ $packages ]];
  then
    echo -e "packages to be installed ${BLUE}$packages${NC}"
    echo -e "${YELLOW}Are you sure? [Yy/Nn]:${NC}"
    read -p "" -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      echo -e "Installing packages ${GREEN}$packages${NC}..."
      echo ""
      yay -S --noconfirm $packages
    else
      echo "Not installing packages, config may not work properly"
    fi
  else
    echo -e "All packages are already ${CYAN}installed${NC}."
fi

#installing .config files
echo ""
echo -e "${GREEN}Installing${NC} config files..."
if test -d ~/.config; then
  echo -e "${GREEN}Directory ${YELLOW}~/.config${NC} already exist."
else
  echo -e "Directory ${RED}~/.config${NC} does not exist."
  echo "Creating ${GREEN}~/.config...${NC}"
  mkdir ~/.config
fi

# installing i3 config file
echo -e "${GREEN}copying ${BLUE}i3${GREEN} config files...${NC}"
cp -rv i3 ~/.config/ > /dev/null

# installing kitty config file
echo -e "${GREEN}copying ${BLUE}kitty${GREEN} config files...${NC}"
cp -rv kitty ~/.config/ > /dev/null

# installing wallpaper files
echo -e "${GREEN}copying ${BLUE}wallpaper${GREEN} files...${NC}"
cp -rv Wallpaper ~/.config/ > /dev/null

# installing waybar config file
echo -e "${GREEN}copying ${BLUE}waybar${GREEN} config files...${NC}"
cp -rv waybar ~/.config/ > /dev/null

# installing wlogout config file
echo -e "${GREEN}copying ${BLUE}wlogout${GREEN} config files...${NC}"
cp -rv wlogout ~/.config/ > /dev/null

# installing wofi config file
echo -e "${GREEN}copying ${BLUE}wofi${GREEN} config files...${NC}"
cp -rv wofi ~/.config/ > /dev/null

# installing zsh config file
echo -e "${GREEN}copying ${BLUE}zsh${GREEN} config files...${NC}"
cp -rv ./zsh ~/.config/ > /dev/null
mv ~/.config/zsh/.zshenv ~/  > /dev/null

# installing pacman config file
echo -e "${GREEN}copying ${BLUE}pacman${GREEN} config files...${NC}"
sudo cp -rv ./pacman/pacman.conf /etc/ > /dev/null

# installing grub config file
echo -e "${GREEN}copying ${BLUE}grub${GREEN} config files...${NC}"
sudo cp -rv ./grub/grub /etc/default/ > /dev/null

# installing sddm theme file
if test -d /usr/share/sddm/themes; then
  echo -e "${GREEN}copying ${BLUE}sddm theme${GREEN} files...${NC}"
  sudo cp -rv sddm/sddm_themes/* /usr/share/sddm/themes/ > /dev/null
else
  echo -e "${RED}Directory /usr/share/sddm/themes does not exist.${NC}"
  echo "${GREEN}Creating /usr/share/sddm/themes...${NC}"
  sudo mkdir /usr/share/sddm/themes > /dev/null
  echo -e "${GREEN}copying ${BLUE}sddm themes${GREEN} config files...${NC}"
  sudo cp -rv sddm/sddm_themes/* /usr/share/sddm/themes/ > /dev/null
fi

# installing sddm config file
echo -e "${GREEN}copying ${BLUE}sddm config${GREEN} files...${NC}"
sudo cp -rv sddm/default.conf /usr/lib/sddm/sddm.conf.d/ > /dev/null
echo ""
echo -e "${CYAN}config successfully installed${NC}"

#enable system variable
sudo systemctl enable sddm > /dev/null

exit 0