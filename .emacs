;; Basic settings
(setq inhibit-startup-message t)    ;; Disable startup screen
(setq ring-bell-function 'ignore)   ;; Disable the bell
(global-display-line-numbers-mode) ;; Show line numbers
(tool-bar-mode -1)                  ;; Disable toolbar
(scroll-bar-mode -1)                ;; Disable scrollbar
(menu-bar-mode -1)                   ;; Disable menu bar

;; Package Management
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install and use 'use-package' for better package management
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Theme and Appearance
(use-package doom-themes
  :config
  (load-theme 'doom-one t))

;; Evil mode (Vim keybindings)
(use-package evil
  :init (setq evil-want-C-u-scroll t)
  :config (evil-mode 1))

;; Auto-completion
(use-package company
  :hook (prog-mode . company-mode))

;; Syntax checking
(use-package flycheck
  :init (global-flycheck-mode))

;; Better fuzzy searching
(use-package ivy
  :config
  (ivy-mode 1))

;; Magit (Git integration)
(use-package magit)

;; Org-mode enhancements (Doom Emacs Style)
(use-package org
  :config
  (setq org-startup-indented t
        org-hide-leading-stars t
        org-log-done 'time
        org-ellipsis " ▼"
        org-directory "~/org/"
        org-agenda-files '("~/org/agenda.org")
        org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
  (setq org-modern-star '("●" "○" "■" "□" "▲" "△" "▶" "▷"))
  (use-package org-superstar
    :hook (org-mode . org-superstar-mode)))



 

;; Keybindings
(global-set-key (kbd "C-c s") 'shell)

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
