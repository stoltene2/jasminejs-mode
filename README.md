# jasminejs-mode

jasminejs-mode helps you manipulate and edit [Jasmine](http://jasmine.github.io/) test files.

## Keybinding

All keybindings in buster-mode start with `C-c j` and then a two-letter mnemonic shortcut.

* `it` -- *I*t *T*oggle between `it` and `iit`
* `ip` -- *I*t *P*ending between `it` and `xit`
* `dt` -- *D*escribe *T*oggle between `describe` and `ddescribe`
* `dp` -- *D*escribe *P*ending between `describe` and `describe`

## Development

Intstall the dependencies with cask

    cask install


Run the tests with:

    $ cask exec ecukes

## Special Thanks

I'd like to thank Magnars for creating such great modes for Emacs. The basis of this mode was inspired by his busterjs-mode.x
