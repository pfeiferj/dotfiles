return {
  {
    'stevearc/conform.nvim',
    config = function()
      require('conform').setup {
        lsp_fallback = true,
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = { "isort", "yapf" },
          -- Use a sub-list to run only the first available formatter
          javascript = { { "prettierd", "prettier" } },
          go = { "gofumpt" },
          json = { "jq" },
          templ = { "templ" },
          zig = { "zigfmt" },
          yaml = { "yamlfmt" },
          markdown = { "mdfmt" },
        },
      }
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end
  },
}
