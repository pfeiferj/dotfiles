--KEYMAP
vim.cmd([[let mapleader=","]])


--Folding
vim.api.nvim_set_keymap('n', 'zV', ":let &foldlevel = foldlevel(line('.'))<CR>", { noremap = true })

--History
vim.api.nvim_set_keymap('n', '<Backspace>',     '<C-o>', { noremap = true, desc = 'Jump to previous position in jump history' })
vim.api.nvim_set_keymap('n', '<Delete>',        '<C-i>', { noremap = true, desc = 'Jump to next position in jump history' })

--Terminal
vim.api.nvim_set_keymap('t', '<Esc>',           '<C-\\><C-n>', { noremap = true, desc = 'Switch to normal mode' })

--Files
vim.api.nvim_set_keymap('n', '<C-p>',           ':Telescope git_files<CR>', { noremap = true, desc = 'Fuzzy find git files' })
vim.api.nvim_set_keymap('n', '<leader>s',           ':Telescope live_grep<CR>', { noremap = true, desc = 'Live grep' })

--Window Movement
vim.api.nvim_set_keymap('n', '<leader>h',       ':wincmd h<CR>', { noremap = true, desc = 'Move left one window' })
vim.api.nvim_set_keymap('n', '<leader>l',       ':wincmd l<CR>', { noremap = true, desc = 'Move right one window' })
vim.api.nvim_set_keymap('n', '<leader>k',       ':wincmd k<CR>', { noremap = true, desc = 'Move up one window' })
vim.api.nvim_set_keymap('n', '<leader>j',       ':wincmd j<CR>', { noremap = true, desc = 'Move down one window' })
vim.api.nvim_set_keymap('n', '<leader>H',       ':wincmd H<CR>', { noremap = true, desc = 'Move window left' })
vim.api.nvim_set_keymap('n', '<leader>L',       ':wincmd L<CR>', { noremap = true, desc = 'Move window right' })
vim.api.nvim_set_keymap('n', '<leader>J',       ':wincmd J<CR>', { noremap = true, desc = 'Move window down' })
vim.api.nvim_set_keymap('n', '<leader>K',       ':wincmd K<CR>', { noremap = true, desc = 'Move window up' })
vim.api.nvim_set_keymap('n', '<TAB>',           ':tabn<CR>', { noremap = true, desc = 'Switch to next tab' })
vim.api.nvim_set_keymap('n', '<A-TAB>',         ':tabn<CR>', { noremap = true, desc = 'Switch to next tab' })
vim.api.nvim_set_keymap('n', '<S-TAB>',         ':tabp<CR>', { noremap = true, desc = 'Switch to previous tab' })
vim.api.nvim_set_keymap('n', '<leader>-',       ':split<CR>:wincmd j<CR>', { noremap = true, desc = 'Create a horizontal window split' })
vim.api.nvim_set_keymap('n', '<leader>\\',      ':vsplit<CR>:wincmd l<CR>',{ noremap = true, desc = 'Create vertical window split' })

--Clipboard
vim.api.nvim_set_keymap('n', '<leader>y',       [["+y]], { noremap = true, desc = 'Yank to clipboard' })
vim.api.nvim_set_keymap('n', '<leader>p',       [["+p]], { noremap = true, desc = 'Paste from clipboard' })
vim.api.nvim_set_keymap('v', '<leader>y',       [["+y]], { noremap = true, desc = 'Yank to clipboard' })
vim.api.nvim_set_keymap('v', '<leader>p',       [["+p]], { noremap = true, desc = 'Paste from clipboard' })

--Search Highlighting
vim.api.nvim_set_keymap('n', '<leader><space>', ':nohlsearch<CR>', { noremap = true, desc = 'Remove search highlights' })

--Diff
vim.api.nvim_set_keymap('n', '<leader>d',       ':windo diffthis<CR>', { noremap = true, desc = 'Diff current split' })
vim.api.nvim_set_keymap('n', '<leader>D',       ':windo diffoff<CR>', { noremap = true, desc = 'Turn off diff' })

--Debugger
vim.api.nvim_set_keymap('n', '<leader>ic',      ":lua require'dap'.continue()<CR>", { noremap = true, desc = 'DAP: continue' })
vim.api.nvim_set_keymap('n', '<leader>iC',      ":lua require'dap'.repl.toggle({}, '80vsplit')<CR>", { noremap = true, desc = 'DAP: toggle repl' })
vim.api.nvim_set_keymap('n', '<leader>is',      ':lua Debugger()<CR>', { noremap = true, desc = 'DAP: open debugger' })
vim.api.nvim_set_keymap('n', '<leader>iS',      ':lua CloseDebugger()<CR>', { noremap = true, desc = 'DAP: close debugger' })
vim.api.nvim_set_keymap('n', '<leader>in',      ":lua require'dap'.step_over()<CR>", { noremap = true, desc = 'DAP: step over' })
vim.api.nvim_set_keymap('n', '<leader>ii',      ":lua require'dap'.step_into()<CR>", { noremap = true, desc = 'DAP: step into' })
vim.api.nvim_set_keymap('n', '<leader>iu',      ":lua require'dapui'.toggle()<CR>", { noremap = true, desc = 'DAP: toggle ui' })
vim.api.nvim_set_keymap('n', '<leader>iU',      ":Telescope dap commands<CR>", { noremap = true, desc = 'DAP: show commands' })
vim.api.nvim_set_keymap('n', '<leader>io',      ":lua require'dap'.step_out()<CR>", { noremap = true, desc = 'DAP: step out' })
vim.api.nvim_set_keymap('n', '<leader>ib',      ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, desc = 'DAP: toggle breakpoint' })
vim.api.nvim_set_keymap('n', '<leader>iB',      ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { noremap = true, desc = 'DAP: set conditional breakpoint' })
vim.api.nvim_set_keymap('n', '<leader>it',      ":lua require'dap'.repl.open()<CR>", { noremap = true, desc = 'DAP: open repl' })
vim.api.nvim_set_keymap('n', '<leader>ir',      ":lua require'dap'.run_to_cursor()<CR>", { noremap = true, desc = 'DAP: run to cursor' })

vim.api.nvim_set_keymap('n', '<leader>b',      ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, desc = 'DAP: toggle breakpoint' })


vim.api.nvim_set_keymap('i', '<C-n>',      '<C-x><C-o>', { noremap = true, desc = 'Open completion' })

vim.api.nvim_set_keymap('n', '<space>h',      ':Hurl<CR>', { noremap = true, desc = 'Run hurl' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


vim.cmd([[
command Date execute "normal i<C-R>=strftime('%F')<CR><ESC>"
command Time execute "normal i<C-R>=strftime('%T')<CR><ESC>"
command DateTime execute "normal i<C-R>=strftime('%F %T')<CR><ESC>"
]])
