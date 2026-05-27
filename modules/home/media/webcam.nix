{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.media.webcam;
in {
  options.custom.media.webcam = {
    enable = lib.mkEnableOption "Webcam";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      v4l-utils
      cameractrls-gtk4
    ];

    systemd.user.services.webcam-preset = {
      Unit = {
        Description = "Apply declarative v4l2 webcam presets";
        After = ["graphical-session.target"];
        PartOf = ["graphical-session.target"];
      };

      Install = {
        WantedBy = ["graphical-session.target"];
      };

      Service = {
        Type = "oneshot";

        ExecStart = ''
          ${pkgs.v4l-utils}/bin/v4l2-ctl -d /dev/video0 \
            --set-fmt-video=width=1280,height=720,pixelformat=MJPG \
            --set-parm=30 \
            --set-ctrl=exposure_auto=3,white_balance_temperature_auto=1,backlight_compensation=4,brightness=80,contrast=5,saturation=83,sharpness=25
        '';

        ExecStartPre = "${pkgs.coreutils}/bin/test -e /dev/video0";
        RemainAfterExit = true;
      };
    };
  };
}
