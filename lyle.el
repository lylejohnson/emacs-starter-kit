;; Put user-specific configuration stuff in here.
(add-to-list 'package-archives
             '("technomancy" . "http://repo.technomancy.us/emacs/") t)

; 
(setq path-to-ctags "/usr/local/bin/ctags") ;; <- your ctags path here
(defun create-tags-file (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
  (format "%s -f %s/TAGS -e -R --langmap=Lisp:+.clj %s" path-to-ctags dir-name (directory-file-name dir-name)))
)

;; Org mode customizations per the tutorial
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-modee))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
