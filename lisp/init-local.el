(add-to-list 'load-path "~/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)



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
(desktop-save-mode 1)

(defun my-desktop ()
  "Load the desktop and enable autosaving"
  (interactive)
  (let ((desktop-load-locked-desktop "ask"))
    (desktop-read)
    (desktop-save-mode 1)))
    

;;
(provide 'init-local)
