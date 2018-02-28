# Todo Show Package [![Build Status](https://travis-ci.org/mrodalgaard/atom-todo-show.svg)](https://travis-ci.org/mrodalgaard/atom-todo-show)

Finds all TODO, FIXME, CHANGED, XXX, IDEA, HACK, NOTE, REVIEW, NB, BUG, QUESTION, COMBAK, TEMP comments in your project and shows them in a nice overview list.

Attention: This package searches for todos. For todo word highlighting see [language-todo](https://github.com/atom/language-todo).

Open todo list using command palette `Todo Show: Find In Workspace`, `Todo Show: Find In Project` or `Todo Show: Find In Open Files`. Keyboard shortcuts <kbd>CTRL</kbd> + <kbd>SHIFT</kbd> + <kbd>T</kbd> on Mac OSX or <kbd>ALT</kbd> + <kbd>SHIFT</kbd> + <kbd>T</kbd> on Windows and Linux.

Install with `apm install todo-show` or use *Install Packages* from *Atom Settings*.

![todo-show-package](https://raw.githubusercontent.com/mrodalgaard/atom-todo-show/master/screenshots/preview.png)

## Search Scopes

Five different scopes are available to narrow down your search for todos. Change scope using the button at the top of the todo view or use the corresponding command.
* __Workspace__: Searches all open projects.
* __Project__: Searches active project (a project is marked as active when you open a file it contains).
* __Open Files__: Searches currently open files.
* __Active File__: Searches last active file only.
* __Custom__: Tree view has a context menu to search for todos in the selected folder or file.

## Configuration

Name                  | Default                                 | Description
----------------------|-----------------------------------------|------------
_autoRefresh_         | `true`                                  | Automatic refresh of todo list after saving
_findTheseTodos_      | `['FIXME', 'TODO', 'CHANGED', 'XXX', 'IDEA', 'HACK', 'NOTE', 'REVIEW', 'NB', 'BUG', 'QUESTION', 'COMBAK', 'TEMP']` | An array of todo types used by the search regex
_findUsingRegex_      | See 'Regular Expression Search' section | Regex string used to find all your todos. `${TODOS}` is replaced with `FindTheseTodos` from above
_ignoreThesePaths_    | `['node_modules', 'vendor', 'bower_components', '*.pdf']` | An array of files / folders to exclude (syntax according to [scandal](https://github.com/atom/scandal) used internally by Atom). <br> ⚬ _globally_: `Ignored Names` from atom core settings. <br> ⚬ _locally_: Ignores anything in your `.gitignore` file, if the current project is a valid git repository and atom core setting `Exclude VCS Ignored Paths` is checked.
_showInTable_         | `['Text', 'Type', 'Path']`              | An array of properties to show for each todo in table
_sortBy_              | `'Text'`                                | Sort table by this todo property
_sortAscending_       | `true`                                  | Sort table in ascending or descending order
_saveOutputAs_        | `'List'`                                | Choose which format to use for saved markdown
_statusBarIndicator_  | `false`                                 | Show todo count in status bar (this is only shown and updated when the 'Todo Show' tab is open)

## Regular Expression Search

The regexes in `findTheseRegexes` are used for searching the workspace for todo matches. They are configurable to match the users specific needs.

Default regex string: `'/\\b(${TODOS})[:;.,]?\\d*($|\\s.*$|\\(.*$)/g'`
* `\b` start at word boundary
* `${TODOS}` todo type match (is replaced with `findTheseTodos`)
* `[:;.,]?` optional separator after type
* `\d*` optional digits for supporting [imdone](http://imdone.io/) sorting
* `$` to end todos without additional text (newline)
* Or `\s.*$` to match the todo text with a non-optional space in front
* Or an immediate parentheses, `\(.*$`, to support [Google style guide IDs](https://google.github.io/styleguide/cppguide.html#TODO_Comments)
* Because Atom config only accepts strings all `\` characters are also escaped

Todos can be tagged using hashtag (e.g. `TODO: do this #object #profile`), which is presented in the tags column.

To extend the default todo types and search regex, the existing config needs to be copied into your config.cson.

## Credits
Originally created by [Jamis Charles](https://github.com/jamischarles)

Now maintained by [Martin Rodalgaard](https://github.com/mrodalgaard)
