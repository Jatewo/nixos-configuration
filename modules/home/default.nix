{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./neovim.nix
    ./shell.nix
    ./irony.nix
    ./media.nix
  ];

  home.username = "jacobtw";
  home.homeDirectory = "/home/jacobtw";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
