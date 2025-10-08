;; -*- lexical-binding: t -*-

(use-package elixir-mode
  :ensure t)

(use-package alchemist
  :ensure t)

(use-package flycheck-credo
  :ensure t)

(eval-after-load 'flycheck
  '(flycheck-credo-setup))

(add-hook 'elixir-mode-hook 'flycheck-mode)

;; Erlang
(use-package erlang
  :ensure t)

(use-package company-erlang
  :ensure t)

(add-hook 'erlang-mode-hook #'company-erlang-init)

