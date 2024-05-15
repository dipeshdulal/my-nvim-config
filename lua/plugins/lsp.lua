return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",           -- source for text in buffer
      "hrsh7th/cmp-path",             -- source for file system paths
      "L3MON4D3/LuaSnip",             -- snippet engine
      "saadparwaiz1/cmp_luasnip",     -- for autocompletion
      "rafamadriz/friendly-snippets", -- useful snippets
      "onsails/lspkind-nvim",         -- adds icons to completion items
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        snippet = { -- configure how nvim-cmp interacts with snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered()
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = 'select' }), -- previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = 'select' }), -- next suggestion
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
          ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),

        -- sources for autocompletion
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- snippets
          { name = "buffer" },  -- text within current buffer
          { name = "path" },    -- file system paths
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text',
            menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              path = "[Path]",
            }),
          }),
        },
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason-lspconfig.nvim' },
      {
        "nvimtools/none-ls.nvim",
        config = function()
          local null_ls = require("null-ls")
          null_ls.setup({
            sources = {
              null_ls.builtins.diagnostics.eslint,
              null_ls.builtins.formatting.prettier,
              null_ls.builtins.code_actions.gitsigns,
              null_ls.builtins.formatting.black.with({ extra_args = { "--fast" }}),
            },
          })
        end,
      },
    },
    config = function()
      -- lsp keybindings
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }

          -- these will be buffer-local keybindings
          -- because they only work if you have an active language server

          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
          vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

          vim.keymap.set('n', '<leader>jj', '<cmd> lua vim.diagnostic.goto_next()<cr>', opts)
          vim.keymap.set('n', '<leader>kk', '<cmd> lua vim.diagnostic.goto_prev()<cr>', opts)

          -- override defaults from lsp_zero
          vim.keymap.set("n", "<leader>ca", '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
          -- code formatting
          vim.keymap.set("n", "<leader>mp", function()
            vim.lsp.buf.format({})
          end)
        end
      })

      -- hover borders
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local default_setup = function(server)
        require('lspconfig')[server].setup({
          capabilities = lsp_capabilities,
        })
      end

      require('mason-lspconfig').setup({
        ensure_installed = {
          "gopls",
          "tsserver",
          "html",
          "tailwindcss",
          "pyright"
        },
        handlers = {
          default_setup,
          lua_ls = function()
            require('lspconfig').lua_ls.setup({
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                  workspace = {
                    library = {
                      [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                      [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                    },
                  },
                },
              },
            })
          end,
        },
        automatic_installation = true,
      })
    end
  }
}
