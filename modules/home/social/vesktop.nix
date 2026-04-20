{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.social.vesktop;

  vesktop-fixed = pkgs.symlinkJoin {
    name = "vesktop-fixed";
    paths = [pkgs.vesktop];
    nativeBuildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/vesktop \
        --set PULSE_PROP "media.name='Discord'" \
    '';
  };
in {
  nixpkgs.config.allowUnfree = true;

  options.custom.social.vesktop = {
    enable = lib.mkEnableOption "Vesktop";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      vesktop-fixed
    ];

    xdg.desktopEntries."vesktop" = {
      name = "Discord";
      genericName = "Chat and Voice Communication (Vesktop)";
      exec = "vesktop %U";
      icon = "discord";
      terminal = false;
      categories = ["AudioVideo" "Audio" "Player"];
    };
  };
}
