return {
  {
    'folke/neodev.nvim',
    ft = 'lua',
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    dependencies = {
      'zbirenbaum/copilot-cmp',
    },
    opts = {
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = '[[',
          jump_next = ']]',
          accept = '<CR>',
          refresh = 'gr',
          open = '<M-CR>'
        },
        layout = {
          position = 'bottom', -- | top | left | right
          ratio = 0.4
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = false,
        debounce = 75,
        keymap = {
          accept = '<M-l>',
          accept_word = false,
          accept_line = false,
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
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
        ['.'] = false,
      },
      copilot_node_command = 'node', -- Node.js version must be > 16.x
      server_opts_overrides = {},
    },
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

    },
    event = 'VeryLazy',
    config = function()
      require('mason').setup({
        log_level = vim.log.levels.ERROR
      })


      local lsp = require('lsp-zero').preset({
        name = 'minimal',
        set_lsp_keymaps = true,
        suggest_lsp_servers = true,
        manage_nvim_cmp = {
          set_extra_mappings = true,
        }
      })

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
      end)

      -- (Optional) Configure lua language server for neovim
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      local util = require('lspconfig').util
      require('lspconfig').solargraph.setup({
        root_dir = util.root_pattern('Gemfile'),
      })

      require('lspconfig').pylsp.setup {
        settings = {
          -- configure plugins in pylsp
          pylsp = {
            plugins = {
              pycodestyle = {enabled = false},
              pyflakes = {enabled = false},
              pylint = {enabled = false},
            },
          },
        },
      }

      lsp.setup()
      -- You need to setup `cmp` after lsp-zero
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()

      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then return false end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match('^%s*$') == nil
      end

      cmp.setup({
        sources = {
          { name = 'copilot', group_index = 2 },
          {name = 'nvim_lsp'},
          {name = 'buffer'},
          {name = 'path'},
          {name = 'luasnip'},
        },
        mapping = {
          ['<Tab>'] = vim.schedule_wrap(function(fallback)
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
    end,
  }
}
