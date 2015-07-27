;;; Setup - Provide a place for everything

;; Hide the data loss warning
(setq magit-last-seen-setup-instructions "1.4.0")

;; Spaces only
(setq-default indent-tabs-mode nil)
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

(setq-default org-gtd-file "~/Dropbox/org-mode/gtd.org")

(provide '0-setup)
