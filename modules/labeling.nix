{ config, pkgs, lib, ... }:

let
  # A helper to get the Git commit short hash from the flake
  gitRevision = lib.substring 0 7 (config.flake.rev or "dirty");
in
{
  options.system.nixos.labelDescription = lib.mkOption {
    type = lib.types.str;
    default = "";
    description = "A short description to add to the system label.";
  };

  # Put your configuration attributes inside the `config` attribute
  config = {
    system.nixos.label = "Desktop-${gitRevision}-${builtins.replaceStrings [" "] ["-"] config.system.nixos.labelDescription}";
  };
}
