{
  plugins = {
    gitsigns = {
      enable = true;
      base = "HEAD";
      settings.signs = {
        add.text = "┃";
        change.text = "┃";
        delete.text = "_";
        topdelete.text = "‾";
        changedelete.text = "~";
        untracked.text = "┆";
      };
    };

    fugitive.enable = true;
    lazygit.enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>LazyGit<CR><cmd>lua require('neo-tree.sources.manager').refresh('filesystem')<CR>";
    }
  ];
}
