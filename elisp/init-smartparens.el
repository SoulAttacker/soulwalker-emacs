;;; init-smartparens.el --- smartparens config       -*- lexical-binding: t; -*-

;; Copyright (C) 2025  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: smartparens

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

(require 'smartparens-config)
(sp-with-modes
    '(c++-mode c++-ts-mode c-mode c-ts-mode go-mode go-ts-mode rust-mode rust-ts-mode)
  (sp-local-pair "(" nil :post-handlers '(:add ("||\n[i]" "RET")))
  (sp-local-pair "[" nil :post-handlers '(:add ("||\n[i]" "RET")))
  (sp-local-pair "{" nil :post-handlers '(:add ("||\n[i]" "RET"))))

(add-hook 'prog-mode-hook 'smartparens-mode)
(add-hook 'org-mode-hook 'smartparens-mode)

(provide 'init-smartparens)
;;; init-smartparens.el ends here
