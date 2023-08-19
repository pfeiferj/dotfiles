-- SET
vim.o.termguicolors=true
--vim.g.python3_host_prog = "/usr/bin/python3"

vim.o.backupskip = vim.o.backupskip .. '*.gpg'

vim.o.signcolumn='yes'
vim.o.updatetime=200
vim.o.shortmess = vim.o.shortmess .. 'c'

vim.o.previewheight=10
vim.o.inccommand='nosplit'
vim.o.mousemodel='popup'

vim.o.mouse='a'
vim.o.spelllang='en_us'
vim.o.spell=false
vim.o.ignorecase=true
vim.o.smartcase=true
vim.o.cursorline=true

vim.o.undofile=true
vim.o.undolevels=1000
vim.o.undoreload=10000
vim.o.tabstop=2
vim.o.softtabstop=0
vim.o.expandtab=true
vim.o.shiftwidth=2
vim.o.smarttab=true
vim.o.number=true
vim.o.showmatch=true
vim.o.completeopt='menu,menuone,noselect,noinsert'
vim.o.omnifunc='syntaxcomplete#Complete'
vim.o.grepprg="rg --vimgrep --no-heading --smart-case --hidden -g '!.git/' -g '!*.lock'"

vim.o.background='dark'

vim.o.diffopt='internal,filler,closeoff,algorithm:histogram,indent-heuristic,iwhite'

vim.o.colorcolumn='120'

vim.o.title=true

vim.o.lazyredraw = true
vim.diagnostic.config({
  virtual_text = false,
})

vim.o.mousemoveevent = true

vim.cmd([[
sign define marker text=* texthl=Search linehl=Search
]])

--Diff signs
vim.cmd([[
hi GitSignsAddNr ctermfg=34 ctermbg=none guifg=#50C878 guibg=none
hi GitSignsChangeNr ctermfg=31 ctermbg=none guifg=#00ccdd guibg=none
hi GitSignsDeleteNr ctermfg=160 ctermbg=none guifg=#FA5F55 guibg=none
]])


vim.cmd([[
let g:clipboard = {
  \   'name': 'myClipboard',
          \   'copy': {
          \      '+': ['pbcopy'],
          \      '*': ['pbcopy'],
          \    },
          \   'paste': {
          \      '+': ['pbpaste'],
          \      '*': ['pbpaste'],
          \   }
  \ }
]])
