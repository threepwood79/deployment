#!/bin/sh

echo "Welcome to FreeBSD Installation Menu"
echo "1. Install Gnome"
echo "2. Install KDE"
echo "3. Install i3wm"
echo "4. Quit"

read -p "Please select an option (1-4): " choice

case $choice in
1)
    echo "Installing Gnome..."
    pkg install -y xorg
    pkg install -y gnome
    pkg install -y alsa-utils
    pkg install -y zip
    ;;

2)
    echo "Installing KDE..."
    pkg install -y xorg
    pkg install -y  kde plasma5
    pkg install -y alsa-utils
    pkg install -y zip
    ;;

3)
    echo "Installing i3wm..."
    pkg install -y xorg
    pkg install -y i3 i3status i3lock dmenu i3-gaps
    pkg install -y ant-dracula-theme-2.0
    pkg install -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
    pkg install -y lxappearance
    pkg install -y compton compton-conf
    pkg install -y arandr
    pkg install -y volumeicon
    pkg install -y alsa-utils
    pkg install -y nitrogen
    pkg install -y pcmanfm
    pkg install -y lxmenu-data
    pkg install -y zip
    ;;

4)
    echo "Quitting..."
    exit
    ;;

*)
    echo "Invalid option, please select a valid option."
    ;;
esac

read -p "Do you need to install Intel or Nvidia video drivers? [y/N]: " video_choice

case $video_choice in
[yY])
    echo "Installing video drivers..."
    pkg install -y drm-kmod
    pkg install -y nvidia-driver-470
    sysrc moused_enable="YES" dbus_enable="YES" hald_enable="YES" ntpd_enable="YES" kld_list="/boot/modules/i915kms.ko" kld_list="i915kms" lightdm_enable="YES" kld_list="nvidia" kld_list="linux nvidia" kld_list="nvidia-modeset" kld_modset_name="nvidia-modeset"
    ;;
[nN])
    echo "Skipping video driver installation."
    ;;

*)
    echo "Invalid option, skipping video driver installation."
    ;;
esac

read -p "Do you need to install additional applications? [y/N]: " app_choice

case $app_choice in
[yY])
    echo "Installing Firefox and Chromium..."
    pkg install -y firefox
    pkg install -y chromium
    ;;

[nN])
    echo "Skipping application installation."
    ;;

*)
    echo "Invalid option, quitting."
    exit
    ;;
esac

read -p "Installation complete. Would you like to reboot now? [y/N]: " reboot_choice

case $reboot_choice in
[yY])
    echo "Rebooting now..."
    sudo reboot
    ;;

[nN])
    echo "Exiting..."
    exit
    ;;

*)
    echo "Invalid option, quitting."
    exit
    ;;
esac
