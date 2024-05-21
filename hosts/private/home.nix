{ pkgs, ... }:

{
  imports = [
    ../../home
  ];

  homebrew = import ./homebrew.nix // { enable = true; };

  home.packages = with pkgs; [
      vim
      openssh
      python3
      gh
      curl
      git
      wget
      tmux
      htop
      btop
      tree
      minikube
      k9s
      azure-cli
      awscli2
      unzip
      zsh
      eza
      docker
      docker-compose
      lazydocker
      nodejs_18
      terraform
      packer
      vagrant
      ansible
      tfsec
      qemu
      infracost
      tailscale
      vscode
      iterm2
      raycast
      utm
      dropbox
      spotify
      cyberduck
      minecraft
      google-chrome
      transmission
    ];
}
