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

    neogit = {
      enable = true;
      settings = {
        kind = "auto";
      };
    };
  };
}
