#!/bin/bash

# Paths
VIMRC_PATH=~/.vim_runtime
ZSH_CUSTOM_PLUGINS=~/.oh-my-zsh/custom/plugins
SOURCES_PATH=./sources
NIXOS_CONFIG_PATH=~/nixos
BACKUP_PATH=/etc/nixos.bak

# Install Xcode Command Line Tools
if ! xcode-select -p &>/dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    # Wait until the installation is complete
    until xcode-select -p &>/dev/null; do
        sleep 5
    done
fi

# Install Rosetta (if on Apple Silicon)
if [[ "$(uname -m)" == "arm64" ]]; then
    echo "Installing Rosetta..."
    /usr/sbin/softwareupdate --install-rosetta --agree-to-license
fi

# Remove .oh-my-zsh if it exists
if [ -d "$HOME/.oh-my-zsh" ]; then
    rm -rf "$HOME/.oh-my-zsh"
fi

# Clone repositories
clone_repositories() {
    declare -A repositories=(
        ["https://github.com/amix/vimrc.git"]=$VIMRC_PATH
        ["https://github.com/zsh-users/zsh-autosuggestions"]=$ZSH_CUSTOM_PLUGINS/zsh-autosuggestions
        ["https://github.com/zsh-users/zsh-syntax-highlighting.git"]=$ZSH_CUSTOM_PLUGINS/zsh-syntax-highlighting
        ["https://github.com/MohamedElashri/exa-zsh"]=$ZSH_CUSTOM_PLUGINS/exa-zsh
    )

    for repo_url in "${!repositories[@]}"; do
        destination="${repositories[$repo_url]}"
        git clone --depth=1 "$repo_url" "$destination"
    done
}

# Clone repositories in parallel
clone_repositories &

# Install Oh My Zsh if not already installed
if [ ! -d "$ZSH_CUSTOM" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Backup and link NixOS configuration
sudo cp /etc/nixos/hardware-configuration.nix "$NIXOS_CONFIG_PATH"
sudo mv /etc/nixos "$BACKUP_PATH"
sudo ln -s "$NIXOS_CONFIG_PATH" /etc/nixos

# Rebuild NixOS
# sudo nixos-rebuild switch

# Wait for parallel processes to finish
wait
