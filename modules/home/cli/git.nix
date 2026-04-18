{
  lib,
  config,
  ...
}: let
  cfg = config.custom.cli.git;
in {
  options.custom.cli.git = {
    enable = lib.mkEnableOption "Git";
  };
  config = lib.mkIf cfg.enable {
    programs.git.enable = true;
  };
}
