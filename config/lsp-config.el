;; -*- lexical-binding: t -*-

(use-package mason
  :ensure t
  :config
  (mason-setup))

(mason-setup
  (dolist (pkg '("zuban" "ruff" "marksman" "ltex-ls" "typos-lsp"
                 "shellcheck" "gopls" "qmlls" "rust-analyzer"
                 "yaml-language-server" "haskell-language-server"
                 "clangd" "intelephense" "typescript-language-server"
                 "java-language-server" "protols" "ruby-lsp"
                 "docker-language-server" "angular-language-server"
                 "sqlls" "sqlfluff" "sql-formatter"))
    (unless (mason-installed-p pkg)
      (ignore-errors (mason-install pkg)))))

(use-package eglot
  :ensure t
  :defer t
  :hook ((python-ts-mode . eglot-ensure)
	 (markdown-mode . eglot-ensure)
         (python-ts-mode . (lambda () (set-fill-column 79))))
  :config
  (add-to-list 'eglot-server-programs
               '((python-mode python-ts-mode) . ("rass" "python")))
  (add-to-list 'eglot-server-programs
               '((markdown-mode) . ("rass" "markdown")))
  (add-to-list 'eglot-server-programs
               '((go-mode) . ("rass" "go")))
  (add-to-list 'eglot-server-programs
               '((sql-mode) . ("rass" "sql")))
  (add-to-list 'eglot-server-programs
               '((bash-mode) . ("rass" "bash")))
  (add-to-list 'eglot-server-programs
               '((php-mode) . ("rass" "php")))
  (add-to-list 'eglot-server-programs
               '((rust-mode) . ("rass" "rust")))
  (add-to-list 'eglot-server-programs
               '((typescript-mode) . ("rass" "typescript")))
  (add-to-list 'eglot-server-programs
               '((c-mode) . ("rass" "c")))
  (add-to-list 'eglot-server-programs
               '((c++-mode) . ("rass" "c")))
  (add-to-list 'eglot-server-programs
               '((haskell-mode) . ("rass" "haskell")))
  (add-to-list 'eglot-server-programs
               '((yaml-mode) . ("rass" "yaml")))
  (setq-default
   eglot-workspace-configuration
   '(
     :ltex
     (:language "pt-BR" ;["pt-BR" "en-US"]
      :additionalRules (:enablePickyRules t
			:motherTongue "pt-BR")
      :disabledRules (:pt-BR ["PT_SMART_QUOTES" "ELLIPSIS"])
      :completionEnabled t))))

(use-package
 flycheck
 :ensure t
 :diminish flycheck-mode
 :init
 (setq
  flycheck-check-syntax-automatically '(save new-line)
  flycheck-idle-change-delay 5.0
  flycheck-display-errors-delay 0.9
  flycheck-highlighting-mode 'symbols
  flycheck-indication-mode 'left-fringe
  flycheck-standard-error-navigation t
  flycheck-deferred-syntax-check nil))

(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot)
  :config
  (global-flycheck-eglot-mode 1))

(use-package flycheck-inline
  :ensure t)

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

;; Ruby
(use-package robe
  :ensure t)

(add-hook 'ruby-mode-hook 'robe-mode)

;; Rust
(use-package rust-mode
  :ensure t)

(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))

(setq rust-format-on-save t)

(add-hook 'rust-mode-hook
          (lambda () (prettify-symbols-mode)))

;; Proto
(use-package protobuf-mode
  :ensure t)

(defconst my-protobuf-style
  '((c-basic-offset . 4)
    (indent-tabs-mode . t)))

(add-hook 'protobuf-mode-hook
          (lambda () (c-add-style "my-style" my-protobuf-style t)))

;; PHP
(use-package php-mode
  :ensure t)

;; Python
(use-package sphinx-doc
  :ensure t
  :hook (python-mode . (lambda()
			 (sphinx-doc-mode t))))

(use-package cython-mode
  :ensure t)

;; SQL
(use-package sqlformat
  :ensure t)

(setq sqlformat-command 'pgformatter)
(setq sqlformat-args '("-T" "-g"))

(add-hook 'sql-mode-hook 'sqlformat-on-save-mode)


(defun my-sql-mode-settings ()
  "Custom settings for sql-mode: 2 spaces, no tabs."
  (setq-local tab-width 2)
  (setq-local indent-tabs-mode nil)
  (setq-local sql-basic-offset 2))

(add-hook 'sql-mode-hook 'my-sql-mode-settings)


(provide 'lsp-config)

;; Bazel
(use-package bazel
  :ensure t)

;; (dolist (function '(bazel-build bazel-run bazel-test bazel-coverage))
;;   (add-to-list 'ivy-completing-read-handlers-alist
;;                `(,function . completing-read-default)))
;; Debian
(use-package dpkg-dev-el
  :ensure t)

;; Docker
(use-package dockerfile-mode
  :ensure t)

;; Elixir
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

;; Haskell
(use-package haskell-mode
  :ensure t)

(use-package flycheck-haskell
  :ensure t)

(add-hook 'haskell-mode-hook #'flycheck-haskell-setup)


;; Golang
(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :config
  (setq go-tab-width 4)
  (setq go-mode-hook
        (lambda ()
          ;; Enable lsp-mode for all Go files
          (lsp-deferred))))

(use-package flycheck-golangci-lint
  :ensure t
  :hook (go-mode . flycheck-golangci-lint-setup))

;; JavaScript
(use-package js2-mode
  :ensure t)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
         ("\\.jsx?\\'" . js2-jsx-mode)
         ("\\.json\\'" . js-json-mode))
       auto-mode-alist))

(add-hook 'js-mode-hook 'js2-minor-mode)
;; (add-to-list 'interpreter-mode-alist '("node" . js2-mode))
;; (add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

(use-package typescript-mode
  :ensure t)

;; Lisp
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

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

;; Yaml
(use-package yaml-mode
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; (use-package lsp-yaml
;;   :after lsp-mode
;;   :config
;;   (defun my/schema-path (filename)
;;     "Return a symbol with the full path for schema file"

;;     (car (read-from-string (expand-file-name filename "~/.emacs.d/schemas"))))
  
;;   (setq lsp-yaml-schemas
;;   `((,(my/schema-path "foo.json") . ["foo.yaml" "foo.yml"])))
;; )

