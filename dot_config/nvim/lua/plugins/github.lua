return {
  'pwntester/octo.nvim',
  cmd = {'Octo'},
  keys = {
    {'<leader>r', '<cmd>Octo search is:pull-request -label:reviewed label:team-pinnacles is:open -reviewed-by:@me repo:emporatitle/core<cr>', desc='review pull requests' },
    {'<leader>R', '<cmd>Octo search is:pull-request is:open -label:reviewed -reviewed-by:@me review-requested:@me<cr>', desc='review pull requests' },
  },
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {}
}
