(add-to-list 'load-path "~/.emacs.d/vendor")
(require 'sr-speedbar)

;;
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
(setq linum-format "%d ")


;;
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
(defvaralias 'preferred-javascript-indent-level 'tab-width)

(setq-default indent-tabs-mode nil)
(setq js-indent-level 4)
(setq jade-indent-level 4)
(setq jade-indent 4)
(setq jade-mode-indent-level 4)
(setq-default tab-width 4)

(setq tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
(setq indent-tabs-mode nil)


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
(menu-bar-mode -1)
(setq make-backup-files		nil)
(setq auto-save-list-file-name	nil)
(setq auto-save-default		nil)


;;
(require 'company)
(require 'company-web-html)
(require 'company-web-jade)
;(define-key web-mode-map (kbd "C-'") 'company-web-html)
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-tooltip-align-annotations 't)          ; align annotations to the right tooltip border
(setq company-idle-delay .1)                         ; decrease delay before autocompletion popup shows
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
(global-set-key (kbd "C-c /") 'company-files) 

(ac-config-default)
(setq auto-complete-mode t)
(define-key ac-mode-map (kbd "TAB") 'auto-complete)
(ac-set-trigger-key "TAB")
(setq ac-quick-help-delay 0.2)
(setq ac-show-menu-immediately-on-auto-complete)
(setq ac-use-quick-help)
(setq ac-auto-start 't)
(setq ac-ignore-case)
(setq ac-use-fuzzy)
(setq ac-use-comphist)
(global-auto-complete-mode t)
(auto-complete-mode t)

(setq ac-auto-show-menu    0.2)
(setq ac-delay             0.2)
(setq ac-menu-height       20)
(setq ac-auto-start t)
(setq ac-show-menu-immediately-on-auto-complete t)

;;
(provide 'init-local)
