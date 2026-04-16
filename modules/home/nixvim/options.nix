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
    # --- Window Navigation (Control + h/j/k/l) ---
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

    # --- Windows Split (Ctrl + v/s) ---
    {
      mode = "n";
      key = "<leader>sv";
      action = "<C-w>v";
      options.desc = "Split Vertically";
    }
    {
      mode = "n";
      key = "<leader>sh";
      action = "<C-w>s";
      options.desc = "Split Horizontally";
    }

    # --- Move Lines (Alt + j/k) ---
    {
      mode = "n";
      key = "<A-j>";
      action = "<cmd>m .+1<cr>";
      options.desc = "Move Line Down";
    }
    {
      mode = "n";
      key = "<A-k>";
      action = "<cmd>m .-2<cr>";
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

    # --- Move Lines (Alt + Arrows) ---
    # These point to the exact same actions as above
    {
      mode = "n";
      key = "<A-Down>";
      action = "<cmd>m .+1<cr>";
      options.desc = "Move Line Down";
    }
    {
      mode = "n";
      key = "<A-Up>";
      action = "<cmd>m .-2<cr>";
      options.desc = "Move Line Up";
    }
    {
      mode = "v";
      key = "<A-Down>";
      action = ":m '>+1<cr>gv=gv";
      options.desc = "Move Selection Down";
    }
    {
      mode = "v";
      key = "<A-Up>";
      action = ":m '<-2<cr>gv=gv";
      options.desc = "Move Selection Up";
    }

    # --- Buffer Management (Tabs) ---
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options.desc = "Next Tab";
    }
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options.desc = "Previous Tab";
    }
    {
      mode = "n";
      key = "<S-x>";
      action = "<cmd>lua MiniBufremove.delete(0, false)<cr>";
      options.desc = "Close Buffer (Preserve Layout)";
    }
  ];
}
