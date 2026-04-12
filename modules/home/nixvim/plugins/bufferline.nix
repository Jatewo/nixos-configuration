{
  plugins.bufferline = {
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

  # Navigation Keymaps (Put these in your keymaps list)
  keymaps = [
    # Shift + l to move to the next tab (right)
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options.desc = "Next Tab";
    }
    # Shift + h to move to the previous tab (left)
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options.desc = "Previous Tab";
    }
    # Shift + x to close the current file tab
    {
      mode = "n";
      key = "<S-x>";
      action = "<cmd>lua MiniBufremove.delete(0, false)<cr>";
      options.desc = "Close Buffer (Preserve Layout)";
    }
  ];

  plugins.mini = {
    enable = true;
    modules = {
      bufremove = {};
    };
  };
}
