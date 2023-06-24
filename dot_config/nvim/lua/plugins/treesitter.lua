return {
  {
    'pfeiferj/nvim-hurl',
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
          additional_vim_regex_highlighting = false,
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
}
