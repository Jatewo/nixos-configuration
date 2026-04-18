{ pkgs, ... }:

let
  pear-desktop-fixed = pkgs.symlinkJoin {
    name = "pear-desktop-fixed";
    paths = [ pkgs.pear-desktop ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/pear-desktop \
        --set PULSE_PROP "media.name='YouTube Music'"
    '';
  };
in
{
  home.packages = [
    pear-desktop-fixed
  ];

  xdg.desktopEntries."com.github.th_ch.youtube_music" = {
    name = "YouTube Music";
    genericName = "Desktop Music Player";
    exec = "pear-desktop %U"; 
    icon = "pear-desktop"; 
    terminal = false;
    categories = [ "AudioVideo" "Audio" "Player" ]; 
  };
}
