{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    steam
    heroic
    satisfactorymodmanager
    vulkan-tools # Graphics API for Steam
    vkd3d-proton
    vesktop
  ];
}
