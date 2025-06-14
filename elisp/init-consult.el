;;; init-consult.el --- consult config               -*- lexical-binding: t; -*-

;; Copyright (C) 2025  soulwalker

;; Author: soulwalker <>
;; Keywords: consult

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

(with-eval-after-load 'vertico
  (require 'consult)
  (one-key-create-menu
   "CONSULT"
   '(
     (("c" . "Consult mode-command") . consult-mode-command)
     (("d" . "Consult find") . consult-find)
     (("e" . "Consult isearch-history") . consult-isearch-history)
     (("g" . "Consult goto-line") . consult-goto-line)
     (("h" . "Consult history") . consult-history)
     (("l" . "Consult line") . consult-line)
     (("y" . "Conslut yank-pop") . consult-yank-pop)
     (("r" . "Consult ripgrep") . consult-ripgrep)
     )
   t)
  )


(provide 'init-consult)
;;; init-consult.el ends here
