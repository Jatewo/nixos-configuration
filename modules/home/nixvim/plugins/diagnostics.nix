{
  extraConfigLua = ''
    vim.diagnostic.config({
      underline = {
        severity = {min = vim.diagnostic.severity.HINT},
      },
      update_in_insert = true,
      severity_sort = true,
    })
  '';
}
