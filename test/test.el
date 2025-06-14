;; load-path
(let ((default-directory  user-emacs-directory))
  (add-to-list 'load-path (expand-file-name "package" default-directory))
  (normal-top-level-add-subdirs-to-load-path))


(require 'sort-tab)


(global-set-key (kbd "M-1") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-2") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-3") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-4") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-5") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-6") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-7") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-8") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-9") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-0") 'sort-tab-select-visible-tab)
(global-set-key (kbd "C-;") 'sort-tab-close-current-tab)

;; hide in dashboard mode
(setq sort-tab-hide-function '(lambda (buf)
                                (with-current-buffer buf (derived-mode-p 'dired-mode))))

(sort-tab-mode 1)

