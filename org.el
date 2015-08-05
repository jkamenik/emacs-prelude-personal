;;; Org - My personal org settings

(add-hook 'org-mode-hook
          (lambda ()
            (prelude-mode -1)))

(setq org-default-notes-file org-gtd-file)

;; Setup capture templates for quick setup
;; http://orgmode.org/manual/Capture-templates.html#Capture-templates
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-gtd-file "To be filed")
         "* TODO %?  :WORK:\n- Captured: %T\n%i")
        ("c" "Competition" entry (file+headline org-gtd-file "Competition")
         "* %t
** Points
- [ ] Breakfast, lunch, dinner, and night snack
- [ ] 5000 steps
- [ ] Daily exercise
- [ ] 8 hours of sleep
- [ ] Tracking food
- [ ] 8 Cups of water

** Negative
- [ ] Unplanned Eating out
- [ ] Other Snacks
- [ ] Procrastination
")))

(provide 'personal-org)
