{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pear-desktop
  ];

  xdg.desktopEntries.pear-desktop = {
    name = "Pear Desktop";
    exec = "env PULSE_PROP=\"application.name='Pear Desktop' media.role=music\" pear-desktop %U";
    icon = "pear-desktop";
    terminal = false;
    categories = [ "Audio" "Music" "Player" ];
  };
}
