;; -*- lexical-binding: t -*-

(use-package yaml-mode
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(use-package lsp-yaml
  :after lsp-mode
  :config
  (defun my/schema-path (filename)
    "Return a symbol with the full path for schema file"

    (car (read-from-string (expand-file-name filename "~/.emacs.d/schemas"))))
  
  (setq lsp-yaml-schemas
  `((,(my/schema-path "foo.json") . ["foo.yaml" "foo.yml"])))
)
