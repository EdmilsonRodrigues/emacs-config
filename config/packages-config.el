;; -*- lexical-binding: t -*-
(require 'package)

(setq package-enable-at-startup nil)  ; desabilitar gerenciador padrão

;; MELPA - repositório
(add-to-list 'package-archives '(("elpa" . "http://elpa.gnu.org/packages/")
                                 ("melpa" . "https://melpa.org/packages/")
                                 ("org" . "https://orgmode.org/elpa/")))

(package-initialize)  ; iniciar pacotes

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(provide 'packages-config)
