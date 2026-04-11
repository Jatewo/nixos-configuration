{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;

    extraPackages = with pkgs; [ gcc python3 nodejs ];

    opts = {
      clipboard = "unnamedplus";
    };

    colorschemes.tokyonight.enable = true;

    plugins = {
      copilot-lua = {
        enable = true;
        panel = {
          enabled = false;
        };
        suggestion = {
          enabled = true;
          autoTrigger = true;
          keymap = {
            accept = "<Tab>";
            acceptWord = false;
            acceptLine = false;
            next = "<C-k>";
            prev = "<C-j>";
          };
        };
      };

      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
          ensure_installed = [
            "c"
            "cpp"
            "python"
            "lua"
            "javascript"
          ];
        };
      };

      web-devicons = {
        enable = true;
        settings = {
        };
      };

      nvim-tree = {
        enable = true;
	settings = {
	  sort_by = "case_sensitive";
	  view = {
            width = 30;
          };
          filters = {
            dotfiles = false;
          };
          renderer = {
            group_empty = true;
            icons = {
              glyphs = {
                folder = {
                  arrow_closed = "▶";
                  arrow_open = "▼";
                  default = "📁";
                  open = "📂";
                  empty = "🗀";
                  empty_open = "🗁";
                  symlink = "🔗";
                  symlink_open = "🔗";
                };
	        git = {
                  unstaged = "✗";
                  staged = "✓";
                  untracked = "★";
                  deleted = "⊖";
                  ignored = "◌";
	        };
              };
            };
          };
        };
      };
      fugitive.enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<C-n>";
        action = "<cmd>NvimTreeToggle<CR>";
        options = {
          silent = true;
          noremap = true;
        };
      }
      {
        mode = "n";
        key = "<leader>gs";
        action = "<cmd>Git<CR>";
      }
    ];
  };
}
