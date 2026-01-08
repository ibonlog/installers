#!/bin/bash

sudo pacman -Syu --noconfirm


# Apps

curl -fsS https://dl.brave.com/install.sh | sh

if ! command -v virtualbox >/dev/null 2>&1
then
    sudo pacman -S virtualbox virtualbox-host-modules-arch --noconfirm
    sudo gpasswd -a $USER vboxusers
fi

if ! command -v timeshift >/dev/null 2>&1
then
    sudo pacman -S timeshift --noconfirm
fi

if ! command -v docker >/dev/null 2>&1
then
    sudo pacman -S docker docker-compose docker-buildx --noconfirm
    sudo systemctl start docker.service
    sudo systemctl enable docker.service
    sudo usermod -aG docker $USER
fi

# Flatpak main
if ! command -v flatpak >/dev/null 2>&1
then
    #sudo pacman -S flatpak plasma-discover-backend-flatpak --noconfirm
    sudo pacman -S flatpak --noconfirm
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    echo "System needs to be rebooted to finalize installation of some apps. When ready, please run the script again."
    read -p "Press enter to reboot..." && reboot
fi


# Flatpak apps

if ! command -v com.github.tchx84.Flatseal >/dev/null 2>&1
then
    flatpak install flathub com.github.tchx84.Flatseal -y
fi

if ! command -v io.github.yuki_iptv.yuki-iptv >/dev/null 2>&1
then
    flatpak install https://dl.flathub.org/repo/appstream/io.github.yuki\_iptv.yuki-iptv.flatpakref -y
fi

if ! command -v net.cozic.joplin_desktop >/dev/null 2>&1
then
    flatpak install flathub net.cozic.joplin_desktop -y
fi

if ! command -v com.visualstudio.code >/dev/null 2>&1
then
    flatpak install flathub com.visualstudio.code -y
fi

#flatpak install flathub com.sublimemerge.App -y
if ! command -v com.github.Murmele.Gittyup >/dev/null 2>&1
then
    flatpak install flathub com.github.Murmele.Gittyup -y
fi

if ! command -v eu.betterbird.Betterbird >/dev/null 2>&1
then
    flatpak install flathub eu.betterbird.Betterbird -y
fi

if ! command -v com.bitwarden.desktop >/dev/null 2>&1
then
    flatpak install flathub com.bitwarden.desktop -y
fi

if ! command -v com.slack.Slack >/dev/null 2>&1
then
    flatpak install flathub com.slack.Slack -y
fi

if ! command -v org.kde.krdc >/dev/null 2>&1
then
    flatpak install flathub org.kde.krdc -y
fi

if ! command -v org.gnome.DejaDup >/dev/null 2>&1
then
    flatpak install flathub org.gnome.DejaDup -y
fi

if ! command -v com.github.jeromerobert.pdfarranger >/dev/null 2>&1
then
    flatpak install flathub com.github.jeromerobert.pdfarranger -y
fi

if ! command -v org.videolan.VLC >/dev/null 2>&1
then
    flatpak install flathub org.videolan.VLC -y
fi

if ! command -v com.synology.SynologyDrive >/dev/null 2>&1
then
    flatpak install flathub com.synology.SynologyDrive -y
fi




# Flatpak extras

if ! command -v com.ultimaker.cura >/dev/null 2>&1
then
    flatpak install flathub com.ultimaker.cura -y
fi

if ! command -v com.transmissionbt.Transmission >/dev/null 2>&1
then
    flatpak install flathub com.transmissionbt.Transmission -y
fi

if ! command -v org.telegram.desktop >/dev/null 2>&1
then
    flatpak install flathub org.telegram.desktop -y
fi

if ! command -v org.inkscape.Inkscape >/dev/null 2>&1
then
    flatpak install flathub org.inkscape.Inkscape -y
fi

if ! command -v org.audacityteam.Audacity >/dev/null 2>&1
then
    flatpak install flathub org.audacityteam.Audacity -y
fi

if ! command -v com.obsproject.Studio >/dev/null 2>&1
then
    flatpak install flathub com.obsproject.Studio -y
fi
