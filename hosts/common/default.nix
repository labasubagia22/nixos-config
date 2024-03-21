{ pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./xdg.nix
    ./docker.nix
    ./flatpak.nix
    ./fonts.nix
    ./xfce.nix
  ];
}
