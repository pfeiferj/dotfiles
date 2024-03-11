return {
  'epwalsh/obsidian.nvim',
  event = 'VeryLazy',
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  config = function()
    require('obsidian').setup({
      dir = '/Users/jacob/Documents/Default',  -- no need to call 'vim.fn.expand' here

      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = 'Daily',
        -- Optional, if you want to change the date format for daily notes.
        date_format = '%Y-%m-%d'
      },
      completion = {
        -- If using nvim-cmp, otherwise set to false
        nvim_cmp = true,
        -- Trigger completion at 2 chars
        min_chars = 2,
        -- Where to put new notes created from completion. Valid options are
        --  * "current_dir" - put new notes in same directory as the current buffer.
        --  * "notes_subdir" - put new notes in the default notes subdirectory.
        new_notes_location = 'current_dir',

        -- Whether to add the output of the node_id_func to new notes in autocompletion.
        -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
        prepend_note_id = true
      },
    })
  end,
}
