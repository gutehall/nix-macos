{ pkgs, home-manager, ... }:

{
  imports = [
    ../../darwin
  ];

  users.users.mathias = {
    name = "mathias";
    home = "/Users/mathias";
  };

  # Keyboard
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  # Setting some defaults
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

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  # Store management
  nix.gc.automatic = true;
  nix.gc.interval.Hour = 3;
  nix.gc.options = "--delete-older-than 15d";
  nix.optimise.automatic = true;
  nix.optimise.interval.Hour = 4;

  # Enable support for Linux builds
  nix.linux-builder.enable = true;
  nixpkgs.config.allowUnfree = true;
}
