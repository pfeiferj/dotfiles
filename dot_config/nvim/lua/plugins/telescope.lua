return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'debugloop/telescope-undo.nvim',
    },
    config = function()
      require('telescope').setup({
        extensions = {
          undo = {},
        },
      })
      require('telescope').load_extension('undo')
    end,
    keys = {
      {'<C-p>',     '<cmd>Telescope git_files<cr>', desc='Fuzzy find git files'},
      {'<leader>s', '<cmd>Telescope live_grep<cr>', desc='Live grep'},
      {'<leader>s', '<cmd>Telescope live_grep<cr>', desc='Live grep'},
      {'gO',        '<cmd>Telescope lsp_document_symbols<cr>', desc='Open symbol outline'},
      {'gW',        '<cmd>Telescope lsp_workspace_symbols<cr>', desc='Open workspace symbol outline'},
      {'<leader>u', '<cmd>Telescope undo<cr>', desc='Telescope undo tree'},
    },
    cmd = {
      'Telescope',
    },
  },
}
