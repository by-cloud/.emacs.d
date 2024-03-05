(tool-bar-mode -1)
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless (package-install-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(use-package try
  :ensure t)
(use-package which-key
  :ensure t
  :config (which-key-mode))

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
