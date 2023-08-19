return {
  {
    'mfussenegger/nvim-lint',
    event = {'BufWritePost'},
    cmd = 'Lint',
    config = function()
      local rubocop = require('lint').linters.rubocop
      rubocop.cmd = 'bundle'
      rubocop.args = {'exec', 'rubocop', '--format', 'json', '--force-exclusion'}
      require('lint').linters_by_ft = {
        eruby = {'erb_lint', 'rubocop'},
        python = {'ruff','mypy'},
        go = {'golangcilint'},
        javascript = {'eslint'},
        typescript = {'eslint'},
      }
      vim.api.nvim_create_user_command(
        'Lint',
        'lua require("lint").try_lint()',
        {}
      )
      vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        pattern = {'*.py', '*.go', '*.rb', '*.erb', '*.js', '*.ts'},
        callback = function()
          require('lint').try_lint()
        end,
      })
    end
  }
}
