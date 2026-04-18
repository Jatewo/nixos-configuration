{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.media.pear-desktop;

  pear-desktop-fixed = pkgs.symlinkJoin {
    name = "pear-desktop-fixed";
    paths = [pkgs.pear-desktop];
    nativeBuildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/pear-desktop \
        --set PULSE_PROP "media.name='YouTube Music'"
    '';
  };
in {
  options.custom.media.pear-desktop = {
    enable = lib.mkEnableOption "Pear Desktop";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pear-desktop-fixed
    ];

    xdg.desktopEntries."com.github.th_ch.youtube_music" = {
      name = "YouTube Music";
      genericName = "Desktop Music Player";
      exec = "pear-desktop %U";
      icon = "pear-desktop";
      terminal = false;
      categories = ["AudioVideo" "Audio" "Player"];
    };
  };
}
