;;; Shell - better defaults for shell
(autoload 'bash-completion-dynamic-complete
  "bash-completion"
  "BASH completion hook")

(prelude-require-package 'shell-command)
(shell-command-completion-mode)

;; Make the bash shell a login shell
(setq explicit-bash-args '("--noediting" "-i" "-l"))

(provide 'setup-shell)
