#!/bin/bash

# ============================================
# JustAGuy Linux - DWM Automated Setup Script
# https://github.com/drewgrif
# ============================================

LOG_FILE="$HOME/justaguylinux-install.log"
exec > >(tee -a "$LOG_FILE") 2>&1

CLONED_DIR="$HOME/dwm-setup"
CONFIG_DIR="$HOME/.config/suckless"
INSTALL_DIR="$HOME/installation"
GTK_THEME="https://github.com/vinceliuice/Orchis-theme.git"
ICON_THEME="https://github.com/vinceliuice/Colloid-icon-theme.git"

command_exists() {
    command -v "$1" &>/dev/null
}


# ============================================
# Error Handling
# ============================================
die() {
    echo "ERROR: $*" >&2
    exit 1
}

# ============================================
# Confirm User Intention
# ============================================
clear
echo "
 +-+-+-+-+-+-+-+-+-+-+-+-+-+ 
 |j|u|s|t|a|g|u|y|l|i|n|u|x| 
 +-+-+-+-+-+-+-+-+-+-+-+-+-+ 
 |d|w|m| | | | |s|c|r|i|p|t|  
 +-+-+-+-+-+-+-+-+-+-+-+-+-+                                                                            
"

echo "This script will install and configure DWM on your Debian system."
read -p "Do you want to continue? (y/n) " confirm
[[ ! "$confirm" =~ ^[Yy]$ ]] && die "Installation aborted."

# ============================================
# Install Nala First
# ============================================
echo "Installing nala..."
sudo apt update
sudo apt install -y nala || die "Failed to install nala."

# ============================================
# Create Installation Directory
# ============================================
mkdir -p "$INSTALL_DIR" || die "Failed to create installation directory."

# Cleanup installation directory on exit
cleanup() {
    rm -rf "$INSTALL_DIR"
    echo "Installation directory removed."
}
trap cleanup EXIT

# ============================================
# Install Required Packages
# ============================================
install_packages() {
    echo "Installing required packages..."
    sudo nala install -y xorg xbacklight xbindkeys xvkbd xinput build-essential bspwm sxhkd polybar network-manager network-manager-gnome pamixer thunar thunar-archive-plugin thunar-volman file-roller lxappearance dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends xfce4-power-manager pavucontrol pamixer pulsemixer feh fonts-recommended fonts-font-awesome fonts-terminus ttf-mscorefonts-installer papirus-icon-theme exa flameshot qimgv rofi dunst libnotify-bin xdotool unzip libnotify-dev firefox-esr geany geany-plugin-addons geany-plugin-git-changebar geany-plugin-spellcheck geany-plugin-treebrowser geany-plugin-markdown geany-plugin-insertnum geany-plugin-lineoperations geany-plugin-automark pipewire-audio nala micro xdg-user-dirs-gtk tilix --install-recommends arctica-greeter || echo "Warning: Package installation failed."
    echo "Package installation completed."
  } 
 
install_reqs() {
    echo "Updating package lists and installing required dependencies..."
    sudo nala install -y build-essential cmake meson ninja-build git wget curl libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev libxext-dev uthash-dev libgtk-4-dev libadwaita-1-dev pkg-config || { echo "Package installation failed."; exit 1; }
}


# ============================================
# Enable System Services
# ============================================
enable_services() {
    echo "Enabling required services..."
    sudo systemctl enable avahi-daemon || echo "Warning: Failed to enable avahi-daemon."
    sudo systemctl enable acpid || echo "Warning: Failed to enable acpid."
}

# ============================================
# Set Up User Directories
# ============================================
setup_user_dirs() {
    xdg-user-dirs-update
    mkdir -p ~/Screenshots/
}

# ============================================
# Check for Existing DWM Config
# ============================================
check_dwm() {
    if [ -d "$CONFIG_DIR" ]; then
        echo "An existing ~/.config/suckless directory was found."
        read -p "Backup existing configuration? (y/n) " response
        if [[ "$response" =~ ^[Yy]$ ]]; then
            backup_dir="$HOME/.config/suckless_backup_$(date +%Y-%m-%d_%H-%M-%S)"
            mv "$CONFIG_DIR" "$backup_dir" || die "Failed to backup existing config."
            echo "Backup saved to $backup_dir"
        fi
    fi
}

# Ensure /usr/share/xsessions directory exists
if [ ! -d /usr/share/xsessions ]; then
    sudo mkdir -p /usr/share/xsessions
    if [ $? -ne 0 ]; then
        echo "Failed to create /usr/share/xsessions directory. Exiting."
        exit 1
    fi
fi

# Write dwm.desktop file
cat > ./temp << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=dwm
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession
EOF
sudo cp ./temp /usr/share/xsessions/dwm.desktop
rm ./temp

# ============================================
# Move Config Files
# ============================================
setup_dwm_config() {
    mkdir -p "$CONFIG_DIR"
    for dir in dwm st slstatus dunst fonts picom rofi scripts sxhkd wallpaper; do
        cp -r "$CLONED_DIR/suckless/$dir" "$CONFIG_DIR/" || echo "Warning: Failed to copy $dir."
    done

    for component in dwm slstatus st; do
        cd "$CONFIG_DIR/$component" || die "Failed to enter $component directory."
        make
        sudo make clean install || die "Failed to install $component."
    done
}

# ============================================
# Install ft-picom
# ============================================
install_ftlabs_picom() {
	if command_exists picom; then
        echo "Picom is already installed. Skipping installation."
        return
    fi
	
    git clone https://github.com/FT-Labs/picom "$INSTALL_DIR/picom" || die "Failed to clone Picom."
    cd "$INSTALL_DIR/picom"
    meson setup --buildtype=release build
    ninja -C build
    sudo ninja -C build install
}

# ============================================
# Install Fastfetch
# ============================================
install_fastfetch() {
	if command_exists fastfetch; then
        echo "Fastfetch is already installed. Skipping installation."
        return
    fi	
	
    git clone https://github.com/fastfetch-cli/fastfetch "$INSTALL_DIR/fastfetch" || die "Failed to clone Fastfetch."
    cd "$INSTALL_DIR/fastfetch"
    cmake -S . -B build
    cmake --build build
    sudo mv build/fastfetch /usr/local/bin/
}

# ============================================
# Install Ghostty
# ============================================
install_myghostty() {
	if command_exists ghostty; then
        echo "Ghostty is already installed. Skipping installation."
        return
    fi
	
    git clone https://github.com/drewgrif/myghostty "$INSTALL_DIR/myghostty" || die "Failed to clone Ghostty."
    bash "$INSTALL_DIR/myghostty/install_ghostty.sh"
    mkdir -p "$HOME/.config/ghostty"
    cp "$INSTALL_DIR/myghostty/config" "$HOME/.config/ghostty/" || die "Failed to copy Ghostty config."
}

# ============================================
# Install Fonts
# ============================================
install_fonts() {
    mkdir -p ~/.local/share/fonts
    fonts=( "FiraCode" "Hack" "JetBrainsMono" "RobotoMono" "SourceCodePro" "UbuntuMono" )
    for font in "${fonts[@]}"; do
        wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/$font.zip" -P /tmp
        unzip -q /tmp/$font.zip -d ~/.local/share/fonts/$font/
        rm /tmp/$font.zip
    done
    cp ~/.config/suckless/fonts/* ~/.local/share/fonts/
    fc-cache -f
}

# ============================================
# Install GTK Theme & Icons
# ============================================
install_theming() {
    git clone "$GTK_THEME" "$INSTALL_DIR/Orchis-theme"
    cd "$INSTALL_DIR/Orchis-theme"
    yes | ./install.sh -c dark -t teal orange --tweaks black

    git clone "$ICON_THEME" "$INSTALL_DIR/Colloid-icon-theme"
    cd "$INSTALL_DIR/Colloid-icon-theme"
    ./install.sh -t teal orange -s default gruvbox everforest
}

# ============================================
# Apply GTK Theme
# ============================================
change_theming() {
cat <<EOF > ~/.config/gtk-3.0/settings.ini
[Settings]
gtk-theme-name=Orchis-Teal-Dark
gtk-icon-theme-name=Colloid-Teal-Everforest-Dark
gtk-font-name=Sans 10
EOF
}

# ============================================
# Replace .bashrc
# ============================================
replace_bashrc() {
    read -p "Replace your .bashrc with justaguylinux .bashrc? (y/n) " response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        wget -O ~/.bashrc https://raw.githubusercontent.com/drewgrif/jag_dots/main/.bashrc
        source ~/.bashrc
    fi
}

# ============================================
# Main Execution
# ============================================
install_packages
install_reqs
enable_services
setup_user_dirs
check_dwm
setup_dwm_config
install_ftlabs_picom
install_fastfetch
install_myghostty
install_fonts
install_theming
change_theming
replace_bashrc

echo "All installations completed successfully!"
