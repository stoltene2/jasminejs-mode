

(defun jasminejs-toggle-focus-it ()
  "Toggle the `it` function to focus.
When you toggle a test it will toggle it between `it` and `iit`."
  (interactive)

  (let* ((it-regex "it\w*("))
    (save-excursion
      (re-search-backward it-regex)
      (beginning-of-line-text)
      (when (looking-at "it")
          (insert "i"))
      (when (looking-at "iit")
        (delete-char 1))
      )))

(defun jasminejs-toggle-focus-describe ()
  "Toggle the `describe` function to focus.
When you toggle a test it will toggle it between `describe` and `ddescribe`."
  (interactive)

  (let* ((it-regex "describe\w*("))
    (save-excursion
      (re-search-backward it-regex)
      (beginning-of-line-text)
      (when (looking-at "describe")
          (insert "d"))
      (when (looking-at "ddescribe")
        (delete-char 1))
      )))


(defvar jasminejs-mode-map (make-sparse-keymap)
  "Jasminejs keymap")

(define-key jasminejs-mode-map
  (kbd "C-c j tt") 'jasminejs-toggle-focus-it)

(define-key jasminejs-mode-map
  (kbd "C-c j td") 'jasminejs-toggle-focus-describe)

(define-minor-mode jasminejs-mode
  "To better edit your files"
  nil " Jas" jasminejs-mode-map)

(provide 'jasminejs-mode)
