;; -*- lexical-binding: t -*-

(use-package ergoemacs-mode
    :ensure t)

(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "pt")


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

;; ;; Ivy related
;; (global-set-key (kbd "C-f") 'swiper-isearch)
;; (keymap-global-set "C-c C-r" #'ivy-resume)
;; (keymap-global-set "<f6>" #'ivy-resume)
;; (keymap-global-set "M-x" #'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (keymap-global-set "<f1> f" #'counsel-describe-function)
;; (keymap-global-set "<f1> v" #'counsel-describe-variable)
;; (keymap-global-set "<f1> o" #'counsel-describe-symbol)
;; (keymap-global-set "<f1> l" #'counsel-find-library)
;; (keymap-global-set "<f2> i" #'counsel-info-lookup-symbol)
;; (keymap-global-set "<f2> u" #'counsel-unicode-char)
;; (keymap-global-set "C-c g" #'counsel-git)
;; (keymap-global-set "C-c j" #'counsel-git-grep)
;; (keymap-global-set "C-c k" #'counsel-ag)
;; (keymap-global-set "C-x l" #'counsel-locate)
;; (keymap-global-set "C-S-o" #'counsel-rhythmbox)
;; (keymap-set minibuffer-local-map "C-r" #'counsel-minibuffer-history)

(ergoemacs-mode 1)

(provide 'keybindings-config)
