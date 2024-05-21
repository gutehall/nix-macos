{ pkgs, config, ... }:

{
  homebrew = import ./homebrew.nix // { enable = true; };

  services.nix-daemon.enable = true;

  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  system.stateVersion = 4;

  system.defaults.NSGlobalDomain.ApplePressAndHoldEnabled = false;
  system.defaults.dock.autohide = true;

  system.defaults.NSGlobalDomain.InitialKeyRepeat = 20;
  system.defaults.NSGlobalDomain.KeyRepeat = 2;

  nixpkgs.hostPlatform = "aarch64-darwin";

  nix.extraOptions = ''
    extra-platforms = x86_64-darwin aarch64-darwin
  '';
}
