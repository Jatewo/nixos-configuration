{
  plugins = {
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
  };
}
