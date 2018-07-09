# kakoune-todo.txt

Easier editing of todo.txt files in Kakoune. Includes highlighting and typical commands to manipulate items.

The master branch should work with the newest tagged version of Kakoune (currently [v2018.04.13](https://github.com/mawww/kakoune/tree/v2018.04.13)). Please check out the [v9999.99.99](https://github.com/nkoehring/kakoune-todo.txt/tree/v9999.99.99) tree for compatibility with Kakounes unstable version.

## Highlighting

todo.txt highlighting with base64 colorscheme:

![todo.txt highlighting with base64 colorscheme](kak_todotxt.jpg)

## Commands

 * `:todo-mark-done` to mark current item as done
 * `:todo-mark-prio X` to mark current item as priority X
 * `:todo-sort` to sort items. Prioritised to top, done items to bottom.
