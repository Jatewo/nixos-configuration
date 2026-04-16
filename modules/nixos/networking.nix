{
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "nixos"; # Define your hostname.
  networking.useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    sshfs
    openssh
  ];
}
