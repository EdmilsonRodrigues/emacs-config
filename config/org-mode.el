;; -*- lexical-binding: t -*-

(use-package markdown-mode
  :ensure t)

(use-package toc-org
  :ensure t)

(if (require 'toc-org nil t)
    (progn
      (add-hook 'org-mode-hook 'toc-org-mode)

      ;; enable in markdown, too
      (add-hook 'markdown-mode-hook 'toc-org-mode)
      (define-key markdown-mode-map (kbd "\C-c\C-o") 'toc-org-markdown-follow-thing-at-point))
  (warn "toc-org not found"))

(use-package org-superstar
  :ensure t)

(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(use-package org-project-capture
  :bind (("C-c n p" . org-project-capture-project-todo-completing-read))
  :ensure t
  :config
  (progn
    (setq org-project-capture-backend
          (make-instance 'org-project-capture-projectile-backend))  ; Replace with your backend of choice
    (setq org-project-capture-projects-file "~/org/projects.org")
    (org-project-capture-single-file)))

(use-package org-roam
  :ensure t)

(use-package org-download
  :ensure t)


