{
  plugins.lsp = {
    enable = true;

    servers = {
      # Nix
      nixd.enable = true;
      # Python
      pyright.enable = true;
      ruff.enable = true;
      # C/C++
      clangd.enable = true;
    };

    keymaps.lspBuf = {
      "gd" = "definition";
      "gD" = "references";
      "gt" = "type_definition";
      "gi" = "implementation";
      "K" = "hover";
      "<leader>rn" = "rename";
      "<leader>ca" = "code_action";
    };
  };
}
