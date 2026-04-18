{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.cli.zsh;
in {
  options.custom.cli.zsh = {
    enable = lib.mkEnableOption "Zsh";
  };

  config = lib.mkIf cfg.enable {
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
  };
}
