;; -*- lexical-binding: t -*-

(use-package haskell-mode
  :ensure t)

(use-package flycheck-haskell
  :ensure t)

(add-hook 'haskell-mode-hook #'flycheck-haskell-setup)
