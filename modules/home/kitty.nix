{ pkgs, ...}:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    settings = {
      background_opacity = "0.8";
      dynamic_background_opacity = true;
      window_padding_width = 5;
      background_blur = 5;
      enable_audio_bell = false;
      confirm_os_window_close = 0;
    };
  };
}
