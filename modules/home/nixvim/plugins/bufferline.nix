{
  plugins = {
    bufferline = {
      enable = true;
      settings = {
        options = {
          # Shows the LSP squigglies directly in the tabs
          diagnostics = "nvim_lsp";

          # Always show the tab bar, even if only one file is open
          always_show_bufferline = true;

          # Style of the tab separators
          separator_style = "thin"; # Options: "slant", "thick", "thin"

          close_command = {
            __raw = "function(n) require('mini.bufremove').delete(n, false) end";
          };

          right_mouse_command = {
            __raw = "function(n) require('mini.bufremove').delete(n, false) end";
          };

          offsets = [
            {
              filetype = "neo-tree";
              text = "File Explorer";
              text_align = "left";
              separator = true;
            }
          ];
        };
      };
    };

    mini = {
      enable = true;
      modules = {
        bufremove = {};
      };
    };
  };
}
