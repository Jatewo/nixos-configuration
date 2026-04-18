{...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };

    settings = {
      background_opacity = "0.6";
      dynamic_background_opacity = true;
      window_padding_width = 5;
      background_blur = 2;
      enable_audio_bell = false;
      confirm_os_window_close = 0;
      tab_bar_style = "custom";
      tab_bar_edge = "top";
      tab_bar_margin_width = 10;
      tab_bar_margin_height = "10 10";

      active_tab_foreground = "#181825";
      active_tab_background = "#c6a0f6";
      active_tab_font_style = "bold";

      inactive_tab_foreground = "#cad3f5";
      inactive_tab_background = "#1e1e2e";
      inactive_tab_font_style = "normal";
    };
  };

  xdg.configFile."kitty/tab_bar.py".source = ./tab_bar.py;
}
