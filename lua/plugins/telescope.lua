return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = { 
    'nvim-lua/plenary.nvim', 
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, 
            ["<C-j>"] = actions.move_selection_next,
          }
        }
      }
    })
    
    telescope.load_extension("fzf")

    local builtin = require("telescope.builtin")
    local k = vim.keymap
    k.set("n", "<leader>ff", builtin.find_files, {})
    k.set("n", "<leader>fg", builtin.live_grep, {})
    k.set("n", "<leader>fb", builtin.buffers, {})
    k.set("n", "<leader>fh", builtin.help_tags, {})
  end
}
