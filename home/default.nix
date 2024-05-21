{ pkgs, config, lib, home-manager, ... }:

{
  imports = [
    ./direnv
    ./git
    ./zsh
    ./vim
  ];

  config = {
    home.stateVersion = "23.11";

    programs.home-manager.enable = true;

    fonts.fontconfig.enable = true;

    home.file."./dotfiles/.vimrc".source = ./Users/mathias/.vimrc;
    home.file."/dotfiles/.zshrc".source = ./Users/mathias/.zshrc;

    home.sessionVariables = {
      EDITOR = "vim";
    };
  };
}
