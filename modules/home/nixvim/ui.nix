{
  colorschemes.tokyonight = {
    enable = true;
    settings = {
      transparent = true;
      styles = {
        sidebars = "transparent";
        floats = "transparent";
      };
      on_colors = ''
        function(colors)
          colors.bg_statusline = colors.none
        end
      '';
    };
  };

  highlight = {
    NvimTreeNormal.bg = "none";
    NvimTreeNormalNC.bg = "none";
    NvimTreeEndOfBuffer.bg = "none";
    NormalFloat.bg = "none";
    FloatBorder.bg = "none";
  };
}
