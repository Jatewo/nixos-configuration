{ pkgs, ... }:

let
  pear-desktop-fixed = pkgs.symlinkJoin {
    name = "pear-desktop-fixed";
    paths = [ pkgs.pear-desktop ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/pear-desktop \
        --set PULSE_PROP "media.name='YouTube Music'"
        
	sed -i 's/^Name=.*/Name=YouTube Music/' $out/share/applications/*.desktop
    '';
  };
in
{
  home.packages = [
    pear-desktop-fixed
  ];
}
