{ config, pkgs, ... }:


let
  brave-fixed = pkgs.symlinkJoin {
    name = "brave-fixed";
    paths = [ pkgs.brave ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/brave \
        --set PULSE_PROP "media.name='Brave'"
    '';
  };
in
{
   # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.wayland.enable = false;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];

  fonts.fontconfig.enable = true;

  xdg.portal = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    brave-fixed
    pkgs.parsec-bin
    pkgs.posy-cursors
  ];

}
