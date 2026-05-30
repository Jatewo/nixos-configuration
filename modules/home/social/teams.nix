{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.social.teams;
in {
  options.custom.social.teams = {
    enable = lib.mkEnableOption "Teams";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      teams-for-linux
    ];
  };
}
