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
    -- Bootstrap lazy.nvim plugin manager
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
    })
  '';
}
