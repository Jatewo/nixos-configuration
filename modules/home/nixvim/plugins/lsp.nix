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

    keymaps = {
      silent = true;
      lspBuf = {
        "K" = {
          action = "hover";
          desc = "Hover Documentation";
        };
        "gd" = {
          action = "definition";
          desc = "Go to Definition";
        };
        "gr" = {
          action = "references";
          desc = "Go to References";
        };
        "gt" = {
          action = "type_definition";
          desc = "Go to Type Definition";
        };
        "gi" = {
          action = "implementation";
          desc = "Go to Implementation";
        };
        "<leader>rn" = {
          action = "rename";
          desc = "Rename Variable";
        };
        "<leader>ca" = {
          action = "code_action";
          desc = "Code Actions";
        };
      };
      diagnostic = {
        "[d" = {
          action = "goto_prev";
          desc = "Previous Diagnostic";
        };
        "]d" = {
          action = "goto_next";
          desc = "Next Diagnostic";
        };
      };
    };
  };
}
