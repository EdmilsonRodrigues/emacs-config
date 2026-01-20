;; -*- lexical-binding: t -*-

(use-package web-mode
  :ensure t
  :mode (;; ("\\.php\\'" . web-mode)
         ;; ("\\.tpl\\'" . web-mode)
         ;; ("\\.[agj]sp\\'" . web-mode)
         ;; ("\\.as[cp]x\\'" . web-mode)
         ;; ("\\.erb\\'" . web-mode)
         ;; ("\\.mustache\\'" . web-mode)
         ;; ("\\.djhtml\\'" . web-mode)
         ("\\.phtml\\'" . web-mode)))

(use-package emmet-mode
  :ensure t
  :init
  (add-hook 'css-mode-hook 'emmet-mode)
  (add-hook 'sgml-mode-hook 'emmet-mode))

(use-package simple-httpd
  :ensure t)

(use-package impatient-mode
  :ensure t)

(provide 'web-config)
