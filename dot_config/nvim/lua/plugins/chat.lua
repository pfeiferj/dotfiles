return {
  'jackMort/ChatGPT.nvim',
  opts = {
    api_key_cmd = vim.fn.expand("$HOME") .. "/.config/.openai"
  }
}
