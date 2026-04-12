{
  plugins.telescope = {
    enable = true;

    settings.defaults = {
      prompt_prefix = "   ";
      selection_caret = " ";
      layout_strategy = "horizontal";
      layout_config = {
        prompt_position = "top";
      };
      sorting_strategy = "ascending";
    };

    keymaps = {
      "<leader>ff" = {
        action = "find_files";
        options.desc = "Find Files";
      };

      "<leader>fg" = {
        action = "live_grep";
        options.desc = "Live Grep (Search contents)";
      };

      "<leader>fb" = {
        action = "buffers";
        options.desc = "Find Open Buffers";
      };

      "<leader>fh" = {
        action = "help_tags";
        options.desc = "Find Help";
      };
    };
  };
}
