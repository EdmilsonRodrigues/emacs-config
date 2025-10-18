;; -*- lexical-binding: t -*-

;;; Pacotes
(require 'package)
(setq package-enable-at-startup nil)  ; desabilitar gerenciador padrão

;; MELPA - repositório
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)  ; iniciar pacotes
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Try package
(use-package try
  :ensure t)

;; Static Analysis
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t))
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;; Projectile
(use-package projectile
  :ensure t)

;; Carregar configuração modularizada
(let ((config-dir (expand-file-name "config" user-emacs-directory)))
  (if (file-directory-p config-dir)
      (progn
        (dolist (file (directory-files config-dir t "\\.el$"))
          (load-file file))
        ;; We define lang-dir here to make sure it's always available
        ;; when we need it.
        (let ((lang-dir (expand-file-name "languages" config-dir)))
          (dolist (file (directory-files lang-dir t "\\.el$"))
            (load-file file))))))      

;; melpa stuff

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279"
     "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e"
     "7334f761edfccfa87893211f651220a0899bb206f042b856393b7af22b0413e2"
     default))
 '(package-selected-packages
   '(ac-php ace-window alchemist all-the-icons company-anaconda
            company-dict company-emoji company-erlang company-fuzzy
            company-go company-irony company-nginx company-shell
            company-web counsel-projectile dockerfile-mode
            ergoemacs-mode flycheck-credo flycheck-golangci-lint
            flycheck-mypy go-eldoc ini-mode jedi js2-mode lazy-ruff
            lsp-ivy lsp-ui neotree org-bullets org-download
            org-project-capture org-roam org-superstar protobuf-mode
            robe shell-pop sphinx-doc sqlformat tide toc-org toml-mode
            try typescript-mode web-mode yaml-mode))
 '(safe-local-variable-directories '("/home/familia/Documents/Work/sipub/"))
 '(shell-pop-shell-type
   '("ansi-term" "*shell-pop-ansi-term*"
     (lambda nil (ansi-term shell-pop-term-shell))))
 '(shell-pop-term-shell "/bin/bash")
 '(shell-pop-universal-key "C-'")
 '(shell-pop-window-position "bottom")
 '(shell-pop-window-size 30))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

