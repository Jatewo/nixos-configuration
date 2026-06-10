{pkgs, ...}: {
  hardware.openrazer = {
    enable = true;
    users = ["jacobtw"];
    batteryNotifier.enable = false;
  };

  environment.systemPackages = with pkgs; [
    polychromatic
  ];

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="1532", TEST=="power/control", ATTR{power/control}="on"
  '';
}
