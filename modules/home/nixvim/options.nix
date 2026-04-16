let
  moveDownAction = "<cmd>m .+1<cr>";
  moveUpAction = "<cmd>m .-2<cr>";
in {
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
      action = "<cmd>LazyGit<CR>";
    }

    # Window Navigation (Control + h/j/k/l)
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options.desc = "Go to Left Window";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options.desc = "Go to Lower Window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options.desc = "Go to Upper Window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options.desc = "Go to Right Window";
    }

    # Move Lines (Alt + j/k)
    {
      mode = "n";
      key = "<A-j>";
      action = moveDownAction;
      options.desc = "Move Line Down";
    }
    {
      mode = "n";
      key = "<A-Down>";
      action = moveDownAction;
      options.desc = "Move Line Down";
    }
    {
      mode = "n";
      key = "<A-k>";
      action = moveUpAction;
      options.desc = "Move Line Up";
    }
    {
      mode = "n";
      key = "<A-Up>";
      action = moveUpAction;
      options.desc = "Move Line Up";
    }
    {
      mode = "v";
      key = "<A-j>";
      action = ":m '>+1<cr>gv=gv";
      options.desc = "Move Selection Down";
    }
    {
      mode = "v";
      key = "<A-k>";
      action = ":m '<-2<cr>gv=gv";
      options.desc = "Move Selection Up";
    }
  ];
}
