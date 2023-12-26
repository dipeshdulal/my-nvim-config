return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    sidebar_filetypes = {
      ['neo-tree'] = { event = 'BufWipeout' }
    }
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
