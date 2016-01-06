;;; Tabbar - Setup the tabbar
(prelude-require-package 'tabbar)

(tabbar-mode)

;; Tabbar settings
(set-face-attribute
 'tabbar-default nil
 :box nil
 :background "#404040")
;; (set-face-attribute
;;  'tabbar-unselected nil
;;  :box nil)
(set-face-attribute
 'tabbar-selected nil
 :foreground "#338A59"
 :background "white"
 :weight     'bold
 :box nil)
(set-face-attribute
 'tabbar-modified nil
 :slant 'italic
 :box nil)
(set-face-attribute
 'tabbar-separator nil
 :foreground "#404040")
(set-face-attribute
 'tabbar-button nil
 :box nil)

;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
(custom-set-variables
 '(tabbar-separator (quote (0.5))))

;; adding spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
                    (format " [%s]  " (tabbar-tab-tabset tab))
                  (format " %s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

;; a function to aid in finding the project root directory
(defun my-project-root ()
  "Return the root of the project."
  (locate-dominating-file default-directory
                          ".git"))

;; Set the tabgroup based on project; Needs find-files-in-project
(setq tabbar-buffer-groups-function
      (lambda ()
        (let ((dir (expand-file-name default-directory)))
          (cond ((member (buffer-name) '("*Completions*"
                                         "*scratch*"
                                         "*Messages*"
                                         "*Ediff Registry*"
                                         "*Help*"
                                         "*Shell Command Output*"))
                 (list "#misc"))
                ;; Helm goes to the same place
                ((string-match "^*[hH]elm" (buffer-name)) (list "#helm"))
                ;; All Magit status goes the same place
                ((string-match "^*magit" (buffer-name)) (list "#magic"))
                ((string-match "^COMMIT_EDITMSG" (buffer-name)) (list "#magic"))
                ;; All Cider windows
                ((string-match "^*nrepl-server" (buffer-name)) (list "#cider"))
                ((string-match "^*cider" (buffer-name)) (list "#cider"))
                ;; Group tabs based on project root
                ((my-project-root) (list (my-project-root)))
                ;; Use the current dir
                (t (list dir))))))

;; Left and right go between tabs
(global-set-key (kbd "M-s-<right>") 'tabbar-forward-tab)
(global-set-key (kbd "M-s-<left>")  'tabbar-backward-tab)

;; Up and down go between groups
(global-set-key (kbd "M-s-<down>") 'tabbar-forward-group)
(global-set-key (kbd "M-s-<up>")  'tabbar-backward-group)



(tabbar-mode 1)


(provide 'tabbar)
