{pkgs, ...}: let
  brave-fixed = pkgs.symlinkJoin {
    name = "brave-fixed";
    paths = [pkgs.brave];
    nativeBuildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/brave \
        --set PULSE_PROP "media.name='Brave'"
    '';
  };
in {
  home.packages = [
    brave-fixed
  ];
}
