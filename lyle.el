; Set default frame size to 120x40
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 120))

;; Additional package archives
(add-to-list 'package-archives
             '("technomancy" . "http://repo.technomancy.us/emacs/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages"))

; Where's ctags?
(setq path-to-ctags "/usr/local/bin/ctags")

; Interactively create a TAGS file somewhere
(defun create-tags-file (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
    (format "%s -f %s/TAGS -e -R --langmap=Lisp:+.clj %s" path-to-ctags dir-name (directory-file-name dir-name))
  )
)

; The following will create a tags file if none exists.
; Just hit `M-.’ and you’re off.
; From http://www.emacswiki.org/emacs/TagsFile
(defadvice find-tag (before c-tag-file activate)
  "Automatically create tags file."
  (let ((tag-file (concat default-directory "TAGS")))
    (unless (file-exists-p tag-file)
      (shell-command (format "%s -f TAGS -e -R --langmap=Lisp:+.clj" path-to-ctags)))
    (visit-tags-table tag-file)))


;; Org mode customizations per the tutorial
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-modee))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; CoffeeScript
(add-to-list 'load-path "~/.emacs.d/lyle/coffee-mode")
(require 'coffee-mode)

;; nXHTML
(load "~/.emacs.d/lyle/nxhtml/autostart.el")
(setq
 nxhtml-global-minor-mode t
 mumamo-chunk-coloring 'submode-colored
 nxhtml-skip-welcome t
 indent-region-mode t
 rng-nxml-auto-validate-flag nil
 nxml-degraded t)
(add-to-list 'auto-mode-alist '("\\.html\\.erb$" .  eruby-nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml$" .  eruby-nxhtml-mumamo-mode))

;; Rinari
(setq rinari-tags-file-name "TAGS")

;; Cucumber mode
(add-to-list 'load-path "~/.emacs.d/lyle/feature-mode")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

