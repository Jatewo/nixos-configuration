{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.network.hamachi;
in {
  options.custom.network.hamachi = {
    enable = lib.mkEnableOption "Hamachi";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      haguichi
    ];
  };
}
