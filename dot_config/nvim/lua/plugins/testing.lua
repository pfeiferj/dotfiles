return {
  {
    'folke/trouble.nvim',
    cmd = {
      'Trouble',
    },
    config = function()
      require('trouble').setup {
        icons = false,
        fold_open = 'v', -- icon used for open folds
        fold_closed = '>', -- icon used for closed folds
        indent_lines = false, -- add an indent guide below the fold icons
        signs = {
          -- icons / text used for a diagnostic
          error = 'error',
          warning = 'warn',
          hint = 'hint',
          information = 'info'
        },
        use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
      }
    end,
  },
  {
    'vim-test/vim-test',
    opts = {},
    dependencies = {
      'preservim/vimux',
    },
    keys = {
      {'<leader>t', '<cmd>TestNearest<cr>', noremap = true, desc = 'Run nearest test'},
      {'<leader>T', '<cmd>TestFile<cr>', noremap = true, desc = 'Run tests for current file'},
      {'<leader>a', '<cmd>TestSuite<cr>', noremap = true, desc = 'Run test suite'},
      {'<leader>g', '<cmd>TestVisit<cr>', noremap = true, desc = 'Visit test'},
    },
    cmd = {
      'TestNearest',
      'TestFile',
      'TestClass',
      'TestLast',
      'TestSuite',
      'TestVisit',
    },
    config = function()
      vim.g['test#strategy'] = 'vimux'
    end
  },
}
