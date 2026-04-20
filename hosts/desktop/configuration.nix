{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/core.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/i18n.nix
    ../../modules/nixos/plasma.nix
    ../../modules/nixos/gaming.nix
    ../../modules/nixos/pipewire.nix
    ../../modules/nixos/development.nix
    ../../modules/nixos/secure-boot.nix
    ../../modules/nixos/video.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/nvidia.nix
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "libsoup-2.74.3"
  ];

  boot.loader.efi.canTouchEfiVariables = true; # Bootloader

  boot.kernelPackages = pkgs.linuxPackages; # Use latest kernel.

  fileSystems."/mnt/shared" = {
    device = "/dev/disk/by-uuid/443D-A611";
    fsType = "exfat";
    options = ["uid=1000" "gid=100" "dmask=0000" "fmask=0111" "nofail"];
  };

  fileSystems."/home/jacobtw/.steam/steam/steamapps/compatdata/2252570/pfx/drive_c/users/steamuser/Documents/Sports Interactive/Football Manager 2024" = {
    device = "/mnt/shared/OneDrive/Dokumenter/Sports Interactive/Football Manager 2024";
    options = ["bind"];
  };

  environment.systemPackages = with pkgs; [
    wget
    niv
  ];

  system.stateVersion = "25.05";

  users.users.jacobtw = {
    isNormalUser = true;
    description = "Jacob";
    extraGroups = ["networkmanager" "wheel" "video"];
    shell = pkgs.zsh;
  };

  home-manager.users.jacobtw = import ./home/jacobtw.nix;
}
