;;; custom.el --- custom config                      -*- lexical-binding: t; -*-

;; Copyright (C) 2025  soulwalker

;; Author: soulwalker
;; Keywords: custom

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

;; some custom vars

;;; Code:

;; default theme only in `ef-summer` or `lazycat-theme`
(setq soulwalker-theme 'ef-summer)

;; wheather to enable winner-mode
(setq soulwalker-active-winner-mode nil)

;; choice of `childframe` or `posframe`
(setq soulwalker-display-mode 'childframe)

;; lsp client
(setq soulwalker-lsp-client 'lsp-bridge)

;; completion mechanism
(setq soulwalker-completion-mechanism 'vertico)

;; show dashboard
(setq soulwalker-show-dashboard t)

;; static check backend `flycheck` or `flymake`
(setq soulwalker-static-check-backend nil)

;; icons mode `nerd-icons` or `all-the-icons`
(setq soulwalker-icons-mode 'nerd-icons)

;; indent width
(setq soulwalker-indent-width 2)

;; default python path
(defvar soulwalker-default-python "~/.venv/base/bin/python")


(provide 'custom)
;;; custom.el ends here
