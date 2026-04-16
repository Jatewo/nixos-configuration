{lib, ...}: let
  nMoveDown = "<cmd>m .+1<cr>==";
  nMoveUp = "<cmd>m .-2<cr>==";

  vMoveDown = ":m '>+1<cr>gv=gv";
  vMoveUp = ":m '<-2<cr>gv=gv";

  downKeys = ["Down" "j"];
  upKeys = ["Up" "k"];
  rightKeys = ["Right" "l"];
  leftKeys = ["Left" "h"];

  nextAction = "<cmd>BufferLineCycleNext<cr>";
  prevAction = "<cmd>BufferLineCyclePrev<cr>";

  mkKeymap = mode: prefix: action: desc: key: {
    inherit mode action;
    key = "<${prefix}-${key}>"; # String interpolation is the magic here
    options.desc = desc;
  };
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
  files."ftplugin/pythonl.lua".opts = {
    shiftwidth = 4;
    tabstop = 4;
    softtabstop = 4;
  };

  # Global Keymaps
  keymaps = lib.flatten [
    # --- Window Navigation (Control + h/j/k/l) ---
    (map (mkKeymap "n" "C" "<C-w>h" "Go Left") leftKeys)
    (map (mkKeymap "n" "C" "<C-w>j" "Go Down") downKeys)
    (map (mkKeymap "n" "C" "<C-w>k" "Go Up") upKeys)
    (map (mkKeymap "n" "C" "<C-w>l" "Go Right") rightKeys)

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

    # --- Move Lines (Alt + j/k or Down/Up) ---
    (map (mkKeymap "n" "A" nMoveDown "Move Line Down") downKeys)
    (map (mkKeymap "n" "A" nMoveUp "Move Line Up") upKeys)

    (map (mkKeymap "v" "A" vMoveDown "Move Selection Down") downKeys)
    (map (mkKeymap "v" "A" vMoveUp "Move Selection Up") upKeys)

    # --- Buffer Management (Tabs) ---
    (map (mkKeymap "n" "S" nextAction "Next Tab") rightKeys)
    (map (mkKeymap "n" "S" prevAction "Previous Tab") leftKeys)
    {
      mode = "n";
      key = "<S-x>";
      action = "<cmd>lua MiniBufremove.delete(0, false)<cr>";
      options.desc = "Close Buffer (Preserve Layout)";
    }
  ];
}
