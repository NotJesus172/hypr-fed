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
#   Enable COPR Repos
sudo dnf -y copr enable atim/starship #  Starship
sudo dnf -y copr enable solopasha/hyprland #  Hyprland
#   Install NerdFonts
sudo unzip -n CodeNewRoman.zip -d ~/.local/share/fonts/
sudo unzip -n ComicShannsMono.zip -d ~/.local/share/fonts/
sudo unzip -n NedFontsSymbolsOnly.zip -d ~/.local/share/fonts/
sudo unzip -n SpaceMono.zip -d ~/.local/share/fonts/
#   Install base packages
sudo dnf -y in nano git curl bash bash-devel wget btop fastfetch firefox kitty dolphin code tmux sddm starship
#   Install Hyprland and additional dependencies
sudo dnf -y in hyprland hyprland-devel hyprpaper hypridle hyprlock hyprpicker hyprshot cliphist nwg-clipman waypaper waybar-git pavucontrol SwayNotificationCenter libnotify libnotify-devel

