;;; custom.el --- custom global configuration        -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: global vars

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

(setq soulwalker-active-winner t)                  ; wheather to active winner mode
(setq soulwalker-display-mode 'minibuffer)         ; completion display in `childframe` or `minibuffer`
(setq soulwalker-lsp-client 'lsp-mode)             ; completion client in `lsp-mode` or `lsp-bridge`
(setq soulwalker-completion-frontend 'corfu)       ; completion frontend in `corfu` or `company`
(setq soulwalker-completion-mechanism 'ivy)        ; completion mechanism in `ivy` or `vertico`
(setq soulwalker-show-dashboard t)                 ; to show dashboard or restore session when startup
(setq soulwalker-static-check-backend 'flycheck)   ; static check backend in `flycheck` or `flymake`
(setq soulwalker-icons-mode 'nerd-icons)           ; `nerd-icons` or `all-the-icons`


(provide 'custom)
;;; custom.el ends here
