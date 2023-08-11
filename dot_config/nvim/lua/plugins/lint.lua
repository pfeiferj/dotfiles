return {
  {
    'mfussenegger/nvim-lint',
    event = 'InsertLeave',
    config = function()
      require('lint').linters_by_ft = {
        eruby = {'erb_lint',}
      }
      vim.api.nvim_create_autocmd({ 'BufWritePost', 'TextChanged' }, {
        callback = function()
          require('lint').try_lint()
        end,
      })
    end
  }
}
