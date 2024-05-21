{ pkgs, home-manager, ... }:

{
  imports = [
    ../../darwin
  ];

  users.users.mathias = {
    name = "mathias";
    home = "/Users/mathias";
  };

  security.pam.enableSudoTouchIdAuth = true;

  nix.gc.automatic = true;
  nix.gc.interval.Hour = 3;
  nix.gc.options = "--delete-older-than 15d";
  nix.optimise.automatic = true;
  nix.optimise.interval.Hour = 4;

  nix.linux-builder.enable = true;
  nixpkgs.config.allowUnfree = true;
}
