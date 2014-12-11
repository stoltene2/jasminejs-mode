# jasminejs-mode

jasminejs-mode helps you manipulate and edit [Jasmine](http://jasmine.github.io/) test files.

## Keybinding

All keybindings in buster-mode start with `C-c j` and then a two-letter mnemonic shortcut. You can override `jasminejs-prefix-key` to change the prefix key.

* `it` -- *I*t *T*oggle between `it` and `iit`
* `ip` -- *I*t *P*ending between `it` and `xit`
* `dt` -- *D*escribe *T*oggle between `describe` and `ddescribe`
* `dp` -- *D*escribe *P*ending between `describe` and `describe`

## Snippets

Writing tests is nice when its easy. Get the characters out of the way.

Below are some snippets that are loaded. Control the use of snippets by setting/unsetting `jasminejs-load-snippets-p`.


| key      | description                           |
|----------+---------------------------------------|
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
