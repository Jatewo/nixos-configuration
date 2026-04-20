{config, ...}: {
  nixpkgs.config.allowUnfree = true;

  boot.kernelParams = ["nvidia-drm.modeset=1"]; # Enable DRM kernel mode setting for NVIDIA
  services.xserver.videoDrivers = ["nvidia"]; # Use the NVIDIA driver

  hardware.nvidia = {
    modesetting.enable = true; # Enable DRM kernel mode setting
    powerManagement.enable = false; # Enable NVIDIA power management
    open = true; # Enable NVIDIA Open GPU kernel module
    nvidiaSettings = true; # Enable nvidia-settings utility
    package = config.boot.kernelPackages.nvidiaPackages.stable; # Use the stable NVIDIA driver package
  };

  hardware.graphics.enable32Bit = true; # Enable 32-bit support for graphics drivers
}
