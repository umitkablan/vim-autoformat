if exists('g:loaded_auffmt_cssbeautify_definition') || !exists('g:loaded_auf_registry_autoload')
    finish
endif
let g:loaded_auffmt_cssbeautify_definition = 1

let s:definition = {
            \ 'ID'        : 'cssbeautify',
            \ 'executable': 'css-beautify',
            \ 'filetypes' : ['css'],
            \ 'ranged'    : 0,
            \ 'fileout'   : 0
            \ }

function! auf#formatters#cssbeautify#define() abort
    return s:definition
endfunction

function! auf#formatters#cssbeautify#cmd(ftype, inpath, outpath, line0, line1) abort
    if a:outpath || a:line0 || a:line1 || a:ftype
    endif
    let style = '-f - -s ' . shiftwidth()
    return 'css-beautify ' . style . ' ' . a:inpath
endfunction

call auf#registry#RegisterFormatter(s:definition)
