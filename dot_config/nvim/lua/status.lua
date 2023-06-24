----STATUS
--function Status()
--	sl = ""
--	sl = sl .. "%#PmenuSel#"
--	sl = sl .. "%{FugitiveStatusline()}"
--	sl = sl .. "%#LineNr#"
--	sl = sl .. "%#CursorColumn# %{fnamemodify(getcwd(),':t')} %#LineNr#"
--	sl = sl .. "%="
--	sl = sl .. "%#CursorColumn#"
--	sl = sl .. " %p%%"
--	sl = sl .. " %l:%c"
--	sl = sl .. " %y"
--	sl = sl .. " %{&fileencoding?&fileencoding:&encoding}"
--	sl = sl .. "[%{&fileformat}]"
--	vim.o.statusline = sl
--  vim.o.laststatus = 3  
--end
--Status()

function Winbar()
  wb = ""
	wb = wb .. "%#CursorColumn#"
	wb = wb .. " %f%#LineNr#"
	wb = wb .. "%m"
  vim.o.winbar = wb
end
Winbar()

vim.cmd([[
set showtabline=1  " 1 to show tabline only when more than one tab is present
set tabline=%!MyTabLine()  " custom tab pages line
function! MyTabLine() " acclamation to avoid conflict
  let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " set highlight
    if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
    else
            let s .= '%#TabLine#'
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    let s .= ' '
    " set page number string
    let s .= t + 1 . ' '
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLineFill#%999Xclose'
  endif
  return s
endfunction
]])
