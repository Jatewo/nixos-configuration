{
  plugins.lualine = {
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
}
