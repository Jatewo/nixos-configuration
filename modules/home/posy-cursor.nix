{pkgs, ...}: {
  home.packages = with pkgs; [
    posy-cursors
  ];

  home.pointerCursor = {
    package = pkgs.posy-cursors;
    name = "Posy_Cursor";
    size = 24;
    gtk.enable = true;
    kde.enable = true;
  };
}
