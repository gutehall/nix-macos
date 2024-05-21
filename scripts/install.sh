#!/bin/bash

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
