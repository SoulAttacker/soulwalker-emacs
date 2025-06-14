;;; init-apheleia.el --- apheleia config             -*- lexical-binding: t; -*-

;; Copyright (C) 2025  soulwalker

;; Author: soulwalker
;; Keywords: apheleia

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

(require 'apheleia)

;; change python formatter into ruff
(setf (alist-get 'python-ts-mode apheleia-mode-alist) 'ruff)
(setf (alist-get 'python-mode apheleia-mode-alist) 'ruff)

(add-hook 'prog-mode-hook 'apheleia-mode)

(provide 'init-apheleia)
;;; init-apheleia.el ends here
