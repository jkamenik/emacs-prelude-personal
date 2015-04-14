;;; Appearance - My personal appearance configurations

;; set the window size when in GUI mode
(when (window-system)
  (set-frame-size (selected-frame) 900 900 t))

;; Highlight matching paraens
(show-paren-mode 1)

(setq line-number-mode t)
(setq column-number-mode t)
(global-linum-mode t)

(setq fill-column 80)

(provide 'appearance)
