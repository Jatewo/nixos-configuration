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
            __unkeyed = "diff";
            source.__raw = ''
              function()
                local file = vim.fn.expand("%")
                if file == "" then return nil end

                local handle = io.popen("git diff --shortstat HEAD -- " .. file .. " 2>/dev/null")
                if not handle then return nil end
                local result = handle:read("*a")
                handle:close()

                if result == "" then return nil end

                local added = result:match("(%d+) insertion") or 0
                local removed = result:match("(%d+) deletion") or 0

                return {
                  added = tonumber(added),
                  modified = 0,
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
            __unkeyed = "diagnostics";
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
          {
            __unkeyed.__raw = ''
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
          {
            __unkeyed.__raw = ''
              function()
                local buf_ft = vim.api.nvim_get_option_value('filetype', { scope = 'local' })
                local clients = vim.lsp.get_clients({ bufnr = 0 })
                if next(clients) == nil then return "No LSP" end
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                  end
                end
                return "No LSP"
              end
            '';
            icon = " ";
            color = {fg = "#7aa2f7";};
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
