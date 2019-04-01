# kakoune-todo.txt

Easier editing of todo.txt files in Kakoune. Includes highlighting and typical commands to manipulate items.

The master branch should work with the release version of Kakoune (currently [v2019.01.20](https://github.com/mawww/kakoune/tree/v2019.01.20)). I'm currently not checking for compatibility with Kakounes unstable version.

## Highlighting

todo.txt highlighting with base64 colorscheme:

![todo.txt highlighting with base64 colorscheme](kak_todotxt.jpg)

## Commands

 * `:todo-mark-done` to mark current item as done
 * `:todo-mark-prio X` to mark current item as priority X
 * `:todo-sort` to sort items. Prioritised to top, done items to bottom.
