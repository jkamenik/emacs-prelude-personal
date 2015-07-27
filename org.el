;;; Org - My personal org settings

(add-hook 'org-mode-hook
          (lambda ()
            (prelude-mode -1)))

(setq org-default-notes-file org-gtd-file)

;; Setup capture templates for quick setup
;; http://orgmode.org/manual/Capture-templates.html#Capture-templates
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-gtd-file "To be filed")
         "* TODO %?\nCaptured: %T\n%i")))

(provide 'personal-org)
