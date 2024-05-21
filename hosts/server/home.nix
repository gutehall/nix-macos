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
      iterm2
      utm
    ];
}
