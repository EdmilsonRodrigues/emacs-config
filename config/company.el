;; -*- lexical-binding: t -*-

(use-package company
  :ensure t
  :init
  (setq company-require-match nil            ; Don't require match, so you can still move your cursor as expected.
        company-tooltip-align-annotations t  ; Align annotation to the right side.
        company-eclim-auto-save nil          ; Stop eclim auto save.
        company-dabbrev-downcase nil)        ; No downcase when completion.
  :config
  ;; Enable downcase only when completing the completion.
  (defun jcs--company-complete-selection--advice-around (fn)
    "Advice execute around `company-complete-selection' command."
    (let ((company-dabbrev-downcase t))
      (call-interactively fn)))
  (advice-add 'company-complete-selection :around #'jcs--company-complete-selection--advice-around))

(add-hook 'after-init-hook 'global-company-mode)


(use-package company-fuzzy
  :ensure t
  :hook (company-mode . company-fuzzy-mode)
  :init
  (setq ; company-fuzzy-sorting-backend 'flx
        company-fuzzy-reset-selection t
        company-fuzzy-prefix-on-top nil
        company-fuzzy-trigger-symbols '("." "->" "<" "\"" "'" "@")))

(use-package company-dict
  :ensure t
  :init
  (setq company-dict-dir (concat user-emacs-directory "dict/")))



;; Optional: if you want it available everywhere
(add-to-list 'company-backends 'company-dict)

(use-package company-emoji
  :ensure t)

(add-to-list 'company-backends 'company-emoji)

(setq company-minimum-prefix-length 1
      company-idle-delay 0.0) ;; default is 0.2


