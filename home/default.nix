{ pkgs, config, lib, home-manager, ... }:

{
  # https://nix-community.github.io/home-manager/options.html
  imports = [
    ./direnv
    ./git
    ./zsh
  ];

  config = {
    home.stateVersion = "23.05"; # Please read the comment before changing.

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    fonts.fontconfig.enable = true;

    home.file."./dotfiles/.vimrc".source = ./Users/mathias/.vimrc;
    home.file."/dotfiles/.zshrc".source = ./Users/mathias/.zshrc;

    home.sessionVariables = {
      EDITOR = "vim";
    };
  };
}
