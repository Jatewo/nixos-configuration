{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/i18n.nix
    ../../modules/nixos/plasma.nix
    ../../modules/nixos/gaming.nix
    ../../modules/nixos/pipewire.nix
    ../../modules/nixos/development.nix
    ../../modules/nixos/secure-boot.nix
    ../../modules/nixos/video.nix
  ];

  boot.kernelParams = ["nvidia-drm.modeset=1"]; # Enable DRM kernel mode setting for NVIDIA
  services.xserver.videoDrivers = ["nvidia"]; # Use the NVIDIA driver

  nixpkgs.config.permittedInsecurePackages = [
    "libsoup-2.74.3"
  ];

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
    };
  };
  services.blueman.enable = true;

  nix.gc = {
    automatic = true; # Enable automatic garbage collection
    dates = "daily"; # Run garbage collection daily
    options = "--delete-older-than 30d"; # remove store paths not used in last 30 days
  };

  # Bootloader
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  fileSystems."/mnt/shared" = {
    device = "/dev/disk/by-uuid/443D-A611";
    fsType = "exfat";
    options = ["uid=1000" "gid=100" "dmask=0000" "fmask=0111" "nofail"];
  };

  fileSystems."/home/jacobtw/.steam/steam/steamapps/compatdata/2252570/pfx/drive_c/users/steamuser/Documents/Sports Interactive/Football Manager 2024" = {
    device = "/mnt/shared/OneDrive/Dokumenter/Sports Interactive/Football Manager 2024";
    options = ["bind"];
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    sbctl
    niv
  ];

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  system.stateVersion = "25.05";

  users.users.jacobtw = {
    isNormalUser = true;
    description = "Jacob";
    extraGroups = ["networkmanager" "wheel" "video"];
    shell = pkgs.zsh;
  };

  home-manager.users.jacobtw = import ./home/jacobtw.nix;
}
