{inputs, ...}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./cli
    ./gaming
    ./media
    ./other
    ./terminal
    ./nixvim
    ./browser
  ];

  home.username = "jacobtw";
  home.homeDirectory = "/home/jacobtw";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
