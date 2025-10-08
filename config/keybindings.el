;; -*- lexical-binding: t -*-

(use-package ergoemacs-mode
    :ensure t)

(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "pt")
(ergoemacs-mode 1)


(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(global-set-key (kbd "C-<up>") 'move-line-up)
(global-set-key (kbd "C-<down>") 'move-line-down)
(global-set-key (kbd "C-º") 'execute-extended-command)

