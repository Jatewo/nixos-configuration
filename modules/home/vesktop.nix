{ pkgs, ... }:

let
  vesktop-fixed = pkgs.symlinkJoin {
    name = "vesktop-fixed";
    paths = [ pkgs.vesktop ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/vesktop \
        --set PULSE_PROP "media.name='Discord'" \
    '';
  };
in
{
  home.packages = [
    vesktop-fixed
  ];

  xdg.desktopEntries."vesktop" = {
    name = "Discord";
    genericName = "Chat and Voice Communication (Vesktop)";
    exec = "vesktop %U"; 
    icon = "/home/jacobtw/Downloads/discord_icon_130958.ico"; 
    terminal = false;
    categories = [ "AudioVideo" "Audio" "Player" ]; 
  };
}
