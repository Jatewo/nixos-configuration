{...}: {
  imports = [
    ../../../modules/home
  ];

  home.stateVersion = "24.05";
  home.username = "jacobtw";
  home.homeDirectory = "/home/jacobtw";
  programs.home-manager.enable = true;

  # Enable modules
  custom = {
    browser = {
      brave.enable = true;
    };
    cli = {
      zsh.enable = true;
      git.enable = true;
    };
    gaming = {
      irony.enable = true;
      launchers.enable = true;
    };
    media = {
      pear-desktop.enable = true;
    };
    network = {
      parsec.enable = true;
    };
    nixvim.enable = true;
    social = {
      vesktop.enable = true;
    };
    terminal = {
      kitty.enable = true;
    };
    theme = {
      posy-cursor.enable = true;
    };
  };
}
