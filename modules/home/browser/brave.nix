{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.browser.brave;

  brave-fixed = pkgs.symlinkJoin {
    name = "brave-fixed";
    paths = [pkgs.brave];
    nativeBuildInputs = [pkgs.makeWrapper];
    postBuild = ''

      wrapProgram $out/bin/brave \
        --set PULSE_PROP "media.name='Brave'"
    '';
  };
in {
  options.custom.browser.brave = {
    enable = lib.mkEnableOption "Brave browser (With PulseAudio rules)";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [brave-fixed];
  };
}
