{inputs, ...}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./git.nix
    ./nixvim
    ./shell.nix
    ./irony.nix
    ./media.nix
    ./vesktop.nix
    ./kitty.nix
    ./gaming.nix
    ./brave.nix
    ./parsec.nix
    ./posy-cursor.nix
  ];

  home.username = "jacobtw";
  home.homeDirectory = "/home/jacobtw";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
