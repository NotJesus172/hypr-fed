#!/usr/bin/env bash

#   Sets DNF Config
sudo echo echo "[main]" > /etc/dnf/dnf.conf
sudo echo "" >> /etc/dnf/dnf.conf
sudo echo "" >> /etc/dnf/dnf.conf
sudo echo "max_parallel_downloads=12" >> /etc/dnf/dnf.conf
sudo echo "fastestmirror=true" >> /etc/dnf/dnf.conf
#   Updates initial system packages
sudo dnf -y up
#   Adding rpmfusion repositories
sudo dnf -y in https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
#   Install base packages
sudo dnf -y in nano git curl bash bash-devel wget btop fastfetch firefox kitty dolphin code tmux sddm
#   Install NerdFont
sudo unzip CodeNewRoman.zip -d ~/.local/share/fonts/
#   Enable Starship COPR repo
sudo dnf copr enable atim/starship
#   Enable Hyprland COPR repository
sudo dnf copr enable solopasha/hyprland
#   Install Hyprland and additional dependencies
sudo dnf -y in hyprland hyprland-devel hyprpaper hypridle hyprlock hyprpicker hyprshot cliphist nwg-clipman waypaper waybar-git pavucontrol SwayNotificationCenter libnotify libnotify-devel starship


#sudo dnf -y in 
