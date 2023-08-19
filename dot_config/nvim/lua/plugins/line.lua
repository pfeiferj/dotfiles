return {
  {
    'nvim-lualine/lualine.nvim',
    priority = 999,
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {
      options = {
        globalstatus = true
      }
    }
  },
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    priority = 998,
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        mode = "tabs",
      }
    },
  }
}
