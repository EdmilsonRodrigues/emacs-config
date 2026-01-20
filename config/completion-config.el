;; -*- lexical-binding: t -*-
;; Vertico
(use-package vertico
  ;;:custom
  ;; (vertico-scroll-margin 0) ;; Different scroll margin
  ;; (vertico-count 20) ;; Show more candidates
  ;; (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  ;; (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :ensure t
  :init
  (vertico-mode))

(use-package vertico-directory
  :ensure nil
  :after vertico
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package savehist
  :ensure t
  :init
  (savehist-mode))

(use-package orderless
  :ensure t
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring

(use-package emacs
  :bind ("C-º" . execute-extended-command)
  :custom
  ;; Enable context menu. `vertico-multiform-mode' adds a menu in the minibuffer
  ;; to switch display modes.
  (context-menu-mode t)
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  ;; (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

;; Consult
(use-package consult
  :ensure t
  :bind (("C-o" . consult-file)      ;; Improved kill-ring
         ("C-x d" . consult-dir)
         ("C-x b" . consult-buffer)      ;; Replaces ivy-switch-buffer
         ("C-c f" . consult-line)   ;; Better line navigation
         ("C-c C-l" . consult-goto-line))   ;; Better line navigation
  :init
  ;; Optionally configure the register preview as you used virtual buffers in Ivy
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format
        completion-in-region-function #'consult-completion-in-region)
  :config
  (setq consult-narrow-key "<")
  (autoload 'consult-project-buffer "consult"))

(use-package consult-dir
  :ensure t
  :bind (:map vertico-map
              ("C-d" . consult-dir)
              ("C-j" . consult-dir-jump-file)))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package treesit-auto
  :ensure t
  :custom (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;; Text Folding
(use-package origami
  :ensure t)

(define-key origami-mode-map (kbd "<backtab>") 'origami-toggle-node)
(define-key
 origami-mode-map (kbd "C-<iso-lefttab>") 'origami-toggle-all-nodes)

; snippets from autocomplete
(use-package yasnippet
  :ensure t
  :init (yas-global-mode 1))


(provide 'completion-config)
