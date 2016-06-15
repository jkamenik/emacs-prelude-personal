;;; Package - install all the packages that I use

(prelude-require-package 'editorconfig)
(editorconfig-mode 1)

(prelude-require-package 'origami)
(global-origami-mode t)

(prelude-require-package 'bats-mode)

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
