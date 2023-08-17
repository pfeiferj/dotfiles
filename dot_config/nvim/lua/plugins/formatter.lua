return {
  {
    'mhartington/formatter.nvim',
    event = {'BufWritePre', 'InsertLeave'},
    cmd = {'FormatWrite', 'Format'},
    config = function()
      local util = require "formatter.util"

      -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
      require("formatter").setup {
        logging = true,
        log_level = vim.log.levels.WARN,
        filetype = {
          ruby = {
            function()
              return {
                exe = "bundle",
                args = {
                  "exec",
                  "rubocop",
                  "--autocorrect",
                  "--stdin",
                  util.escape_path(util.get_current_buffer_file_name()),
                  "--format",
                  "files",
                  "--stderr",
                },
                stdin = true,
                ignore_exitcode = true,
              }
            end
          },
          eruby = {
            function()
              return {
                exe = "bundle",
                args = {
                  "exec",
                  "erblint",
                  "--autocorrect",
                },
                stdin = false,
                ignore_exitcode = true,
              }
            end
          },
          python = {
            function()
              return {
                exe = "ruff",
                args = {
                  'check',
                  '--force-exclude',
                  '--quiet',
                  '--fix-only',
                },
                stdin = false,
              }
            end
          },
          go = {
            require("formatter.filetypes.go").gofmt,
          },
          ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace
          }
        }
      }
      vim.cmd([[
      augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost *.rb FormatWrite
      autocmd BufWritePost *.erb FormatWrite
      autocmd BufWritePost *.go FormatWrite
      augroup END
      ]])
    end
  },
}
