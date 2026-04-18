{
  lib,
  pkgs,
  ...
}: {
  networking.useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    sshfs
    openssh
  ];
}
