# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .+\.todo\.txt %{
    set buffer filetype todotxt
}

face TodoPrioA red+b
face TodoPrioB yellow+b
face TodoPrioC cyan+b
face TodoDate default+b


add-highlighter -group / group todotxt
add-highlighter -group /todotxt regex "^x ([^\n]+)" 0:comment                  # done items
add-highlighter -group /todotxt regex "^\(A\) ([^\n]+)" 0:TodoPrioA            # priority (A)
add-highlighter -group /todotxt regex "^\(B\) ([^\n]+)" 0:TodoPrioB            # priority (B)
add-highlighter -group /todotxt regex "^\(C\) ([^\n]+)" 0:TodoPrioC            # priority (C)
add-highlighter -group /todotxt regex "([^:|^ ]+:)([^ |^\n]+)" 0:value 1:type  # key:value
add-highlighter -group /todotxt regex "(\+[^\+|^ |^\n]+)" 0:keyword            # +project
add-highlighter -group /todotxt regex "(@[^\+|^ |^\n]+)" 0:meta                # @context
add-highlighter -group /todotxt regex "(\d{4}-\d{2}-\d{2})" 0:TodoDate         # date

hook -group todotxt-highlight global WinSetOption filetype=todotxt %{ add-highlighter ref todotxt }
hook -group todotxt-highlight global WinSetOption filetype=(?!todotxt).* %{ remove-highlighter todotxt }
