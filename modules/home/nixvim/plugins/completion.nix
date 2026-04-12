{
  plugins.copilot-lua = {
    enable = true;
    settings = {
      filetypes = {
        "*" = true;
      };
      panel = {
        enabled = false;
      };
      suggestion = {
        enabled = true;
        auto_trigger = true;
        keymap = {
          accept = "<Tab>";
          accept_word = false;
          accept_line = false;
          next = "<C-k>";
          prev = "<C-j>";
        };
      };
    };
  };
}
