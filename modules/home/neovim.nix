{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [ gcc python3 nodejs ];
  };

  xdg.configFile."nvim/init.lua".text = ''
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
      vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
      })
    end
    vim.opt.clipboard = "unnamedplus"
    vim.opt.rtp:prepend(lazypath)

    vim.api.nvim_create_user_command('W', function()
      vim.cmd('SudaWrite')
    end, { desc = 'Write file with sudo' })

    require("lazy").setup({
      {
        "zbirenbaum/copilot.lua",
        config = function()
          require("copilot").setup({
            suggestion = {
              enabled = true,
              auto_trigger = true,
              keymap = {
                accept = "<Tab>",
                accept_word = false,
                accept_line = false,
                next = "<C-k>",
                prev = "<C-j>",
              }
            },
            panel = { enabled = false },
          })
        end,
      },

      {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
          require('nvim-treesitter.configs').setup {
            ensure_installed = { "c", "cpp", "python", "lua", "javascript" },
            highlight = { enable = true },
            indent = { enable = true },
          }
        end,
      },

      {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
          vim.cmd([[colorscheme tokyonight]])
        end,
      },

      {
        "lambdalisue/suda.vim",
        config = function()
          vim.cmd('runtime plugin/suda.vim')
        end,
      },

      {
        "nvim-tree/nvim-web-devicons",
        config = function()
          require("nvim-web-devicons").setup({
            override = {
              nix = {
                icon = "❄",
                color = "#7ea3cb",
                name = "Nix"
              },
              md = {
                icon = "📝",
                color = "#519aba",
                name = "Markdown"
              }
            }
          })
        end
      },

      {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
          "nvim-tree/nvim-web-devicons",
        },
        config = function()
          require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = {
              width = 30,
            },
            renderer = {
              group_empty = true,
              icons = {
                glyphs = {
                  folder = {
                    arrow_closed = "▶",
                    arrow_open = "▼",
                    default = "📁",
                    open = "📂",
                    empty = "🗀",
                    empty_open = "🗁",
                    symlink = "🔗",
                    symlink_open = "🔗",
                  }
                }
              }
            },
            filters = {
              dotfiles = false,
            },
          })
          
          vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
        end,
      },
    })
  '';
}
