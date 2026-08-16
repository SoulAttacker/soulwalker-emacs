;; ;; load-path
;; (let ((default-directory  user-emacs-directory))
;;   (add-to-list 'load-path (expand-file-name "package" default-directory))
;;   (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path "/Users/soulwalker/github/term-keys")
;; (add-to-list 'load-path "/Users/soulwalker/.config/emacs/package/markdown-mode")
;; (add-to-list 'load-path "/Users/soulwalker/.config/emacs/package/yasnippet")

(require 'term-keys-wezterm)
(with-temp-buffer
  (insert (term-keys/wezterm-conf))
  (write-region (point-min) (point-max) "~/wezterm-for-term-keys.lua"))
