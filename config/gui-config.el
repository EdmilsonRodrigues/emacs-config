;; -*- lexical-binding: t -*-

;; Remove welcome message
(setq inhibit-startup-message t
      initial-buffer-choice  nil
      initial-scratch-message nil
      auto-save-default nil
      make-backup-files nil)

;; Remove Menus
(menu-bar-mode +1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Show column indicator
(setopt display-fill-column-indicator-column 80)

;; Line Numbers
(global-display-line-numbers-mode 1)

;; modes
(ido-mode 0)
(cua-mode 1)
(display-time-mode 1)

(use-package all-the-icons
  :ensure t)

(defun print-formatted-all-the-icons ()
  (let ((associations all-the-icons-extension-icon-alist)
        (associations-as-strings nil))
    ;; Convert each association list to a readable string
    (setq associations-as-strings (mapcar 'prin1-to-string associations))

    ;; Join the strings with newlines
    (let ((formatted-output (string-join associations-as-strings "\n")))
      (with-current-buffer (get-buffer-create "*scratch*")
        (erase-buffer)
        (insert ";; All-the-icons Extension Icon Alist\n\n")
        (insert formatted-output)
        (emacs-lisp-mode)
        (goto-char (point-min))
        (display-buffer (current-buffer))))))

;; Run this function if setting for the first time
;; (all-the-icons-install-fonts)

(load-theme 'tango-dark)

(add-to-list 'all-the-icons-extension-icon-alist
             '("plx" all-the-icons-alltheicon "perl"
               :face all-the-icons-lorange))

(add-to-list 'all-the-icons-extension-icon-alist
             '("bash" all-the-icons-alltheicon "terminal"
               :face all-the-icons-green))

(add-to-list 'all-the-icons-extension-icon-alist
             '("toml" all-the-icons-octicon "settings"
               :face all-the-icons-lorange))

(add-to-list 'all-the-icons-extension-icon-alist
             '("qml" all-the-icons-faicon "file-code-o"
               :face all-the-icons-yellow))

(add-to-list 'all-the-icons-extension-icon-alist
             '("pyx" all-the-icons-alltheicon "python"
               :face all-the-icons-blue))

;;(print-formatted-all-the-icons)  ; Run if wants to check the others to add
;; a new icon

(set-face-attribute 'default nil :height 140 :family "Ubuntu Sans Mono" )

(use-package spaceline
  :ensure t)

(use-package spaceline-config
  :config
  (spaceline-emacs-theme))

(use-package neotree
  :ensure t
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)
        neo-autorefresh t
  )
  :bind ("C-\\". 'neotree-toggle))

(global-unset-key (kbd "C-x <prior>"))
(global-unset-key (kbd "C-x <next>"))

(use-package centaur-tabs
  :ensure t
  :demand
  :config
  (setq centaur-tabs-style "bar"
	centaur-tabs-set-bar 'over
	centaur-tabs-set-modified-marker t
	centaur-tabs-modified-marker "*"
	centaur-tabs-set-icons t
	centaur-tabs-height 32)
  (centaur-tabs-change-fonts (face-attribute 'default :font) 110)
  (centaur-tabs-headline-match)
  (centaur-tabs-mode t)
  :bind
  ("C-x <prior>" . centaur-tabs-backward)
  ("C-x <next>" . centaur-tabs-forward)
  :hook
  (dashboard-mode . centaur-tabs-local-mode)
  (vterm-mode . centaur-tabs-local-mode))


;; Use '<' to filter (e.g., in consult-buffer)

;; Cancel auto-save and backups
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; shell pop
(use-package shell-pop
  :ensure t)

(require 'shell-pop)

;; Window Navigation
(global-set-key (kbd "C-<tab>") 'other-window)

(use-package neotree
  :ensure t
  :config
    (progn
    (setq neo-smart-open t)
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
  :bind (("C-\\" . 'neotree-toggle)))

(setq-default neo-show-hidden-files t)

(add-hook 'prog-mode-hook #'hs-minor-mode)

(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))

(use-package all-the-icons
  :ensure t)

(add-to-list 'all-the-icons-extension-icon-alist
             '("plx" all-the-icons-alltheicon "perl"
               :face all-the-icons-lorange))

(add-to-list 'all-the-icons-extension-icon-alist
             '("bash" all-the-icons-alltheicon "terminal"
               :face all-the-icons-green))

(add-to-list 'all-the-icons-extension-icon-alist
             '("toml" all-the-icons-octicon "settings"
               :face all-the-icons-lorange))

(add-to-list 'all-the-icons-extension-icon-alist
             '("qml" all-the-icons-faicon "file-code-o"
               :face all-the-icons-yellow))

(add-to-list 'all-the-icons-extension-icon-alist
             '("pyx" all-the-icons-alltheicon "python"
               :face all-the-icons-blue))

;; Run this if wants to see all the icons
(defun print-formatted-all-the-icons ()
  (let ((associations all-the-icons-extension-icon-alist)
        (associations-as-strings nil))
    ;; Convert each association list to a readable string
    (setq associations-as-strings (mapcar 'prin1-to-string associations))

    ;; Join the strings with newlines
    (let ((formatted-output (string-join associations-as-strings "\n")))
      (with-current-buffer (get-buffer-create "*scratch*")
        (erase-buffer)
        (insert ";; All-the-icons Extension Icon Alist\n\n")
        (insert formatted-output)
        (emacs-lisp-mode)
        (goto-char (point-min))
        (display-buffer (current-buffer))))))

;;(print-formatted-all-the-icons)  ; Run if wants to check the others to add
;; a new icon

;; Run this function if setting for the first time
;; (all-the-icons-install-fonts)

(load-theme 'tango-dark)
(set-face-attribute 'default nil :height 140 :family "Ubuntu Sans Mono" )

(use-package emojify
  :ensure t
  :hook (after-init . global-emojify-mode))

(provide 'gui-config)
