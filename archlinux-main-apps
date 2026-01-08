#!/bin/sh

sudo pacman -Syu --noconfirm


# Apps

if ! command -v flatpak >/dev/null 2>&1
then
    curl -fsS https://dl.brave.com/install.sh | sh

    sudo pacman -S virtualbox virtualbox-host-modules-arch --noconfirm
    sudo gpasswd -a $USER vboxusers

    sudo pacman -S timeshift --noconfirm

    sudo pacman -S docker docker-compose docker-buildx --noconfirm
    sudo systemctl start docker.service
    sudo systemctl enable docker.service
    sudo usermod -aG docker $USER



    # Flatpak main

    #sudo pacman -S flatpak plasma-discover-backend-flatpak --noconfirm
    sudo pacman -S flatpak --noconfirm
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    echo "System needs to be rebooted to finalize installation of some apps. When ready, please run the script again."
    read -p "Press enter to reboot..." && reboot

fi




# Flatpak apps

flatpak install flathub com.github.tchx84.Flatseal -y

flatpak install https://dl.flathub.org/repo/appstream/io.github.yuki\_iptv.yuki-iptv.flatpakref -y

flatpak install flathub net.cozic.joplin_desktop -y

flatpak install flathub com.visualstudio.code -y

flatpak install flathub com.sublimemerge.App -y
flatpak install flathub com.github.Murmele.Gittyup -y

flatpak install flathub eu.betterbird.Betterbird -y

flatpak install flathub com.bitwarden.desktop -y

flatpak install flathub org.kde.krdc -y

flatpak install flathub org.mozilla.firefox -y

flatpak install flathub org.gnome.DejaDup -y

flatpak install flathub com.github.jeromerobert.pdfarranger -y

flatpak install flathub org.videolan.VLC -y

flatpak install flathub com.synology.SynologyDrive -y




# Flatpak extras

flatpak install flathub com.ultimaker.cura -y

flatpak install flathub com.transmissionbt.Transmission -y

flatpak install flathub org.telegram.desktop -y

flatpak install flathub org.inkscape.Inkscape -y

flatpak install flathub org.audacityteam.Audacity -y

flatpak install flathub com.obsproject.Studio -y
