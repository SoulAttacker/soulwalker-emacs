;;; init-lsp-mode.el --- lsp-mode configuration           -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: lsp-mode

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


(defun setup-lsp-mode ()
  "Setup lsp-mode."
  (setq lsp-auto-guess-root t
	    lsp-log-io nil
        lsp-headerline-breadcrumb-segments '(project file symbols)
	    lsp-headerline-breadcrumb-enable nil
        lsp-headerline-breadcrumb-icons-enable nil
        lsp-signature-auto-activate t
        lsp-modeline-diagnostics-enable nil
        lsp-modeline-workspace-status-enable nil

        ;; python pylsp plugins setup
        ;; pydocstyle == 6.1.1 so slow
        lsp-pylsp-plugins-flake8-enabled nil
        lsp-pylsp-plugins-autopep8-enabled t
        lsp-pylsp-plugins-pydocstyle-enabled t
        lsp-pylsp-plugins-pydocstyle-max-line-length 300
        lsp-pylsp-plugins-pycodestyle-ignore '("E501" "E203" "E226" "E302" "E71")

        ;; cpp clangd setup
        c-basic-offset 4
        lsp-clangd-binary-path "/usr/bin/clangd")

  (require 'lsp-lens)
  (require 'lsp-mode)
  (require 'lsp-modeline)
  (lsp-enable-which-key-integration)
  (lsp-mode)
  (lsp)
  (setup-lsp-ui))

(defun setup-lsp-ui ()
  "Setup lsp-ui."
  (require 'lsp-ui)
  (setq lsp-ui-doc-include-signature t
        lsp-ui-doc-enable t
        lsp-ui-peek-always-show t
        lsp-ui-doc-show-with-cursor t
        lsp-ui-sideline-enable t
        lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-mode))

(provide 'init-lsp-mode)
;;; init-lsp-mode.el ends here
