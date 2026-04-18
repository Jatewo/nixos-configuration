{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.theme.posy-cursor;
in {
  options.custom.theme.posy-cursor = {
    enable = lib.mkEnableOption "Posy Cursor";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      posy-cursors
    ];

    home.pointerCursor = {
      package = pkgs.posy-cursors;
      name = "Posy_Cursor";
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
