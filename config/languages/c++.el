;; -*- lexical-binding: t -*-

(use-package company-irony
  :ensure t)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
