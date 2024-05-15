return {
  'RRethy/vim-illuminate',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local illuminate = require("illuminate")
    illuminate.configure({
      providers = {
        'lsp',
        'treesitter',
        'regex',
      },
      delay = 100,
      filetypes_denylist = {
        'dirbuf',
        'dirvish',
        'fugitive',
      },
    })
  end
}
