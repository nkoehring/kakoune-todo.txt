# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .+\.todo\.txt %{
    set buffer filetype todotxt
}


add-highlighter -group / group todotxt
add-highlighter -group /todotxt regex "^x ([^\n]+)" 0:comment
add-highlighter -group /todotxt regex "^\(A\) ([^\n]+)" 0:builtin
add-highlighter -group /todotxt regex "^\(B\) ([^\n]+)" 0:meta
add-highlighter -group /todotxt regex "^\(C\) ([^\n]+)" 0:operator
add-highlighter -group /todotxt regex "([a-zA-Z0-9]+:)([^ |^\n]+)" 0:value 1:type

hook -group todotxt-highlight global WinSetOption filetype=todotxt %{ add-highlighter ref todotxt }
hook -group todotxt-highlight global WinSetOption filetype=(?!todotxt).* %{ remove-highlighter todotxt }
