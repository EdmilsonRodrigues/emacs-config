;; -*- lexical-binding: t -*-

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
               '((python-mode python-ts-mode) . ("rass python"))))

