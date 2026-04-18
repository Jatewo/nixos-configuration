{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.nixvim;
in {
  options.custom.nixvim = {
    enable = lib.mkEnableOption "Nixvim";
  };

  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;

      viAlias = true;
      vimAlias = true;

      withNodeJs = true;
      extraPackages = with pkgs; [
        gcc
        python3
        nodejs
        ripgrep
        fd
        alejandra
      ];

      imports = [
        ./options.nix
        ./ui.nix
        ./plugins
      ];
    };
  };
}
