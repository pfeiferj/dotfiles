return {
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function()
      vim.cmd([[
        if (empty($TMUX))
        if (has('nvim'))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        endif
        if (has('termguicolors'))
        set termguicolors
        endif
        endif
        colorscheme nightfox
      ]])
    end
  },
}
