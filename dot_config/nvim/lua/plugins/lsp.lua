return {
  {
    'folke/neodev.nvim',
    dependencies = {
      "nvim-neotest/neotest",
    },
    config = function()
      require('neodev').setup({
        library = { plugins = { "neotest" }, types = true },
      })
    end
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = false,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {},
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',             -- Required
      'williamboman/mason.nvim',           -- Optional
      'williamboman/mason-lspconfig.nvim', -- Optional

      -- Autocompletion
      'hrsh7th/nvim-cmp',         -- Required
      'hrsh7th/cmp-nvim-lsp',     -- Required
      'hrsh7th/cmp-buffer',       -- Optional
      'hrsh7th/cmp-path',         -- Optional
      'saadparwaiz1/cmp_luasnip', -- Optional
      'hrsh7th/cmp-nvim-lua',     -- Optional

      -- Snippets
      'L3MON4D3/LuaSnip',             -- Required
      'rafamadriz/friendly-snippets', -- Optional
      'nvim-lua/plenary.nvim',

      'jay-babu/mason-null-ls.nvim',
      "jose-elias-alvarez/null-ls.nvim",
    },
    lazy = false,
    config = function()
      require('mason').setup({
        log_level = vim.log.levels.ERROR
      })


      local lsp = require('lsp-zero').preset({
        name = 'minimal',
        set_lsp_keymaps = true,
        manage_nvim_cmp = true,
        suggest_lsp_servers = true,
      })

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
      end)

      -- (Optional) Configure lua language server for neovim
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      local util = require('lspconfig').util
      require('lspconfig').solargraph.setup({
        root_dir = util.root_pattern("Gemfile"),
      })

      lsp.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ['solargraph'] = {'ruby'},
          -- if you have a working setup with null-ls
          -- you can specify filetypes it can format.
          -- ['null-ls'] = {'javascript', 'typescript'},
        }
      })

      lsp.setup()
      -- You need to setup `cmp` after lsp-zero
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()

      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
      end

      cmp.setup({
        sources = {
          { name = "copilot", group_index = 2 },
        },
        mapping = {
          ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end),
          -- `Enter` key to confirm completion
          ['<CR>'] = cmp.mapping.confirm({select = false}),

          -- Ctrl+Space to trigger completion menu
          ['<C-Space>'] = cmp.mapping.complete(),

          -- Navigate between snippet placeholder
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }
      })

      require("mason-null-ls").setup({
        ensure_installed = { "stylua", "jq", "cspell", "prettier" }
      })

      local null_ls = require('null-ls')
      local null_opts = lsp.build_options('null-ls', {})

      null_ls.setup({
        on_attach = function(client, bufnr)
          null_opts.on_attach(client, bufnr)
          ---
          -- you can add other stuff here....
          ---
        end,
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git", "Gemfile"),
        sources = {
          -- Replace these with the tools you have installed
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.eslint,

          null_ls.builtins.formatting.stylua,

          null_ls.builtins.diagnostics.cspell.with({
            filetypes = { "ruby", "erb", "e-ruby", "yaml", "markdown", "json" },
          }),
          null_ls.builtins.code_actions.cspell.with({
            filetypes = { "ruby", "e-ruby", "yaml", "markdown", "json", "erb" },
          }),

          null_ls.builtins.diagnostics.rubocop,
          null_ls.builtins.formatting.rubocop,

          null_ls.builtins.diagnostics.erb_lint,
          null_ls.builtins.formatting.erb_lint,
        }
      })
    end,
  }
}
