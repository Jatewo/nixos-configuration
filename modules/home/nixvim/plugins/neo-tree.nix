{
  plugins.neo-tree = {
    enable = true;
    settings = {
      closeIfLastWindow = true;

      window.mappings = {
        # Use Space/Enter to open, or 'v'/'s' for splits
        "<space>" = "open";
        "v" = "open_vsplit";
        "s" = "open_split";
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<C-n>";
      action = "<cmd>Neotree toggle<CR>";
      options.silent = true;
    }
  ];
}
