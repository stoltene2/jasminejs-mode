[![Build Status](https://travis-ci.org/stoltene2/jasminejs-mode.svg)](https://travis-ci.org/stoltene2/jasminejs-mode)
[![MELPA](http://melpa.org/packages/jasminejs-mode-badge.svg)](http://melpa.org/#/jasminejs-mode)

# jasminejs-mode

jasminejs-mode helps you manipulate and edit [Jasmine](http://jasmine.github.io/) test files.

# Installation

This mode is a minor mode. Usually you want to use it along side
another mode like js2-mode or js3-mode. To use it along side js2-mode,
simply add a hook.

```elisp
(add-hook 'js2-mode-hook (lambda () (jasminejs-mode)))
```

You can now have this mode wherever you use js2-mode.

## Keybinding

All keybindings in jasminejs-mode start with `C-c C-j` and then a
two-letter mnemonic shortcut. You can customize `jasminejs-prefix-key`
to change the prefix key.

* `it` -- `I`t `T`oggle between `it` and `iit`
* `ip` -- `I`t `P`ending between `it` and `xit`
* `dt` -- `D`escribe `T`oggle between `describe` and `ddescribe`
* `dp` -- `D`escribe `P`ending between `describe` and `xdescribe`

If you would prefer not to customize `jasminejs-prefix-key` you can
add a new prefix key yourself. Personally, I prefer `C-c j`.

```elisp
(add-hook 'jasminejs-mode-hook (lambda ()
  (local-set-key (kbd "C-c j") 'jasminejs-prefix-map)))
```

## Snippets

Writing tests is nice when its easy. Make it easier by typing less.

Below are some snippets that can be loaded.

To load snippets you should load them after yasnippet is loaded and in the after hook.

For example,

```elisp
(add-hook 'jasminejs-mode-hook (lambda () (jasminejs-add-snippets-to-yas-snippet-dirs)))
```

The function `jasminejs-add-snippets-to-yas-snippet-dirs` will declare
jasminejs-mode as a mode that can load snippets and loads the default
set of snippets for you.


| key      | description                           |
| -------- | ------------------------------------- |
| `afte`     | `afterEach(...)`                        |
| `befe`     | `beforeEach(...)`                       |
| `desc`     | `describe(...)`                         |
| `ex`       | `expect(...)`                           |
| `expb`     | `expect(...).toBe(...)`                 |
| `expc`     | `expect(...).toHaveBeenCalled()`        |
| `expcw`    | `expect(...).toHaveBeenCalledWith(...)` |
| `expe`     | `expect(...).toEqual(...)`              |
| `expf`     | `expect(...).toBeFalsy()`               |
| `expt`     | `expect(...).toBeTruthy()`              |
| `it`       | `it(...)`                               |


## Development

Intstall the dependencies with cask

    cask install


Run the tests with:

    $ cask exec ecukes

## Special Thanks

I'd like to thank Magnars for creating such great modes for Emacs. The basis of this mode was inspired by his busterjs-mode.x
