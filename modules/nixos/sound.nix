{ config, pkgs, ... }:

{
  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1290", TEST=="power/control", ATTR{power/control}="on"
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1294", TEST=="power/control", ATTR{power/control}="on"
  '';
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraConfig.pipewire-pulse."10-disable-suspend" = {
      "pulse.cmd" = [
        { cmd = "load-module"; args = "module-suspend-on-idle"; flags = ["nofail"]; }
      ];
    };
    extraConfig.pipewire-pulse."10-pear-rename" = {
      "pulse.rules" = [
        {
          matches = [ { "media.name" = "YouTube Music"; } ];
          actions = {
            update-props = {
              "node.description" = "YouTube Music Desktop Player";
              "application.name" = "YouTube Music";
	      "application.icon_name" = "pear-desktop";
	      "application.icon-name" = "pear-desktop";
            };
          };
        }
	{
	  matches = [ { "media.name" = "Brave"; } ];
	  actions = {
	    update-props = {
	      "node.description" = "Brave Browser";
	      "application.name" = "Brave";
	      "application.icon_name" = "brave-browser";
	      "application.icon-name" = "brave-browser";
	    };
	  };
	}
	{
	  matches = [ { "media.name" = "Discord"; } ];
	  actions = {
	    update-props = {
	      "node.description" = "Discord";
	      "application.name" = "Discord";
	      "application.icon_name" = "discord";
	      "application.icon-name" = "discord";
	    };
	  };
        }
      ];
    };
  };
  environment.systemPackages = [ pkgs.headsetcontrol ];
  services.udev.packages = [ pkgs.headsetcontrol ];
}
