;;; init-lsp-bridge.el --- lsp-bridge config         -*- lexical-binding: t; -*-

;; Copyright (C) 2025  soulwalker

;; Author: soulwalker
;; Keywords: lsp-bridge

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

(require 'lsp-bridge)

(when (eq soulwalker-lsp-client 'lsp-bridge)
  (setq
   lsp-bridge-python-command soulwalker-default-python

   lsp-bridge-python-lsp-server 'basedpyright
   lsp-bridge-c-lsp-server 'clangd

   lsp-bridge-enable-diagnostics t
   lsp-bridge-enable-hover-diagnostic t
   lsp-bridge-enable-org-babel t
   lsp-bridge-enable-completion-in-string t
   lsp-bridge-enable-signature-help t
   lsp-bridge-enable-competion-in-minibuffer t
   lsp-bridge-completion-obey-trigger-characters-p nil

   acm-enable-doc t
   acm-enable-icon t
   acm-enable-doc-markdown-render t
   acm-enable-tabnine nil
   acm-enable-search-file-words t
   acm-enable-yas t
   acm-backend-lsp-enable-auto-import t
   acm-enable-preview nil
   ))

(add-hook 'prog-mode-hook 'lsp-bridge-mode)
(add-hook 'org-mode-hook 'lsp-bridge-mode)

(one-key-create-menu
 "LSP"
 '(
   (("a" . "LSP code-action") . lsp-bridge-code-action)
   (("d" . "LSP goto-define") . lsp-bridge-find-def)
   (("f" . "LSP format-buffer") . apheleia-format-buffer)
   (("h" . "LSP peek-reference") . lsp-bridge-find-references)
   (("i" . "LSP find-impl") . lsp-bridge-find-impl)
   (("r" . "LSP rename") . lsp-bridge-rename)
   (("p" . "LSP peek") . lsp-bridge-peek)
   )
 t)

(provide 'init-lsp-bridge)
;;; init-lsp-bridge.el ends here
