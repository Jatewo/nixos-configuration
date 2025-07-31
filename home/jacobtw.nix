{ config, pkgs, ... }:

{
  home.username = "jacobtw";
  home.homeDirectory = "/home/jacobtw";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    kate
    git
    neofetch
  ];

  programs.neovim = {
    enable = true;
    withNodeJs = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [ gcc python3 nodejs ];
  };

  # Optional
  programs.git.enable = true;
  programs.zsh.enable = true;

  home.stateVersion = "24.05"; # Match your system
}
