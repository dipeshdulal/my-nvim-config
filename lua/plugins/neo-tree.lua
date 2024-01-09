return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      '<C-n>', "<cmd>Neotree toggle position=left <CR>", desc="toggle neotree"
    },
  },
  config = function()
    local neotree = require("neo-tree")
    neotree.setup({
      filesystem = {
        filtered_items = {
          visible = true, -- hide just means dimmed
          hide_dotfiles = false,
          hide_gitignored = true,
        }
      }
    })
  end
}
