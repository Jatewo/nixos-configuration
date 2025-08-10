{ config, pkgs, ... }:

{

  programs.zsh.enable = true;

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [ wl-clipboard ];
  };

  environment.systemPackages = with pkgs; [
    github-desktop
    git
  ];
}
