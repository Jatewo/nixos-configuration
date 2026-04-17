{
  imports = [
    ./completion.nix
    ./git.nix
    ./lualine.nix
    ./formatting.nix
    ./treesitter.nix
    ./ui-plugins.nix
    ./diagnostics.nix
    ./lsp.nix
    ./which-key.nix
    ./telescope.nix
    ./neo-tree.nix
    ./bufferline.nix
    ./noice.nix
  ];

  plugins.comment = {
    enable = true;
  };
}
