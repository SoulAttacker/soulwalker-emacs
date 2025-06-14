;;; init.el --- init file                            -*- lexical-binding: t; -*-

;; Copyright (C) 2025  soulwalker

;; Author: soulwalker
;; Keywords: init

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(require 'cl-lib)


;; setup custom file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; load path
(let ((default-directory  user-emacs-directory))
  (add-to-list 'load-path (expand-file-name "package" default-directory))
  (add-to-list 'load-path (expand-file-name "elisp" default-directory))
  (normal-top-level-add-subdirs-to-load-path))


(let (
      ;; maximize gc when loading
      (gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 0.6)
      (file-name-handler-alist nil))

  ;; without output of plugin loading
  (with-temp-message ""
    (require 'lazycat-theme)
    (lazycat-theme-load-dark)
    (require 'init-basic)
    (require 'init-ns-auto-titlebar)
    (require 'init-utils)
    (require 'init-dashboard)
    (require 'init-awesome-tray)
    (require 'init-one-key)
    (require 'init-key)


    ;; load after 1 second
    (run-with-idle-timer
     1 nil
     #'(lambda()
         (require 'init-sort-tab)
         (require 'init-lsp-bridge)
         (require 'init-auto-save)
         (require 'init-mode)
         (require 'init-treesit)
         (require 'init-prog-mode)
         (require 'init-smartparens)
         (require 'init-rainbow-delimiters)
         (require 'init-apheleia)
         (require 'init-vertico)
         (require 'init-marginalia)
         (require 'init-orderless)
         (require 'init-prescient)
         (require 'init-popper)
         (require 'which-key)
         )
     )))

(provide 'init)
;;; init.el ends here
