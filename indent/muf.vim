" MUF indent file
" Language:	MUF
" Maintainer:	Revar Desmera <revar@belfry.com>
" Last Change:	July 28, 2002
" Globals:	g:html_indent_tags         -- indenting keywords
" 		g:html_undent_tags         -- undenting keywords

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal indentexpr=GetMufIndent(v:lnum)
setlocal indentkeys=b,e,f,h,l,n,r,t,;,*<Return>,<space>,<bs>,{,}

" [-- avoid multiple sourcing --]
if exists("*GetMufIndent") | finish | endif

if exists('g:muf_indent_tags')
    unlet g:muf_indent_tags
endif

if exists('g:muf_undent_tags')
    unlet g:muf_undent_tags
endif

if exists('g:muf_inundent_tags')
    unlet g:muf_inundent_tags
endif


function! <SID>MufIndentPush(tag)
    if exists('g:muf_indent_tags')
        let g:muf_indent_tags = g:muf_indent_tags.'\|'.a:tag
    else
        let g:muf_indent_tags = a:tag
    endif
endfun


function! <SID>MufUndentPush(tag)
    if exists('g:muf_undent_tags')
        let g:muf_undent_tags = g:muf_undent_tags.'\|'.a:tag
    else
        let g:muf_undent_tags = a:tag
    endif
endfun


function! <SID>MufInUndentPush(tag)
    if exists('g:muf_inundent_tags')
        let g:muf_inundent_tags = g:muf_inundent_tags.'\|'.a:tag
    else
        let g:muf_inundent_tags = a:tag
    endif
endfun


call <SID>MufIndentPush('\$define')
call <SID>MufIndentPush('\$ifdef')
call <SID>MufIndentPush('\$ifndef')
call <SID>MufIndentPush('\$iflib')
call <SID>MufIndentPush('\$ifnlib')
call <SID>MufIndentPush('\$iflibver')
call <SID>MufIndentPush('\$ifnlibver')
call <SID>MufIndentPush(':')
call <SID>MufIndentPush('if')
call <SID>MufIndentPush('begin')
call <SID>MufIndentPush('for')
call <SID>MufIndentPush('foreach')
call <SID>MufIndentPush('try')
call <SID>MufIndentPush('case')
call <SID>MufIndentPush('when')
call <SID>MufIndentPush('default')
call <SID>MufIndentPush('{[^ \t]*')

call <SID>MufUndentPush('\$endef')
call <SID>MufUndentPush('\$endif')
call <SID>MufUndentPush(';')
call <SID>MufUndentPush('then')
call <SID>MufUndentPush('repeat')
call <SID>MufUndentPush('until')
call <SID>MufUndentPush('endcatch')
call <SID>MufUndentPush('end')
call <SID>MufUndentPush('endcase')
call <SID>MufUndentPush('}[^ \t]*')

call <SID>MufInUndentPush('\$else')
call <SID>MufInUndentPush('else')
" call <SID>MufInUndentPush('while')
call <SID>MufInUndentPush('catch')

delfun <SID>MufIndentPush
delfun <SID>MufUndentPush
delfun <SID>MufInUndentPush


function! <SID>MufIndentCount(lnum)
    let s = ' '.getline(a:lnum).' '
    let s = substitute(s, '([^)]*)', '', 'g')
    let s = substitute(s, '^[^)]*)', '', 'g')
    let s = substitute(s, '"[^"]*[^\\]"', '', 'g')
    let s = substitute(s, '\s\('.g:muf_indent_tags.'\)\s', ' § ', 'g')
    let s = substitute(s, '[^§]', '', 'g')
    return strlen(s)
endfunc


function! <SID>MufUndentCount(lnum)
    let s = ' '.getline(a:lnum).' '
    let s = substitute(s, '([^)]*)', '', 'g')
    let s = substitute(s, '^[^)]*)', '', 'g')
    let s = substitute(s, '"[^"]*[^\\]"', '', 'g')
    let s = substitute(s, '\s\('.g:muf_undent_tags.'\)\s', ' § ', 'g')
    let s = substitute(s, '[^§]', '', 'g')
    return strlen(s)
endfunc


function! <SID>MufInUndentCount(lnum)
    let s = ' '.getline(a:lnum).' '
    let s = substitute(s, '([^)]*)', '', 'g')
    let s = substitute(s, '^[^)]*)', '', 'g')
    let s = substitute(s, '"[^"]*[^\\]"', '', 'g')
    let s = substitute(s, '\s\('.g:muf_inundent_tags.'\)\s', ' § ', 'g')
    let s = substitute(s, '[^§]', '', 'g')
    return strlen(s)
endfunc


function! <SID>MufIndentSum(lnum, style)
    let mval = match(getline(a:lnum).' ', '^\s*\('.g:muf_undent_tags.'\)\s')
    let nval = match(getline(a:lnum).' ', '^\s*\('.g:muf_inundent_tags.'\)\s')
    echomsg 'Match='.mval.' style='.a:style
    if a:style == 0
        if mval == 0 || nval == 0
            return -1
        else
            return 0
        endif
    else
        if mval == 0
            return 0
        else
            let oval = <SID>MufInUndentCount(a:lnum) - <SID>MufUndentCount(a:lnum)
            if oval < 0
                let oval = 0
            endif
            return <SID>MufIndentCount(a:lnum) - <SID>MufUndentCount(a:lnum) + oval
        endif
    endif
endfunc


function! GetMufIndent(lnum)
    " Find a non-blank line above the current line.
    let plnum = prevnonblank(a:lnum - 1)

    " Hit the start of the file, use zero indent.
    if plnum == 0
        return 0
    endif

	"If we're in a comment, don't change indention.
	if synIDattr(synID(line("."), col("."), 0), "name") =~? "Comment"
		return -1
	endif

	"If we're in a String, don't change indention.
	if synIDattr(synID(line("."), col("."), 0), "name") =~? "String"
		return -1
	endif

    let ind = <SID>MufIndentSum(plnum, -1)
    let ind = ind + <SID>MufIndentSum(a:lnum, 0)

    return indent(plnum) + (&sw * ind)
endfunction

