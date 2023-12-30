return {
  'akinsho/flutter-tools.nvim',
  event = { "BufReadPre", "BufNewFile" },
  ft = { "dart" },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    require("flutter-tools").setup({
      fvm = true,
    })
  end
}
