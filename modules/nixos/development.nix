{
  config,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;

  programs.neovim.enable = true;

  environment.systemPackages = with pkgs; [
    github-desktop
    git
    wl-clipboard
    xclip
    rar
  ];
}
