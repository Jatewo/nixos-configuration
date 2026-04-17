{pkgs, ...}: {
  services.xserver.enable = true; # Enable the X11 windowing system.

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = false;
  };
  services.desktopManager.plasma6.enable = true;
  programs.kdeconnect.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde];
  };
}
