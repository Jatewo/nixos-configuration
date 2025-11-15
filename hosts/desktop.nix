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

  boot.kernelParams = [ "nvidia-drm.modeset=1" ]; # Enable DRM kernel mode setting for NVIDIA
  services.xserver.videoDrivers = [ "nvidia" ]; # Use the NVIDIA driver

  hardware.nvidia = {
    modesetting.enable = true; # Enable DRM kernel mode setting
    powerManagement.enable = false; # Enable NVIDIA power management
    open = true; # Enable NVIDIA Open GPU kernel module
    nvidiaSettings = true; # Enable nvidia-settings utility
    package = config.boot.kernelPackages.nvidiaPackages.stable; # Use the stable NVIDIA driver package
  }; 

  hardware.graphics.enable32Bit = true; # Enable 32-bit support for graphics drivers
  hardware.steam-hardware.enable = true; # Enable 32-bit support for Steam and games
  

  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
	AutoEnable = true;
	ControllerMode = "bredr";
      };
    }:
  };
  services.blueman.enable = true;

  nix.gc = {
    automatic = true; # Enable automatic garbage collection
    dates = "daily"; # Run garbage collection daily
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
    device = "/dev/disk/by-uuid/443D-A611";
    fsType = "exfat";
    options = [ "uid=1000" "gid=100" "dmask=0000" "fmask=0111" "nofail" ];
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
