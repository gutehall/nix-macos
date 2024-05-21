{ pkgs, config, lib, home-manager, ... }:

{
  imports = [
    ./git
    ./zsh
    ./vim
    ./vscode
  ];

  config = {
    home.stateVersion = "23.11";

    programs.home-manager.enable = true;

    fonts.fontconfig.enable = true;

    home.file."./dotfiles/.vimrc".source = ./Users/mathias/.vimrc;
    home.file."./dotfiles/.zshrc".source = ./Users/mathias/.zshrc;
    home.file."./dotfiles/Default.json".source = ./Users/mathias/Documents/Default.json;
    home.file."./dotfiles/Hotkey.json".source = ./Users/mathias/Documents/Hotkey.json;
    home.file."./dotfiles/com.googlecode.iterm2.plist".source = ./Users/mathias/Documents/com.googlecode.iterm2.plist;
    home.file."./dotfiles/bullet-train.zsh-theme".source = ./Users/mathias/.oh-my-zsh/themes/bullet-train.zsh-theme;

    home.sessionVariables = {
      EDITOR = "vim";
    };
  };
}
