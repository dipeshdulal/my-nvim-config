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

    vim.keymap.set("n", "<leader>jj", function()
      illuminate.goto_next_reference()
    end)

    vim.keymap.set("n", "<leader>kk", function()
      illuminate.goto_prev_reference()
    end)
  end
}
