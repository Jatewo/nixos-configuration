{ config, pkgs, ... }:

let
  irony-mod-manager = pkgs.stdenv.mkDerivation rec {
    pname = "irony-mod-manager";
    version = "1.27.162";

    src = pkgs.fetchurl {
      url = "https://github.com/bcssov/IronyModManager/releases/download/v${version}/linux-x64.zip";
      hash = pkgs.lib.fakeHash;
    };

    nativeBuildInputs = [ pkgs.unzip ];

    sourceRoot = ".";

    installPhase = ''
      mkdir -p $out/bin $out/opt/irony-mod-manager
      cp -r * $out/opt/irony-mod-manager/
      chmod +x $out/opt/irony-mod-manager/IronyModManager
      
      cat > $out/bin/irony-mod-manager <<EOF
      #!/bin/sh
      exec ${pkgs.steam-run}/bin/steam-run $out/opt/irony-mod-manager/IronyModManager "\$@"
      EOF
      
      chmod +x $out/bin/irony-mod-manager
    '';
  };
in
{
  home.packages = [
    irony-mod-manager
  ];

  xdg.desktopEntries.irony-mod-manager = {
    name = "Irony Mod Manager";
    exec = "irony-mod-manager";
    terminal = false;
    categories = [ "Game" "Utility" ];
  };
}
