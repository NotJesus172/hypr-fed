#!/usr/bin/env bash

#   Sets DNF Config
sudo echo "[main]" > /etc/dnf/dnf.conf
sudo echo "" >> /etc/dnf/dnf.conf
sudo echo "" >> /etc/dnf/dnf.conf
sudo echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf
sudo echo "fastestmirror=true" >> /etc/dnf/dnf.conf
#   Updates initial system packages
sudo dnf -y up
#   Removeing docker packages
sudo dnf -y rm docker
sudo dnf -y rm docker-client
sudo dnf -y rm docker-client-latest
sudo dnf -y rm docker-common
sudo dnf -y rm docker-latest
sudo dnf -y rm docker-latest-logrotate
sudo dnf -y rm docker-logrotate
sudo dnf -y rm docker-selinux
sudo dnf -y rm socker-engine-selinux
sudo dnf -y rm docker-engine
#   Adding rpmfusion Repos
sudo dnf -y in https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y up
#   Adding Docker Repo
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y up
#   Enable COPR Repos
sudo dnf -y copr enable atim/starship #  Starship
sudo dnf -y up
sudo dnf -y copr enable solopasha/hyprland #  Hyprland
sudo dnf -y up
#   Install NerdFonts
sudo dnf -y in unzip
sudo unzip -n CodeNewRoman.zip -d /usr/share/fonts/CodeNewRoman
sudo unzip -n ComicShannsMono.zip -d /usr/share/fonts/ComicShannsMono
sudo unzip -n NedFontsSymbolsOnly.zip -d /usr/share/fonts/NerdFontsSymbolsOnly
sudo unzip -n SpaceMono.zip -d /usr/share/fonts/SpaceMono
#   Install base packages
sudo dnf -y up
sudo dnf -y in curl
sudo dnf -y in kitty
sudo dnf -y in fastfetch
sudo dnf -y in firefox
sudo dnf -y in bash
sudo dnf -y in bash-devel
sudo dnf -y in wget
sudo dnf -y in btop
sudo dnf -y in dolphin
sudo dnf -y in samba-client
sudo dnf -y in cifs-utils
sudo dnf -y in code
sudo dnf -y in tmux
sudo dnf -y in starship
sudo dnf -y in torbrowser-launcher
sudo dnf -y in steam
sudo dnf -y in gqrx
sudo dnf -y in @kde-desktop-environment
sudo dnf -y in sddm
#   Install Docker packages
sudo dnf -y up
sudo dnf -y in docker-ce
sudo dnf -y in docker-ce-cli
sudo dnf -y in containerd.io
sudo dnf -y in docker-buildx-pugin
sudo dnf -y in docker-compose-plugin
#   Adds current user to docker group
sudo usermod -aG docker $USER && newgrp docker
#   Configure Fedora for graphical userspace
sudo systemctl enable sddm
sudo systemctl set-default graphical.target
#   Download Background Wallpaper Files
git clone https://github.com/NotJesus172/backgrounds.git ~/Pictures/backgrounds
#   Install Hyprland and additional dependencies
sudo dnf -y up
sudo dnf -y in hyprland
sudo dnf -y in hyprland-devel
sudo dnf -y in hyprpaper
sudo dnf -y in hypridle
sudo dnf -y in hyprlock
sudo dnf -y in hyprpicker
sudo dnf -y in hyprshot
sudo dnf -y in hyprsunset
sudo dnf -y in NetworkManager
sudo dnf -y in NetworkManager-wifi
sudo dnf -y in NetworkManager-bluetooth
sudo dnf -y in NetworkManager-tui
sudo dnf -y in pipewire
sudo dnf -y in qt5-qtwayland
sudo dnf -y in qt6-qtwayland
sudo dnf -y in cliphist
sudo dnf -y in nwg-clipman
sudo dnf -y in waypaper
sudo dnf -y in waybar
sudo dnf -y in pavucontrol
sudo dnf -y in SwayNotificationCenter
sudo dnf -y in libnotify
sudo dnf -y in libnotify-devel
sudo dnf -y in tuned
sudo dnf -y in tuned-ppd
sudo dnf -y in blueman
sudo dnf -y in gvfs
sudo dnf -y in gvfs-mtp
sudo dnf -y in nm-connection-editor-desktop 
#   Autoremove any unneccecary packages
sudo dnf -y up
sudo dnf -y autoremove
#   Reboot
sudo reboot now

