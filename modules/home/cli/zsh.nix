{pkgs, ...}: {
  programs.zsh.enable = true;

  home.packages = with pkgs; [
    neofetch
  ];

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    git = true;
  };
}
