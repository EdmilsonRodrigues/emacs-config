;; -*- lexical-binding: t -*-

;; Remover boas vindas
(setq inhibit-startup-message t)

;; Remover Menus
(tool-bar-mode -1)
(menu-bar-mode +1)
(scroll-bar-mode -1)

;; Numeros nas linhas
(global-display-line-numbers-mode 1)

;; Cancel auto-save and backups
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; shell pop
(use-package shell-pop
  :ensure t)

(require 'shell-pop)

;; Window Navigation
(global-set-key (kbd "C-<tab>") 'other-window)

(use-package neotree
  :ensure t
  :config
    (progn
    (setq neo-smart-open t)
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
  :bind (("C-\\" . 'neotree-toggle)))

(setq-default neo-show-hidden-files t)

(add-hook 'prog-mode-hook #'hs-minor-mode)

(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))



