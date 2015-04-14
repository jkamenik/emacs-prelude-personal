;;; Package - install all the packages that I use

(setq my-packages '(fill-column-indicator
                    shell-command
                    tabbar
                    neotree
                    ag))

(defun install-my-packages ()
  "Install my packages"
  (interactive)
  (mapc 'package-install my-packages))

(provide '1-package)
