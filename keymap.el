;;; Keymap - Provide some nicer keys

;; Better undo redo
(global-set-key (kbd "s-z") 'undo-tree-undo)
(global-set-key (kbd "s-Z") 'undo-tree-redo)

;; Better isearch
(define-key prelude-mode-map (kbd "s-g") nil)
(global-set-key (kbd "s-g") 'isearch-forward)
(define-key isearch-mode-map (kbd "s-g") 'isearch-repeat-forward)

;; Better settings for those used to other editors
(global-set-key (kbd "s-<right>") 'move-end-of-line)
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)
(global-set-key (kbd "s-<up>") 'backward-paragraph)
(global-set-key (kbd "s-<down>") 'forward-paragraph)
;;(global-set-key (kbd "s-t") 'find-file-in-project)
(global-set-key (kbd "s-t") 'projectile-find-file)
(global-set-key (kbd "s-T") 'projectile-ag)
(global-set-key (kbd "s-w") 'kill-this-buffer)

;; remove windmove stuff
(global-unset-key (kbd "S-<down>"))
(global-unset-key (kbd "S-<up>"))
(global-unset-key (kbd "S-<left>"))
(global-unset-key (kbd "S-<right>"))

;; Comment the current line
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))
(define-key prelude-mode-map (kbd "s-/") 'comment-or-uncomment-region-or-line)



;; Escape should escape
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; iTerm like window switching
(global-set-key (kbd "s-]") 'next-multiframe-window)
(global-set-key (kbd "s-[") 'previous-multiframe-window)

;; Toggle Full screen
;; Note: This is actually ctrl + cmd + f
(global-set-key (kbd "<C-s-268632070>") 'toggle-frame-fullscreen)

;; make it easier to open my work notes file
(defun open-work-notes ()
  "Opens the file ~/Dropbox/org-mode/work.org"
  (interactive)
  (find-file org-gtd-file))
(global-set-key (kbd "C-c C-w") 'open-work-notes)
(global-set-key (kbd "C-c c") 'org-capture)

(provide 'keymap)
