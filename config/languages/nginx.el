;; -*- lexical-binding: t -*-

(use-package company-nginx
  :ensure t
  :config (add-hook 'nginx-mode-hook (lambda () (add-to-list 'company-backends #'company-nginx))))
