{
  plugins.treesitter = {
    enable = true;
    settings = {
      highlight.enable = true;
      indent = {
        enable = true;
        disable = ["nix"];
      };
      ensure_installed = [
        "c"
        "cpp"
        "python"
        "lua"
        "javascript"
      ];
    };
  };
}
