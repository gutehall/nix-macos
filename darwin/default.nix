{ pkgs, config, ... }:

{
  services.nix-daemon.enable = true;

  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  programs.git.enable = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];

  system.stateVersion = 4;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  system.defaults = {

    dock = {
      autohide = false;
      show-recents = false;
      launchanim = true;
      orientation = "bottom";
      tilesize = 48;
      mru-spaces = false;
    };

    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      ShowStatusbar = true;
    };

    loginwindow.GuestEnabled = false;
    menuExtraClock.ShowDate = 0;
    menuExtraClock.ShowDayOfWeek = bool;
    trackpad.TrackpadRightClick = bool;
    NSGlobalDomain.AppleShowAllExtensions = bool;
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  nix.extraOptions = ''
    extra-platforms = x86_64-darwin aarch64-darwin
  '';
}
