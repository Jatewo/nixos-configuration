{
  plugins = {
    cmp = {
      enable = true;
      settings = {
        completion = {
          autocomplete = false;
        };

        autoEnableSources = true;
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
        ];

        mapping = {
          "<C-Space>" = "cmp.mapping(cmp.mapping.complete(), { 'i', 's' })";
          "<C-@>" = "cmp.mapping(cmp.mapping.complete(), { 'i', 's' })";

          "<Tab>" = ''
            function(fallback)
              local cmp = require('cmp')
              local copilot = require('copilot.suggestion')

              if cmp.visible() then
                cmp.select_next_item()
              elseif copilot.is_visible() then
                copilot.accept()
              else
                fallback()
              end
            end
          '';
          "<S-Tab>" = ''
            function(fallback)
              local cmp = require('cmp')
              if cmp.visible() then
                cmp.select_prev_item()
              else
                fallback()
              end
            end
          '';
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<C-e>" = "cmp.mapping.close()";
        };
      };
    };

    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;

    copilot-lua = {
      enable = true;
      settings = {
        panel.enabled = false;
        suggestion = {
          enabled = true;
          auto_trigger = true;
          keymap.accept = false;
        };
      };
    };
  };
}
