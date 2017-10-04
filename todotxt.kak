# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .+\.todo\.txt %{
    set buffer filetype todotxt
}

face TodoPrioA red+b
face TodoPrioB yellow+b
face TodoPrioC cyan+b


add-highlighter -group / group todotxt
add-highlighter -group /todotxt regex "^x ([^\n]+)" 0:comment
add-highlighter -group /todotxt regex "^\(A\) ([^\n]+)" 0:TodoPrioA
add-highlighter -group /todotxt regex "^\(B\) ([^\n]+)" 0:TodoPrioB
add-highlighter -group /todotxt regex "^\(C\) ([^\n]+)" 0:TodoPrioC
add-highlighter -group /todotxt regex "([^:|^ ]+:)([^ |^\n]+)" 0:value 1:type
add-highlighter -group /todotxt regex "(\+[^\+|^ |^\n]+)" 0:keyword
add-highlighter -group /todotxt regex "(@[^\+|^ |^\n]+)" 0:meta

hook -group todotxt-highlight global WinSetOption filetype=todotxt %{ add-highlighter ref todotxt }
hook -group todotxt-highlight global WinSetOption filetype=(?!todotxt).* %{ remove-highlighter todotxt }
