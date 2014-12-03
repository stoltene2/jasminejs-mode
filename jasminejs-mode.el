
(defun jasminejs-toggle-focus-it ()
  "Toggle the `it` function to focus.
When you toggle a test it will toggle it between `it` and `iit`."
  (interactive)
  (jasminejs--toggle-previous-word "it" "i"))

(defun jasminejs-toggle-focus-describe ()
  "Toggle the `describe` function to focus.
When you toggle a test it will toggle it between `describe` and `ddescribe`."
  (interactive)
  (jasminejs--toggle-previous-word "describe" "d"))

(defun jasminejs-toggle-pending-it ()
  "Toggle the `it` function to pending.
When you toggle a test it will toggle it between `it` and `xit`."
  (interactive)
  (jasminejs--toggle-previous-word "it" "x"))

(defun jasminejs-toggle-pending-describe ()
  "Toggle the `describe` function to pending.
When you toggle a test it will toggle it between `describe` and `xdescribe`."
  (interactive)
  (jasminejs--toggle-previous-word "describe" "x"))

(defun jasminejs--toggle-previous-word (word toggle-char)
  "Toggle WORD on or off by prefixing it with TOGGLE-CHAR"
  (let* ((word-regex (concat word "\w*("))
         (toggle-word (concat toggle-char word)))
    (save-excursion
      (re-search-backward word-regex)
      (beginning-of-line-text)
      (when (looking-at word)
        (insert toggle-char))
      (when (looking-at toggle-word)
        (delete-char (length toggle-char))))))

(defvar jasminejs-mode-map (make-sparse-keymap)
  "Jasminejs keymap")

(define-key jasminejs-mode-map
  (kbd "C-c j it") 'jasminejs-toggle-focus-it)

(define-key jasminejs-mode-map
  (kbd "C-c j dt") 'jasminejs-toggle-focus-describe)

(define-key jasminejs-mode-map
  (kbd "C-c j pi") 'jasminejs-toggle-pending-it)

(define-key jasminejs-mode-map
  (kbd "C-c j pd") 'jasminejs-toggle-pending-describe)

(define-minor-mode jasminejs-mode
  "To better edit your files"
  nil " Jas" jasminejs-mode-map)

(provide 'jasminejs-mode)
