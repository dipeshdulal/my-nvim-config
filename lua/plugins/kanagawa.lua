return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local kanagawa = require("kanagawa")
      kanagawa.setup({
        transparent = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none"
              }
            }
          }
        }
      })
      vim.opt.termguicolors = true
      vim.cmd.colorscheme("kanagawa-wave")
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
