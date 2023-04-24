let s:fontsize = 11
function! ChangeFontSize(change)
    let s:fontsize = s:fontsize + a:change
    execute "GuiFont! Fira Code:h" . s:fontsize
endfunction

call ChangeFontSize(0)

GuiPopupmenu 0

nnoremap <silent> <M-=> :call ChangeFontSize(1)<CR>
nnoremap <silent> <M--> :call ChangeFontSize(-1)<CR>
