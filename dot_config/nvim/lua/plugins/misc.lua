return {
  'gennaro-tedesco/nvim-peekup',
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  'dsummersl/gundo.vim',
  'rcarriga/nvim-notify',
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    opts = {
      show_current_context = true,
      show_current_context_start = false,
    },
  },
}
