;; garbage collection
(setq gc-cons-threshold (* 1024 1024 10)
      gc-cons-percentage 0.6)
;; read-process-output-max
(setq read-process-output-max (* 1024 1024))


;; setup custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; load-path
(let ((default-directory  user-emacs-directory))
  (add-to-list 'load-path (expand-file-name "package" default-directory))
  (add-to-list 'load-path (expand-file-name "lisp" default-directory))
  (normal-top-level-add-subdirs-to-load-path))


(require 'setup-all)
