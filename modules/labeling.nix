{ config, lib, ... }:

let
  Get the current date and time
  # This uses a dummy value during builds to ensure reproducibility
  # and will only use the actual time when the flake is evaluated
  currentDateTime = builtins.currentTime;
  formattedTime = builtins.substring 0 16 (builtins.split "T" currentDateTime);

  # A short description can be passed via an option
  shortDescription = config.system.nixos.labelDescription or "";

  # Construct the final label
  finalLabel = "Desktop - ${formattedTime} ${shortDescription}";
in
{
  # This option is what you will set in your host config
  options.system.nixos.labelDescription = lib.mkOption {
    type = lib.types.str;
    default = "";
    description = "A short description to add to the system label.";
  };

  # This sets the actual system label using the constructed string
  system.nixos.label = finalLabel;
}
