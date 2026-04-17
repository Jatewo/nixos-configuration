{
  plugins = {
    web-devicons = {
      enable = true;
      settings = {
      };
    };

    dressing.enable = true;

    alpha = {
      enable = true;
      theme = "dashboard";
    };

    snacks = {
      enable = true;
      settings = {
        indent = {
          enabled = true;
          indent = {
            char = "│";
            only_scope = false;
            only_current = false;
          };
          # 1. Turn OFF the chunk (this stops it from trying to draw boxes)
          chunk = {
            enabled = true;
          };
          # 2. Turn ON the scope (this is the single active vertical line)
          scope = {
            enabled = true;
            # 3. Disable treesitter to force strict whitespace-based alignment
            treesitter = {
              enabled = true;
            };
          };
          animate = {
            enabled = true;
            duration = {
              step = 20;
              total = 200;
            };
          };
        };
      };
    };
  };

  # Prevent snacks.indent from drawing on your UI buffers
  extraConfigLua = ''
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      callback = function()
        vim.b.snacks_indent = false
      end,
    })
  '';
}
