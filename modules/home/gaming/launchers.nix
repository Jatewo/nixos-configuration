{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.gaming.launchers;
in {
  nixpkgs.config.allowUnfree = true;

  options.custom.gaming.launchers = {
    enable = lib.mkEnableOption "Gaming launchers";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      heroic
      satisfactorymodmanager
      prismlauncher
    ];
  };
}
