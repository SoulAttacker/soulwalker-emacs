(require 'cl-lib)

;; garbage collection
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))
;; read-process-output-max
(setq read-process-output-max (* 1024 1024))


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
