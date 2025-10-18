;; -*- lexical-binding: t -*-

(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-c l")
  :ensure t
  :hook ((go-mode . lsp-deferred)
         (c++-mode . lsp-deferred)
         (c-mode . lsp-deferred)
         (rust-mode . lsp-deferred)
         (qml-mode . lsp-deferred)
         (yaml-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp lsp-deferred
  :config
  (push '("qml-mode" . "qml") lsp-language-id-configuration)
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "qmlls6") 
                    :major-modes '(qml-mode)
                    :remote? nil
                    :server-id 'qmlls-lsp-server))) 

(use-package lsp-ui
  :ensure t)
