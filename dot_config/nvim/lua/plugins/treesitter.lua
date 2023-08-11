return {
  {
    'pfeiferj/nvim-hurl',
    dependencies = {"MunifTanjim/nui.nvim"},
    lazy = false,
    config = function() require("hurl").setup() end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      vim.cmd([[
        set foldmethod=expr
        set foldexpr=nvim_treesitter#foldexpr()
        set nofoldenable                     " Disable folding at startup.
      ]])

      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "lua", "rust", "go", "python", "javascript", "typescript", "json", "bash",
          "dockerfile", "html", "css", "tsx", "vim", "yaml", "elixir", "gomod", "jq", "ruby",
        },
        --"hurl", "x12" }, -- "all" or a list of languages
        sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
        highlight = {
          enable = true, -- false will disable the whole extension
          additional_vim_regex_highlighting = { "markdown" },
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        indent = {
          enable = true
        }
      }
    end
  },
  {
    'nvim-treesitter/playground',
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
    config = function()
      require "nvim-treesitter.configs".setup {
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
          },
        }
      }
    end
  },
}
