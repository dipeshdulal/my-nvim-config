return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local tokyonight = require("tokyonight")
      tokyonight.setup({
        on_highlights = function(hl, colors)
          hl.CursorLineNr = {
            fg = colors.yellow
          }
          hl.LineNr = {
            fg = "#b8910f"
          }
        end
      })
      vim.opt.termguicolors = true
      vim.cmd.colorscheme("tokyonight")
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      local lualine = require("lualine")
      lualine.setup({
        options = {
          theme = "tokyonight"
        }
      })
    end
  },
}
