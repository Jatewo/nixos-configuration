{
  opts = {
    clipboard = "unnamedplus";
    shiftwidth = 2;
    tabstop = 2;
    softtabstop = 2;
    expandtab = true;
    number = true; # Show line numbers
    undofile = true; # Persistent undo even after closing vim
  };

  # Per-language overrides
  files."ftplugin/python.lua".opts = {
    shiftwidth = 4;
    tabstop = 4;
    softtabstop = 4;
  };

  # Global Keymaps
  keymaps = [
    {
      mode = "n";
      key = "<C-n>";
      action = "<cmd>NvimTreeToggle<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>Git<CR>";
    }
  ];
}
