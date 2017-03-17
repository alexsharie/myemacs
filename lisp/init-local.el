(add-to-list 'load-path "~/.emacs.d/vendor")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(global-set-key [f4] 'indent-region)

;; 
(require-package 'json-mode)
(require-package 'js2-mode)
(require-package 'ac-js2)

(require-package 'tern)
(require-package 'tern-auto-complete)

(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))


;; 
(global-auto-complete-mode t)
(global-linum-mode t)
(global-set-key [f9] 'imenu)

;; 
(add-to-list 'load-path "~/.emacs.d/vendor")
(require 'jade-mode)


;;
;; Automatically save and restore sessions
(setq desktop-dirname             "~/.emacs.d/desktop"
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil)
(desktop-save-mode 0)

(defun my-desktop ()
  "Load the desktop and enable autosaving"
  (interactive)
  (let ((desktop-load-locked-desktop "ask"))
    (desktop-read)
    (desktop-save-mode 0)))
    


;;
(set-face-foreground 'linum "#404040")
(require 'highlight-current-line)
(highlight-current-line-on t)
(set-face-background 'highlight-current-line-face "#252525")
;;(set-window-margins nil 1)


;;
(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(setq-default indent-tabs-mode nil)
(setq js-indent-level 4)


;;
(require 'highlight-chars)
(hc-toggle-highlight-tabs t)
(hc-toggle-highlight-hard-spaces t)
(hc-toggle-highlight-hard-hyphens t)
(hc-toggle-highlight-trailing-whitespace t)

;;
(require 'fill-column-indicator)
(setq fci-rule-width 1)
(setq fci-rule-color "#601000")
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

;;
(provide 'init-local)
