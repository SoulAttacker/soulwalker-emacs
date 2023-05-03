(require 'cl-lib)

;; garbage collection
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook #'(lambda () (setq gc-cons-threshold 800000)))

;; setup custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(let ((default-directory  user-emacs-directory))
  (add-to-list 'load-path (expand-file-name "package" default-directory))
  (add-to-list 'load-path (expand-file-name "lisp" default-directory))
  (normal-top-level-add-subdirs-to-load-path))


;; configuration
;; (require 'init-config)
;; (require 'init-lang)
;; (require 'init-tools)

(require 'setup-all)
