(require 'f)

(defvar jasminejs-mode-support-path
  (f-dirname load-file-name))

(defvar jasminejs-mode-features-path
  (f-parent jasminejs-mode-support-path))

(defvar jasminejs-mode-root-path
  (f-parent jasminejs-mode-features-path))

(add-to-list 'load-path jasminejs-mode-root-path)

(require 'jasminejs-mode)
(require 'espuds)
(require 'ert)
(require 'cl)

(Before
 (switch-to-buffer
  (get-buffer-create "*testing-buffer*"))
 (erase-buffer)
 (transient-mark-mode 1)
 (cua-mode 0)
 (jasminejs-mode 1)
 (setq set-mark-default-inactive nil)
 (deactivate-mark))
