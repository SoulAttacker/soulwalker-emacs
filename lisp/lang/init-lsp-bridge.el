;;; init-lsp-bridge.el --- lsp-bridge configuration  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords:

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

(defun setup-lsp-bridge ()
  "init package: lsp-bridge"
  (if (eq soulwalker-lsp-client 'lsp-bridge)
      (progn
        (require 'lsp-bridge)
        (require 'orderless)
        (setq lsp-bridge-python-command "~/miniconda3/bin/python"
              lsp-bridge-python-lsp-server 'pylsp
              lsp-bridge-c-lsp-server 'clangd

              lsp-bridge-enable-diagnostics t
              lsp-bridge-enable-hover-diagnostic t
              lsp-bridge-enable-org-babel t
              lsp-bridge-enable-completion-in-string t
              lsp-bridge-enable-auto-format-code t

              acm-candidate-match-function 'orderless-regexp
              acm-enable-doc t
              acm-enable-icon t
              acm-enable-doc-markdown-render 'async
              acm-enable-tabnine nil
              acm-enable-search-file-words t
              acm-enable-yas t
              acm-backend-lsp-enable-auto-import t
              acm-enable-preview t)
        (define-key acm-mode-map [tab] 'acm-select-next)
        (define-key acm-mode-map [backtab] 'acm-select-prev)
        (define-key lsp-bridge-peek-keymap (kbd "C-n" 'lsp-bridge-peek-list-next-line))
        (define-key lsp-bridge-peek-keymap (kbd "C-p" 'lsp-bridge-peek-list-prev-line))
        (add-hook 'prog-mode-hook 'global-lsp-bridge-mode))))


(provide 'init-lsp-bridge)
;;; init-lsp-bridge.el ends here
