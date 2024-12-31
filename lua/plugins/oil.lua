return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup()

    -- netrw shortcut
    vim.keymap.set("n", '<C-n>', '<esc><cmd>Oil<cr>')
    vim.keymap.set("i", '<C-n>', '<esc><cmd>Oil<cr>')
  end
}
