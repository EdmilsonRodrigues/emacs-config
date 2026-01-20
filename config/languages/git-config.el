;; -*- lexical-binding: t -*-

(use-package with-editor
  :ensure t)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

;; Show diff inline
(use-package diff-hl
  :ensure t)


(provide 'git-config)

