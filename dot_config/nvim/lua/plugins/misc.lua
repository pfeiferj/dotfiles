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
    main = "ibl",
    event = 'BufRead',
    opts = {
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
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
  'christoomey/vim-tmux-navigator'
}
