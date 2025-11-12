#!/usr/bin/env bash

#   Sets DNF Config
sudo echo echo "[main]" > /etc/dnf/dnf.conf
sudo echo "" >> /etc/dnf/dnf.conf
sudo echo "" >> /etc/dnf/dnf.conf
sudo echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf
sudo echo "fastestmirror=true" >> /etc/dnf/dnf.conf
#   Updates initial system packages
sudo dnf -y up
#   Removeing docker packages
sudo dnf -y remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux socker-engine-selinux docker-engine
#   Adding rpmfusion repositories
sudo dnf -y in https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
#   Adding Docker Repo
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
#   Enable COPR Repos
sudo dnf -y copr enable atim/starship #  Starship
sudo dnf -y copr enable solopasha/hyprland #  Hyprland
#   Install NerdFonts
sudo unzip -n CodeNewRoman.zip -d ~/.local/share/fonts/
sudo unzip -n ComicShannsMono.zip -d ~/.local/share/fonts/
sudo unzip -n NedFontsSymbolsOnly.zip -d ~/.local/share/fonts/
sudo unzip -n SpaceMono.zip -d ~/.local/share/fonts/
#   Install base packages
sudo dnf -y in nano curl bash bash-devel wget btop fastfetch firefox kitty dolphin samba-client cifs-utils code tmux sddm starship torbrowser-launcher gqrx
#   Install Docker packages
sudo dnf -y in docker-ce docker-ce-cli containerd.io docker-buildx-pugin docker-compose-plugin
#   Adds current user to docker group
sudo usermod -aG docker $USER && newgrp docker
#   Configure Fedora for graphical userspace
sudo systemctl enable sddm --force
sudo systemctl set-default graphical.target
#   Install Hyprland and additional dependencies
sudo dnf -y in hyprland hyprland-devel hyprpaper hypridle hyprlock hyprpicker hyprshot hyprsunset pipewire qt5-qtwayland qt6-qtwayland cliphist nwg-clipman waypaper waybar-git pavucontrol SwayNotificationCenter libnotify libnotify-devel
#   Autoremove any unneccecary packages
sudo dnf -y autoremove

