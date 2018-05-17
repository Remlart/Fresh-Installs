#!/bin/bash 

#Script meant to automate the install of a usable 2bwm system for Void Linux from base install.
sudo xbps-install -Suv -y

sudo xbps-install -S -y \

#List of packages

xorg \
rxvt-unicode \
dmenu \
feh \
hsetroot \
xdotool \
zsh \
xtools \
xclip \
dunst \

#pywal and depends
pywal \
ImageMagick \

youtube-dl \
mpv \
compton \
firefox \
alsa-tools \
alsa-utils \
lemonbar \
ranger \

#xcb 2bwm depends
libxcb-devel \
xcb-util-keysyms-devel \
xcb-util-wm-devel \
xcb-util-xrm-devel \

#Another update for good measure

sudo xbps-install -Suv -y

#git downloads

cd ~
git clone https://www.github.com/venam/2bwm
cd ~
git clone https://www.github.com/Angry-Man/dotfiles
cd ~
git clone https://www.github.com/Angry-Man/scripts
cd ~
git clone https://www.github.com/Angry-Man/sys-comps
cd ~

#Consolidating updated 2bwm with my config

cp ~/dotfiles/2bwm/config.h ~/sys-comps/2bwm/config.h

mv ~/dotfiles/2bwm ~/sys-comps

#Making git files excecutables

cd ~ 

chmod +x ~/scripts/theming/rldrsc_bspwm
chmod +x ~/scripts/theming/rldrsc_twobwm
chmod +x ~/scripts/theming/theme_changer
chmod +x ~/scripts/theming/wpset

chmod +x ~/sys-comps/bar/bar1.sh
chmod +x ~/sys-comps/bar/barmaster.sh

chmod +x ~/sys-comps/dmenu.sh

chmod +x ~/sys-comps/dunshset.sh

#Compiling and installing 2bwm

cd ~/sys-comps/2bwm
sudo make && sudo make install

#Use stow to symlink all dotfiles

cd ~/dotfiles

stow dunst
stow zsh
stow Xres
stow neofetch
stow wal

#Another update for good measure

sudo xbps-install -Suv -y

echo "Done ...maybe."

#END