" 5 January 2018
" I need the vimwiki #560 bugfix in
" https://github.com/vimwiki/vimwiki/commit/7668985b43bb1d31933532e1a4f5e66329034c29
" which is currently in the dev branch of vimwiki. Until it hits master for
" Vundle, I'm overwriting the function with the new/fixed one.

function! vimwiki#base#system_open_link(url)
  " handlers
  function! s:win32_handler(url)
    "Disable shellslash for cmd and command.com, but enable for all other shells
    "See Issue #560
    if (&shell =~? "cmd") || (&shell =~? "command.com")

      if exists('+shellslash')
        let old_ssl = &shellslash
        set noshellslash
        let url = shellescape(a:url, 1)
        let &shellslash = old_ssl
      else
        let url = shellescape(a:url, 1)
      endif
      execute 'silent ! start "Title" /B ' . url

    else

      if exists('+shellslash')
        let old_ssl = &shellslash
        set shellslash
        let url = shellescape(a:url, 1)
        let &shellslash = old_ssl
      else
        let url = shellescape(a:url, 1)
      endif
      execute 'silent ! start ' . url

    endif
  endfunction
 function! s:macunix_handler(url)
    call system('open ' . shellescape(a:url).' &')
  endfunction
  function! s:linux_handler(url)
    call system('xdg-open ' . shellescape(a:url).' &')
  endfunction
  try
    if vimwiki#u#is_windows()
      call s:win32_handler(a:url)
      return
    elseif vimwiki#u#is_macos()
      call s:macunix_handler(a:url)
      return
    else
      call s:linux_handler(a:url)
      return
    endif
  endtry
  echomsg 'Vimwiki Error: Default Vimwiki link handler was unable to open the HTML file!'
endfunction
