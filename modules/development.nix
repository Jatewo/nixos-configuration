{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    github-desktop
    git
    neovim
  ];
}
