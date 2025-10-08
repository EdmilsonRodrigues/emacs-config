;; -*- lexical-binding: t -*-

;; Jedi
(use-package jedi
  :ensure t)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


;; Sphinx
(use-package sphinx-doc
  :ensure t
  :hook (python-mode . (lambda()
			 (sphinx-doc-mode t))))

;; Linter
(use-package lazy-ruff
  :ensure t
  :bind (("C-c f" . lazy-ruff-lint-format-dwim))
  :config
  (lazy-ruff-global-mode t))

;; Static Type Checker
(use-package flycheck-mypy
  :ensure t
  :hook (python-mode . flycheck-mode))

;; Disable usual linters
(add-to-list 'flycheck-disabled-checkers 'python-flake8)
(add-to-list 'flycheck-disabled-checkers 'python-pylint)


;; Anaconda Mode
(use-package anaconda-mode
  :ensure t)

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)


(use-package company-anaconda
  :ensure t)

(eval-after-load "company"
 '(add-to-list 'company-backends '(company-anaconda :with company-capf)))
