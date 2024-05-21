{ pkgs, lib, ... }:
{
  imports = [
    ./extensions.nix
    ./settings.nix
  ];

  programs.vscode.enable = true;
}