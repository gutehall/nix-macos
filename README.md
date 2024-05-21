# nix-macos

This repo contains my config for Nix on macOS.

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
This repository leverages the power of Nix and nix-darwin to manage the macOS configuration declaratively. By using Nix flakes, we ensure that the configuration is reproducible and version-controlled.

## Prerequisites
Ensure that you have Nix installed on your macOS system. I've used Determinate Nix Installer and you can find the instructions and download link [here](https://determinate.systems/oss/).

