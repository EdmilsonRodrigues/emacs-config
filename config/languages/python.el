;; -*- lexical-binding: t -*-

;; Sphinx
(use-package sphinx-doc
  :ensure t
  :hook (python-mode . (lambda()
			 (sphinx-doc-mode t))))

(use-package cython-mode
  :ensure t)
