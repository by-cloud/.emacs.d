(tool-bar-mode -1)
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(use-package try
  :ensure t)
(use-package which-key
  :ensure t
  :config (which-key-mode))

;;theme
(load-theme 'zenburn t)

;;window stuff
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground
					  :height 3.0
					  :foreground "red")))))))

;;buffer stuff
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(defalias 'list-buffers 'ibuffer)

;;auto-completion stuff
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

;;aggresive-indent
(use-package hungry-delete
  :ensure t
  :config
  (global hungry-delete-mode))
(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))
(use-package iedit
  :ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(expand-region hungry-delete auto-complete which-key zenburn-theme try iedit ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0 :foreground "red")))))
