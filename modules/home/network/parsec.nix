{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.network.parsec;
in {
  options.custom.network.parsec = {
    enable = lib.mkEnableOption "Parsec";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      parsec-bin
    ];
  };
}
