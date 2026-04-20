{
  plugins.dashboard = {
    enable = true;
    settings = {
      theme = "doom";
      config = {
        # Your custom ASCII art goes here!
        header = [
          " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗"
          " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║"
          " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║"
          " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║"
          " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║"
          " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝"
          "                                                       "
        ];

        # The interactive menu buttons
        center = [
          {
            action = "Telescope find_files";
            desc = " Find File";
            icon = " ";
            key = "f";
          }
          {
            action = "Telescope oldfiles";
            desc = " Recent Files";
            icon = " ";
            key = "r";
          }
          {
            action = "Telescope live_grep";
            desc = " Find Text";
            icon = " ";
            key = "g";
          }
          {
            action = "qa";
            desc = " Quit";
            icon = " ";
            key = "q";
          }
        ];

        footer = ["Welcome back, Jacob."];
      };
    };
  };

  autoCmd = [
    {
      event = ["BufEnter"];
      pattern = ["*"];
      callback = {
        __raw = ''
          function()
            -- 1. Get the current buffer name
            local buf_name = vim.api.nvim_buf_get_name(0)

            -- 2. Check if the buffer is completely empty, unnamed, and a normal file
            if buf_name == "" and vim.bo.filetype == "" and vim.bo.buftype == "" then
              -- 3. Replace the blank text file with the Dashboard!
              vim.cmd("Dashboard")
            end
          end
        '';
      };
    }
  ];
}
