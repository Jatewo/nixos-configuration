

{ config, pkgs, lib, ... }:

let
  # Explicitly get the current flake, which is guaranteed to be available
  # when building with 'nixos-rebuild --flake'.
  self = builtins.getFlake "path:/etc/nixos";

  # Get the git revision from the flake. If it's not a git repo,
  # it will be 'null'. The `or` fallback provides a default value.
  gitRevision = lib.substring 0 7 (self.rev or self.outPath or "no-rev");
in
{
  options.system.nixos.labelDescription = lib.mkOption {
    type = lib.types.str;
    default = "";
    description = "A short description to add to the system label.";
  };

  config = {
    # Replace spaces with hyphens for a valid label string
    system.nixos.label = "Desktop-${gitRevision}-${builtins.replaceStrings [" "] ["-"] config.system.nixos.labelDescription}";
  };
}
