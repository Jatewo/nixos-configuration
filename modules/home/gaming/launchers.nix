{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.gaming.launchers;
in {
  options.custom.gaming.launchers = {
    enable = lib.mkEnableOption "Gaming launchers";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      heroic
      satisfactorymodmanager
      (prismlauncher.override {
        jdks = [
          jdk8
          jdk17
          jdk21
        ];
        additionalLibs = [xorg.libXcursor];
      })
      xclicker
    ];
  };
}
