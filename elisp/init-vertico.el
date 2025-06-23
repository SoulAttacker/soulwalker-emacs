;;; init-vertico.el --- vertico config               -*- lexical-binding: t; -*-

;; Copyright (C) 2025  soulwalker

;; Author: soulwalker
;; Keywords: vertico

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

(when (eq soulwalker-completion-mechanism 'vertico)
  (require 'vertico)
  (require 'vertico-directory)
  (vertico-mode 1)
  (define-key vertico-map (kbd "M-DEL") 'vertico-directory-delete-word))

(provide 'init-vertico)
;;; init-vertico.el ends here
