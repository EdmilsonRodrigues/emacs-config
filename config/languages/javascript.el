;; -*- lexical-binding: t -*-

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

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

