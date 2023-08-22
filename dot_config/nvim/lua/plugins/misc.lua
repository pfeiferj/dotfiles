return {
  {
    'gennaro-tedesco/nvim-peekup',
    event = 'VeryLazy',
  },
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
  },
  'rcarriga/nvim-notify',
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    opts = {
      show_current_context = true,
      show_current_context_start = false,
    },
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
    event = 'VeryLazy',
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VeryLazy',
    opts = {},
  },
}
