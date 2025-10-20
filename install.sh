#!/usr/bin/env bash

sudo echo echo "[main]" > /etc/dnf/dnf.conf
sudo echo "" >> /etc/dnf/dnf.conf
sudo echo "" >> /etc/dnf/dnf.conf
sudo echo "max_parallel_downloads=16" >> /etc/dnf/dnf.conf
sudo echo "fastestmirror=true" >> /etc/dnf/dnf.conf

sudo dnf -y up
sudo dnf -y in https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf -y in nano git curl bash bash-devel wget btop fastfetch firefox kitty dolphin code tmux sddm
sudo dnf copr enable atim/starship
sudo dnf copr enable solopasha/hyprland
sudo dnf -y in hyprland hyprland-devel hyprpaper hypridle hyprlock hyprpicker hyprshot cliphist nwg-clipman waypaper waybar-git pavucontrol SwayNotificationCenter libnotify libnotify-devel starship


#sudo dnf -y in 
