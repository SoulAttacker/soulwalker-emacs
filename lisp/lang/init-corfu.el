;;; init-corfu.el --- corfu configuration            -*- lexical-binding: t; -*-

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


(defun setup-corfu ()
  "Setup corfu."
  (if (and (eq soulwalker-completion-frontend 'corfu) (not (eq soulwalker-lsp-client 'lsp-bridge)))
      (progn
        (require 'corfu)
        (require 'corfu-popupinfo)
        (setq corfu-cycle t
              corfu-auto t
              corfu-auto-prefix 1
              corfu-popupinfo-delay 0.1
              corfu-auto-delay 0.1
              corfu-preselect 'prompt)

        (define-key corfu-map [tab] 'corfu-next)
        (define-key corfu-map [backtab] 'corfu-previous)
        (define-key corfu-map [ret] 'corfu-insert)
        (add-hook 'prog-mode-hook 'global-corfu-mode)
        (add-hook 'prog-mode-hook 'corfu-popupinfo-mode)
        (setup-kind-icon)
        (setup-cape))))

(defun setup-kind-icon ()
  "Setup kind-icon."
  (require 'kind-icon)
  ;; (setq kind-icon-use-icons t
  ;;       kind-icon-default-face 'corfu-default)
  (require 'nerd-icons)

  (setq kind-icon-use-icons nil)
  (setq kind-icon-mapping
      `(
        (array ,(nerd-icons-codicon "nf-cod-symbol_array") :face font-lock-type-face)
        (boolean ,(nerd-icons-codicon "nf-cod-symbol_boolean") :face font-lock-builtin-face)
        (class ,(nerd-icons-codicon "nf-cod-symbol_class") :face font-lock-type-face)
        (color ,(nerd-icons-codicon "nf-cod-symbol_color") :face success)
        (command ,(nerd-icons-codicon "nf-cod-terminal") :face default)
        (constant ,(nerd-icons-codicon "nf-cod-symbol_constant") :face font-lock-constant-face)
        (constructor ,(nerd-icons-codicon "nf-cod-triangle_right") :face font-lock-function-name-face)
        (enummember ,(nerd-icons-codicon "nf-cod-symbol_enum_member") :face font-lock-builtin-face)
        (enum-member ,(nerd-icons-codicon "nf-cod-symbol_enum_member") :face font-lock-builtin-face)
        (enum ,(nerd-icons-codicon "nf-cod-symbol_enum") :face font-lock-builtin-face)
        (event ,(nerd-icons-codicon "nf-cod-symbol_event") :face font-lock-warning-face)
        (field ,(nerd-icons-codicon "nf-cod-symbol_field") :face font-lock-variable-name-face)
        (file ,(nerd-icons-codicon "nf-cod-symbol_file") :face font-lock-string-face)
        (folder ,(nerd-icons-codicon "nf-cod-folder") :face font-lock-doc-face)
        (interface ,(nerd-icons-codicon "nf-cod-symbol_interface") :face font-lock-type-face)
        (keyword ,(nerd-icons-codicon "nf-cod-symbol_keyword") :face font-lock-keyword-face)
        (macro ,(nerd-icons-codicon "nf-cod-symbol_misc") :face font-lock-keyword-face)
        (magic ,(nerd-icons-codicon "nf-cod-wand") :face font-lock-builtin-face)
        (method ,(nerd-icons-codicon "nf-cod-symbol_method") :face font-lock-function-name-face)
        (function ,(nerd-icons-codicon "nf-cod-symbol_method") :face font-lock-function-name-face)
        (module ,(nerd-icons-codicon "nf-cod-file_submodule") :face font-lock-preprocessor-face)
        (numeric ,(nerd-icons-codicon "nf-cod-symbol_numeric") :face font-lock-builtin-face)
        (operator ,(nerd-icons-codicon "nf-cod-symbol_operator") :face font-lock-comment-delimiter-face)
        (param ,(nerd-icons-codicon "nf-cod-symbol_parameter") :face default)
        (property ,(nerd-icons-codicon "nf-cod-symbol_property") :face font-lock-variable-name-face)
        (reference ,(nerd-icons-codicon "nf-cod-references") :face font-lock-variable-name-face)
        (snippet ,(nerd-icons-codicon "nf-cod-symbol_snippet") :face font-lock-string-face)
        (string ,(nerd-icons-codicon "nf-cod-symbol_string") :face font-lock-string-face)
        (struct ,(nerd-icons-codicon "nf-cod-symbol_structure") :face font-lock-variable-name-face)
        (text ,(nerd-icons-codicon "nf-cod-text_size") :face font-lock-doc-face)
        (typeparameter ,(nerd-icons-codicon "nf-cod-list_unordered") :face font-lock-type-face)
        (type-parameter ,(nerd-icons-codicon "nf-cod-list_unordered") :face font-lock-type-face)
        (unit ,(nerd-icons-codicon "nf-cod-symbol_ruler") :face font-lock-constant-face)
        (value ,(nerd-icons-codicon "nf-cod-symbol_field") :face font-lock-builtin-face)
        (variable ,(nerd-icons-codicon "nf-cod-symbol_variable") :face font-lock-variable-name-face)
        (t ,(nerd-icons-codicon "nf-cod-code") :face font-lock-warning-face)))

  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(defun setup-cape ()
  "Setup cape."
  (require 'cape)
  (add-to-list 'completion-at-point-functions #'cape-file))


(provide 'init-corfu)
;;; init-corfu.el ends here
