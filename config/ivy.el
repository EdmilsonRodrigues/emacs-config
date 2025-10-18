;; -*- lexical-binding: t -*-

(use-package ivy
  :ensure t)

(ivy-mode)
(setopt ivy-use-virtual-buffers t)
(setopt enable-recursive-minibuffers t)
;; Enable this if you want `swiper' to use it:
;; (setopt search-default-mode #'char-fold-to-regexp)

(counsel-mode)

(use-package counsel-projectile
  :ensure t)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(setq projectile-completion-system 'ivy)

(use-package lsp-ivy
  :ensure t)
