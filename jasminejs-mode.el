;;; jasminejs-mode.el --- A minor mode for manipulating jasmine test files

;; Copyright (C) 2014 Eric Stolten

;; Author: Eric Stolten <stoltene2@gmail.com>
;; Keywords: javascript jasmine

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(defun jasminejs-toggle-focus-it ()
  "Toggle the `it` function to focus.
When you toggle a test it will toggle it between `it` and `iit`."
  (interactive)
  (jasminejs--toggle-previous-word "it" "i" "x"))

(defun jasminejs-toggle-focus-describe ()
  "Toggle the `describe` function to focus.
When you toggle a test it will toggle it between `describe` and `ddescribe`."
  (interactive)
  (jasminejs--toggle-previous-word "describe" "d" "x"))

(defun jasminejs-toggle-pending-it ()
  "Toggle the `it` function to pending.
When you toggle a test it will toggle it between `it` and `xit`."
  (interactive)
  (jasminejs--toggle-previous-word "it" "x" "i"))

(defun jasminejs-toggle-pending-describe ()
  "Toggle the `describe` function to pending.
When you toggle a test it will toggle it between `describe` and `xdescribe`."
  (interactive)
  (jasminejs--toggle-previous-word "describe" "x" "d"))

(defun jasminejs--toggle-previous-word (word toggle-char &optional remove-char)
  "Toggle WORD on or off by prefixing it with TOGGLE-CHAR
If you pass the optional REMOVE-CHAR is passed we check to see if REMOVE-CHAR precedes WORD. If it does, we remove it.

This is useful for toggling between an xdescribe and a ddescribe, for example."
  (let* ((word-regex (concat word "\w*("))
         (toggle-word (concat toggle-char word)))
    (save-excursion
      (if (re-search-backward word-regex (point-min) 'no-error)
          (progn
            (beginning-of-line-text)
            (if remove-char
                (when (looking-at (concat remove-char word))
                  (delete-char (length remove-char))))
            (when (looking-at word)
              (insert toggle-char))
            (when (looking-at toggle-word)
              (delete-char (length toggle-char))))
        (message "I could not find '%s'" word)))))

(defvar jasminejs-mode-map (make-sparse-keymap)
  "Jasminejs keymap")

(defgroup jasminejs-mode nil
  "jasminejs-mode customizations")

(defcustom jasminejs-prefix-key "C-c j"
  "This is the standard key sequence prefix key for leading into jasminejs shortcuts.
WARNING: Changing this prefix will not take effect dynamically. You
will need to reload to take effect."
  :type 'string)

(define-key jasminejs-mode-map
  (kbd (concat jasminejs-prefix-key "it")) 'jasminejs-toggle-focus-it)

(define-key jasminejs-mode-map
  (kbd (concat jasminejs-prefix-key "ip")) 'jasminejs-toggle-pending-it)

(define-key jasminejs-mode-map
  (kbd (concat jasminejs-prefix-key "dt")) 'jasminejs-toggle-focus-describe)

(define-key jasminejs-mode-map
  (kbd (concat jasminejs-prefix-key "dp")) 'jasminejs-toggle-pending-describe)

(define-minor-mode jasminejs-mode
  "To better edit your files"
  nil " Jas" jasminejs-mode-map)

(provide 'jasminejs-mode)
