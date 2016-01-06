;; FCI - Fill Column Indicator
(prelude-require-package 'fill-column-indicator)

;; Add a global mode for Fill Column Indicator
(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda () (fci-mode 1)))

;; Enable the Fill column indictor
(global-fci-mode t)

(provide 'fci)
