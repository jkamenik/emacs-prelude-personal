;;; Neotree - Sets up neotree
(require 'neotree)

(setq projectile-switch-project-action 'neotree-projectile-action)
(global-set-key [f8] 'neotree-toggle)
(neotree-show) ;; show by default

(provide 'personal-neotree)
