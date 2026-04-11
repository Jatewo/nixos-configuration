{
  config,
  pkgs,
  ...
}: {
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;

    extraPackages = with pkgs; [gcc python3 nodejs alejandra];

    opts = {
      clipboard = "unnamedplus";
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
      expandtab = true;
    };

    files = {
      "ftplugin/python.lua".opts = {
        shiftwidth = 4;
        tabstop = 4;
        softtabstop = 4;
      };
    };

    colorschemes.tokyonight = {
      enable = true;
      settings = {
        transparent = true;
        styles = {
          sidebars = "transparent";
          floats = "transparent";
        };
        on_colors = ''
          function(colors)
            colors.bg_statusline = colors.none
          end
        '';
      };
    };

    # colorschemes.kanagawa = {
    #   :lua print(vim.inspect(vim.b.gitsigns_status_dict))enable = true;
    #   settings = {
    #     transparent = true;
    #     theme = "dragon"; # wave, dragon, lotus
    #     colors = {
    #     };
    #   };
    # };

    plugins = {
      copilot-lua = {
        enable = true;
        settings = {
          filetypes = {
            "*" = true;
          };
          panel = {
            enabled = false;
          };
          suggestion = {
            enabled = true;
            auto_trigger = true;
            keymap = {
              accept = "<Tab>";
              accept_word = false;
              accept_line = false;
              next = "<C-k>";
              prev = "<C-j>";
            };
          };
        };
      };

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

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lsp_fallback = true;
            timeout_ms = 500;
          };
          formatters_by_ft = {
            nix = ["alejandra"];
            # python = [ "ruff" ];
          };
        };
      };

      lualine = {
        enable = true;
        settings = {
          options = {
            theme = "tokyonight";
            globalstatus = true;
            section_separators = "";
            component_separators = "";
          };
          sections = {
            lualine_a = ["mode"];
            lualine_b = [
              "branch"
              {
                name = "diff";
                source.__raw = ''
                  function()
                    local file = vim.fn.expand("%")
                    if file == "" then return nil end

                    local handle = io.popen("git diff --shortstat HEAD -- " .. file .. " 2>/dev/null")
                    if not handle then return nil end
                    local result = handle:read("*a")
                    handle:close()

                    if result == "" then return nil end

                    -- Parse the git output (e.g., " 1 file changed, 2 insertions(+), 1 deletion(-)")
                    local added = result:match("(%d+) insertion") or 0
                    local removed = result:match("(%d+) deletion") or 0

                    return {
                      added = tonumber(added),
                      modified = 0, -- Git shortstat treats "changes" as an addition + deletion
                      removed = tonumber(removed)
                    }
                  end
                '';
                symbols = {
                  added = " ";
                  modified = " ";
                  removed = " ";
                };
              }
            ];
            lualine_c = [
              "filename"
              {
                name = "diagnostics";
                sources = ["nvim_lsp"];
                sections = ["error" "warn" "info" "hint"];
                symbols = {
                  error = " ";
                  warn = " ";
                  info = " ";
                  hint = "󰌵 ";
                };
              }
            ];
            lualine_x = [
              # This displays "Spaces: 2" or "Tabs: 4"
              {
                name.__raw = ''
                  function()
                    local expandtab = vim.api.nvim_get_option_value("expandtab", { scope = "local" })
                    local size = vim.api.nvim_get_option_value("shiftwidth", { scope = "local" })
                    if expandtab then
                      return "Sp: " .. size
                    else
                      return "Tab: " .. size
                    end
                  end
                '';
              }
              "encoding"
              "filetype"
            ];
            lualine_y = ["progress"];
            lualine_z = ["location"];
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
