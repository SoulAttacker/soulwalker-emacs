;; load-path
(let ((default-directory  user-emacs-directory))
  (add-to-list 'load-path (expand-file-name "package" default-directory))
  (normal-top-level-add-subdirs-to-load-path))

(require 'zig-ts-mode)
(require 'lsp-bridge)
(setq lsp-bridge-log-level 'debug)
(lsp-bridge-global-mode)
