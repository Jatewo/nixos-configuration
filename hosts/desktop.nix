{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../shared/users.nix
    ../modules/networking.nix
    ../modules/locale_da-dk.nix
    ../modules/plasma-desktop.nix
    ../modules/gaming.nix
    ../modules/sound.nix
    ../modules/development.nix
  ];

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 30d"; # remove store paths not used in last 30 days
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  fileSystems."/mnt/shared" = {
    # Use your partition's UUID here. This is the recommended and safest method.
    device = "UUID=443D-A611";

    # Replace with the file system type (e.g., "ext4", "ntfs", "btrfs")
    fsType = "exfat";

    # Mount options. "nofail" is a useful option that allows the system to boot
    # even if the drive is not plugged in.
    options = [ 
      "defaults"
      "nofail"
      "uid=1000"
      "gid=100"
    ];
  };

  fileSystems."/home/jacobtw/.steam/steam/steamapps/compatdata/2252570/pfx/drive_c/users/steamuser/Documents/Sports Interactive/Football Manager 2024" = {
    device = "/mnt/shared/OneDrive/Dokumenter/Sports Interactive/Football Manager 2024";
    options = [ "bind" ];
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
  ];

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
