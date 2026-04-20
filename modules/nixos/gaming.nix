{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  hardware.steam-hardware.enable = true; # Enable 32-bit support for Steam and games

  environment.systemPackages = with pkgs; [
    vulkan-tools # for vulkaninfo and other tools
  ];
}
