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
    prismlauncher
    temurin-bin-17 # Java 17 for Minecraft 1.18+
    temurin-bin-21 # Java 21 for Minecraft 1.20+
    temurin-bin-8 # Java 8 for Minecraft 1.12 and older
    openlinkhub # iCue
    ];
}
