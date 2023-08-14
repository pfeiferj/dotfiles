return {
  {
    'mfussenegger/nvim-lint',
    event = {'InsertLeave', 'BufWritePost'},
    cmd = 'Lint',
    config = function()
      local rubocop = require('lint').linters.rubocop
      rubocop.cmd = 'bundle'
      rubocop.args = {'exec', 'rubocop', '--format', 'json', '--force-exclusion'}
      require('lint').linters_by_ft = {
        eruby = {'erb_lint', 'rubocop'},
        python = {'ruff','mypy'},
        go = {'golangcilint'},
      }
      vim.api.nvim_create_user_command(
        'Lint',
        'lua require("lint").try_lint()',
        {}
      )
      vim.api.nvim_create_autocmd({ 'BufWritePost', 'TextChanged' }, {
        callback = function()
          require('lint').try_lint()
        end,
      })
    end
  }
}
