{ config, pkgs, ... }:

{

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    github-desktop
    git
    neovim
  ];
}
