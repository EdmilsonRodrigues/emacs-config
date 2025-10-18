;; -*- lexical-binding: t -*-

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
