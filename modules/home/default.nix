{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./git.nix
    ./nixvim.nix
    ./shell.nix
    ./irony.nix
    ./media.nix
    ./vesktop.nix
  ];

  home.username = "jacobtw";
  home.homeDirectory = "/home/jacobtw";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true; 
}
