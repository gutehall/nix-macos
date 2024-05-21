{ pkgs, ... }:

{
  imports = [
    ../../home
  ];

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
      podman
      podman-compose
      podman-desktop
      nodejs_18
      terraform
      packer
      vagrant
      ansible
      tfsec
      qemu
      infracost
      tailscale
      slack-cli
      slack
      vscode
      iterm2
      raycast
      utm
      dropbox
      spotify
      cyberduck
      google-chrome
    ];
}
