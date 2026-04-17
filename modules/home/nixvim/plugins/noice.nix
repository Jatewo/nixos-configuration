{
  plugins = {
    notify = {
      enable = true;
      settings = {
        background_color = "#000000";
        fps = 60;
        render = "default";
        timeout = 3000;
        top_down = true;
      };
    };

    noice = {
      enable = true;
      settings = {
        cmdline = {
          view = "cmdline_popup";
        };
        messages = {
          enables = true;
        };
        popupmenu = {
          enabled = true;
        };
        presets = {
          bottom_search = false; # Forces search (/) to be a center popup
          command_palette = true; # Centers the command line (:)
          long_message_to_split = true; # Long messages open in a split instead of crashing the UI
          lsp_doc_border = true; # Adds borders to LSP hover documentation
        };
      };
    };
  };
}
