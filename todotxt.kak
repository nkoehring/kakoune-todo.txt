# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .+\.todo\.txt %{
    set buffer filetype todotxt

    def -docstring 'move all done items to the end' todo-done2bottom %{
        exec '%<a-s><a-k>^x <ret><d><g><e><a-p>:echo %reg{#} items moved<ret>'
    }
    def -docstring 'move all high priority items to the top' todo-a2top %{
        exec '%<a-s><a-k>^\(A\) <ret><d><g><g><a-P>:echo %reg{#} items moved<ret>'
    }
    def -docstring 'move all medium priority items to the top' todo-b2top %{
        exec '%<a-s><a-k>^\(B\) <ret><d><g><g><a-P>:echo %reg{#} items moved<ret>'
    }
    def -docstring 'move all low priority items to the top' todo-c2top %{
        exec '%<a-s><a-k>^\(C\) <ret><d><g><g><a-P>:echo %reg{#} items moved<ret>'
    }
    def -docstring 'sort items by priority and state' todo-sort %{
      exec '%:todo-c2top<ret>:todo-b2top<ret>:todo-a2top<ret>:todo-done2bottom<ret>'
    }
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

