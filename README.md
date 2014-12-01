# jasminejs-mode

jasminejs-mode helps you manipulate and edit [Jasmine](http://) test files.

## Keybinding

All keybindings in buster-mode start with `C-c C-t` and then a two-letter mnemonic shortcut.

## Development

To fetch the test dependencies:

    $ cd /path/to/jasminejs-mode
    $ git submodule init
    $ git submodule update

Run the tests with:

    $ ./util/ecukes/ecukes features

## Special Thanks

I'd like to thank Magnars for creating such great modes for Emacs. The basis of this mode was inspired by his busterjs-mode.x
