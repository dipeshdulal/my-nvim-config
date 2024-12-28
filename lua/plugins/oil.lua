return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup()

    -- netrw shortcut
    vim.keymap.set("n", '<C-n>', '<esc><cmd>Oil<cr>')
    vim.keymap.set("i", '<C-n>', '<esc><cmd>Oil<cr>')
  end
}