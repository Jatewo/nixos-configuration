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

    DiagnosticUnderlineWarn = {
      undercurl = true;
      sp = "#e0af68";
    };
    DiagnosticUnderlineInfo = {
      undercurl = true;
      sp = "#0db9d7";
    };
    DiagnosticUnderlineHint = {
      undercurl = true;
      sp = "#1abc9c";
    };
  };
}
