# Nix on macOS my way

This repo contains my config for Nix on macOS. The code is still work in progress so there will be bugs, sorry about that.

## Installation

To set up your system using this configuration, you can use the following commands.

First, run in order to activate the configuration:

```bash
nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/<WhereTheConfigIsLocated>
```

Then rebuild the system:

```bash
darwin-rebuild switch --flake ~/<WhereTheConfigIsLocated>
```

## Overview
This repository leverages the power of Nix and nix-darwin to manage the macOS configuration declaratively. By using [Nix flakes](https://nixos.wiki/wiki/Flakes), we ensure that the configuration is reproducible and version-controlled.

## Prerequisites
Ensure that you have Nix installed on your macOS system. I've used Determinate Nix Installer and you can find the instructions and download link [here](https://determinate.systems/oss/). The [install script](https://github.com/gutehall/nix-macos/blob/main/scripts/install.sh) will help you install XCode, Rosetta and clone some repos that I use.

