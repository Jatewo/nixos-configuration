{pkgs, ...}: {
  fonts.fonts = with pkgs; [
    nerdfonts.jetbrains-mono
    nerdfonts.fira-code
  ];

  fonts.fontconfig.enable = true;
}
