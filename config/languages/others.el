;; -*- lexical-binding: t -*-

;; TOML
(use-package toml-mode
  :ensure t)

;; INI
(use-package ini-mode
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.ini\\'" . ini-mode))

;; Editor Config
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))
