{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.gaming.irony;

  irony-pkg = pkgs.stdenv.mkDerivation rec {
    pname = "irony-mod-manager-pkg";
    version = "1.27.162";

    src = pkgs.fetchurl {
      url = "https://github.com/bcssov/IronyModManager/releases/download/v${version}/linux-x64.zip";
      hash = "sha256-+W/XaSqTNTwjhq4tPy8tXZBHOQ+u8eEObCYmLgGQ0eo=";
    };

    nativeBuildInputs = [pkgs.unzip];
    sourceRoot = ".";

    installPhase = ''
      mkdir -p $out/opt/irony-mod-manager
      cp -r * $out/opt/irony-mod-manager/
      chmod +x $out/opt/irony-mod-manager/IronyModManager
    '';
  };

  irony-mod-manager = pkgs.buildFHSEnv {
    name = "irony-mod-manager";
    targetPkgs = pkgs: (with pkgs; [
      icu
      openssl
      zlib
      fontconfig
      freetype
      libx11
      libice
      libsm
      libxcursor
      libxext
      libxi
      libxrandr
      libGL
      gtk3
    ]);
    runScript = "${irony-pkg}/opt/irony-mod-manager/IronyModManager";
  };
in {
  options.custom.gaming.irony = {
    enable = lib.mkEnableOption "Irony Mod Manager";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      irony-mod-manager
    ];

    xdg.desktopEntries.irony-mod-manager = {
      name = "Irony Mod Manager";
      exec = "irony-mod-manager";
      terminal = false;
      categories = ["Game" "Utility"];
    };
  };
}
