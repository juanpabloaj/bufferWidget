" File: bufferWidget.vim
" Author: juanpablo <jpabloaj@gmail.com>
" Description: 
if !exists('g:buffer_widget_view')
	let g:buffer_widget_view='small'
endif
fun! BufferWidget() "{{{
	let widget=''
	if g:buffer_widget_view == 'small'
		let nbfs =len(filter(range(1, bufnr('$')),'buflisted(v:val)'))
		if nbfs == 1
			let widget = bufnr('%')
		else
			let widget = bufnr('%').'/'.len(filter(range(1, bufnr('$')),'buflisted(v:val)'))
		endif
	else
		for i in filter(range(1, bufnr('$')), 'buflisted(v:val)')
			if g:buffer_widget_view=='numbers'
				if i == bufnr('%')
					let widget=widget.i
				else
					let widget=widget.'['.i.']'
				endif
			elseif g:buffer_widget_view == 'bars'
				if i == bufnr('%')
					let widget=widget.i
				else
					let widget=widget.'|'
				endif
			endif
		endfor
	endif
	return widget
endf "}}}
