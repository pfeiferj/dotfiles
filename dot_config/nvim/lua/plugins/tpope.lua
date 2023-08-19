return {
  {
    'tpope/vim-fugitive',
    keys = {
      {'<leader>g', '<cmd>Gdiff<cr>', desc='Show git diffs'},
    },
    cmd = {
      'Git',
    },
  },
  'tpope/vim-vinegar',
  {
    'tpope/vim-surround',
    event = 'VeryLazy',
  },
  'tpope/vim-projectionist',
  {
    'tpope/vim-repeat',
    event = 'VeryLazy',
  },
}
