{ lib, config, ... }:

{
  programs.zsh.shellAliases = {
    rrc = "source ~/.zshenv && source ~/.zshrc";
    sw = "darwin-rebuild switch --flake ~/.config/nix";

    dev = "nix develop -c $SHELL";

    jgi = "jj init --git-repo=.";

    gcam = "git commit -am";
    gp = "git push";
    gs = "git status";
    gst = "git stash";
    gd = "git diff";
    gpl = "git pull";
    gcaa = "git commit -a --amend --no-edit";
  };

  programs.zsh.shellFunctions = {
    gmk = ''
      git branch $1 
      git switch $1'';
  };
}
