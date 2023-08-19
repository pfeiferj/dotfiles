return {
  'jackMort/ChatGPT.nvim',
  cmd = {'ChatGPT', 'ChatGPTActAs', 'ChatGPTCompleteCode', 'ChatGPTEditWithInstructions', 'ChatGPTRun'},
  opts = {
    api_key_cmd = vim.fn.expand('$HOME') .. '/.config/.openai'
  }
}
