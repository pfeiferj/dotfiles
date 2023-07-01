return {
  {
    'folke/trouble.nvim',
    config = function()
      require("trouble").setup {
        icons = false,
        fold_open = "v", -- icon used for open folds
        fold_closed = ">", -- icon used for closed folds
        indent_lines = false, -- add an indent guide below the fold icons
        signs = {
          -- icons / text used for a diagnostic
          error = "error",
          warning = "warn",
          hint = "hint",
          information = "info"
        },
        use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
      }
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
      "vim-test/vim-test",
      "nvim-neotest/neotest-vim-test",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rspec")({
            root_files = { "Gemfile" },
            rspec_cmd = function()
              return vim.tbl_flatten({
                "bundle",
                "exec",
                "rspec",
              })
            end
          }),
          require "neotest-vim-test" {
            ignore_file_types = { "vim", "lua", "ruby" },
          },
        }
      })
    end,
  },
}
