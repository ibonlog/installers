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


if ! flatpak list --app | grep -q "com.github.tchx84.Flatseal";
then
    flatpak install flathub com.github.tchx84.Flatseal -y
fi

if ! flatpak list --app | grep -q "io.github.yuki_iptv.yuki-iptv";
then
    flatpak install https://dl.flathub.org/repo/appstream/io.github.yuki\_iptv.yuki-iptv.flatpakref -y
fi

if ! flatpak list --app | grep -q "net.cozic.joplin_desktop";
then
    flatpak install flathub net.cozic.joplin_desktop -y
fi

if ! flatpak list --app | grep -q "com.visualstudio.code";
then
    flatpak install flathub com.visualstudio.code -y
fi

#flatpak install flathub com.sublimemerge.App -y
if ! flatpak list --app | grep -q "com.github.Murmele.Gittyup";
then
    flatpak install flathub com.github.Murmele.Gittyup -y
fi

if ! flatpak list --app | grep -q "eu.betterbird.Betterbird";
then
    flatpak install flathub eu.betterbird.Betterbird -y
fi

if ! flatpak list --app | grep -q "com.bitwarden.desktop";
then
    flatpak install flathub com.bitwarden.desktop -y
fi

if ! flatpak list --app | grep -q "com.slack.Slack";
then
    flatpak install flathub com.slack.Slack -y
fi

if ! flatpak list --app | grep -q "org.kde.krdc";
then
    flatpak install flathub org.kde.krdc -y
fi

if ! flatpak list --app | grep -q "org.gnome.DejaDup";
then
    flatpak install flathub org.gnome.DejaDup -y
fi

if ! flatpak list --app | grep -q "com.github.jeromerobert.pdfarranger";
then
    flatpak install flathub com.github.jeromerobert.pdfarranger -y
fi

if ! flatpak list --app | grep -q "org.videolan.VLC";
then
    flatpak install flathub org.videolan.VLC -y
fi

if ! flatpak list --app | grep -q "com.synology.SynologyDrive";
then
    flatpak install flathub com.synology.SynologyDrive -y
fi




# Flatpak extras

if ! flatpak list --app | grep -q "com.ultimaker.cura";
then
    flatpak install flathub com.ultimaker.cura -y
fi

if ! flatpak list --app | grep -q "com.transmissionbt.Transmission";
then
    flatpak install flathub com.transmissionbt.Transmission -y
fi

if ! flatpak list --app | grep -q "org.telegram.desktop";
then
    flatpak install flathub org.telegram.desktop -y
fi

if ! flatpak list --app | grep -q "org.inkscape.Inkscape";
then
    flatpak install flathub org.inkscape.Inkscape -y
fi

if ! flatpak list --app | grep -q "org.audacityteam.Audacity";
then
    flatpak install flathub org.audacityteam.Audacity -y
fi

if ! flatpak list --app | grep -q "com.obsproject.Studio";
then
    flatpak install flathub com.obsproject.Studio -y
fi
