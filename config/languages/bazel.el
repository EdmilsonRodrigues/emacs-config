;; -*- lexical-binding: t -*-

(use-package bazel
  :ensure t)

(dolist (function '(bazel-build bazel-run bazel-test bazel-coverage))
  (add-to-list 'ivy-completing-read-handlers-alist
               `(,function . completing-read-default)))
