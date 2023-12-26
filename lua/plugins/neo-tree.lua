return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
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


    vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle position=left <CR>")
  end
}
