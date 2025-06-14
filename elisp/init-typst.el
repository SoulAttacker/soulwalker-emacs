;;; init-typst.el --- typst config                   -*- lexical-binding: t; -*-

;; Copyright (C) 2025  soulwalker

;; Author: soulwalker
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

(require 'typst-ts-mode)
(require 'typst-preview)

(setq
 typst-ts-mode-indent-offset soulwalker-indent-width
 typst-ts-mode-watch-options "--open")

(add-hook 'typst-ts-mode smartparens-mode)
(add-hook 'typst-ts-mode lsp-bridge-mode)

(setq typst-preview-browser "xwidget"
      typst-preview-invert-colors "yes"
      typst-preview-start-subfile-preview-automatically nil)

(provide 'init-typst)
;;; init-typst.el ends here
