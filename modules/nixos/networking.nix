{
  lib,
  pkgs,
  ...
}: {
  networking.useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    trustedInterfaces = ["ham0"];
  };

  services.logmein-hamachi.enable = true;

  environment.systemPackages = with pkgs; [
    sshfs
    openssh
  ];
}
