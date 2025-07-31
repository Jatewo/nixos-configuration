{ config, pkgs, ... }:

{
  home.username = "jacobtw";
  home.homeDirectory = "/home/jacobtw";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    kdePackages.kate
    git
    neofetch
  ];

  xdg.configFile."nvim/init.lua".text = ''
  -- Bootstrap lazy.nvim plugin manager
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
      vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
      })
    end
    vim.opt.rtp:prepend(lazypath)

    require("lazy").setup({
      {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        config = function()
          require("copilot").setup({
            suggestion = { enabled = true, auto_trigger = true },
            panel = { enabled = false },
          })
        end,
      },
    })
  '';

  programs.neovim = {
    enable = true;
    withNodeJs = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [ gcc python3 nodejs ];
  };

  # Optional
  programs.git.enable = true;
  programs.zsh.enable = true;

  home.stateVersion = "24.05"; # Match your system
}
