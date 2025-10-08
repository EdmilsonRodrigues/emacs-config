;; -*- lexical-binding: t -*-

(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :config
  (setq go-tab-width 4)
  (setq go-mode-hook
        (lambda ()
          ;; Enable lsp-mode for all Go files
          (lsp-deferred))))

(use-package company-go
  :ensure t)
(add-hook 'completion-at-point-functions 'go-complete-at-point)

(use-package flycheck-golangci-lint
  :ensure t
  :hook (go-mode . flycheck-golangci-lint-setup))


