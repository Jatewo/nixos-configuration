{ pkgs, ...}:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    settings = {
      background_opacity = "0.95";
      enable_audio_bell = false;
      confirm_os_window_close = 0;
    };
  };
}
