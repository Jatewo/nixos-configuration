{
  plugins.neo-tree = {
    enable = true;
    enablePreviewMode = true;
    settings = {
      closeIfLastWindow = true;

      filesystem = {
        use_libuv_file_watcher = true;
      };

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
      action = "<cmd>Neotree toggle dir=./<CR>";
      options.silent = true;
    }
  ];
}
