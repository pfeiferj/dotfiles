return {
  {
    'jackMort/ChatGPT.nvim',
    cmd = {'ChatGPT', 'ChatGPTActAs', 'ChatGPTCompleteCode', 'ChatGPTEditWithInstructions', 'ChatGPTRun'},
    opts = {
      api_key_cmd = vim.fn.expand('$HOME') .. '/.config/.openai',
      popup_input = {
        max_visible_lines = 100
      },
      openai_params = {
        max_tokens = 2000,
      },
    }
  },
  {
    'aduros/ai.vim',
  },
}
