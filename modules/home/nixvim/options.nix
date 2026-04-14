{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  opts = {
    clipboard = "unnamedplus";
    showmode = false;
    termguicolors = true;
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
      action = "<cmd>Neotree toggle<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>Git<CR>";
    }
  ];
}
