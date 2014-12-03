

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

(defun jasminejs-toggle-pending-it ()
  "Toggle the `it` function to pending.
When you toggle a test it will toggle it between `it` and `xit`."
  (interactive)

  (let* ((it-regex "it\w*("))
    (save-excursion
      (re-search-backward it-regex)
      (beginning-of-line-text)
      (when (looking-at "it")
          (insert "x"))
      (when (looking-at "xit")
        (delete-char 1))
      )))

(defun jasminejs-toggle-pending-describe ()
  "Toggle the `describe` function to pending.
When you toggle a test it will toggle it between `describe` and `xdescribe`."
  (interactive)

  (let* ((describe-regex "describe\w*("))
    (save-excursion
      (re-search-backward describe-regex)
      (beginning-of-line-text)
      (when (looking-at "describe")
          (insert "x"))
      (when (looking-at "xdescribe")
        (delete-char 1))
      )))


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
