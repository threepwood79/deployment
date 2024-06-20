#!/bin/bash

echo "Welcome to FreeBSD Installation Menu"
echo "1. Install Gnome"
echo "2. Install KDE"
echo "3. Install i3wm"
echo "4. Quit"

read -p "Please select an option (1-4): " choice

case $choice in
1)
    echo "Installing Gnome..."
    sudo pkg install gnome3
    ;;

2)
    echo "Installing KDE..."
    sudo pkg install kde plasma5
    ;;

3)
    echo "Installing i3wm..."
    sudo pkg install i3
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
    # Command to install video drivers
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
    sudo pkg install firefox chromium
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
