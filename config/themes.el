;; -*- lexical-binding: t -*-

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

(use-package company-emoji
  :ensure t)

(add-to-list 'company-backends 'company-emoji)

