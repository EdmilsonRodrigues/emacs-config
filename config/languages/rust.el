;; -*- lexical-binding: t -*-

(use-package rust-mode
  :ensure t)
  ;; :init
  ;; (setq rust-mode-treesitter-derive t))

;; (add_to_list 'treesit-extra-load-path "~/.emacs.d/treesitter")

(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))

(setq rust-format-on-save t)

(add-hook 'rust-mode-hook
          (lambda () (prettify-symbols-mode)))

;; (with-eval-after-load 'rust-mode
;;   (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

