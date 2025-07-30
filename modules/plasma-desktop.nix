{ config, pkgs, ... }:

{
   # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.wayland.enable = false;

  xdg.portal = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    brave
  ];

}
