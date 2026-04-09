{ pkgs, ... }:

let
  pear-desktop-fixed = pkgs.symlinkJoin {
    name = "pear-desktop-fixed";
    paths = [ pkgs.pear-desktop ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/pear-desktop \
        --set PULSE_PROP "media.name='Pear Desktop'"
    '';
  };
in
{
  home.packages = [
    pear-desktop-fixed
  ];
}
