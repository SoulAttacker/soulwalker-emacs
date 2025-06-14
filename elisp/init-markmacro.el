;;; init-markmacro.el --- markmacro config           -*- lexical-binding: t; -*-

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

(require 'markmacro)

(one-key-create-menu
 "MARK-MACRO"
 '(
   (("a" . "Mark apply-all") . markmacro-apply-all)
   (("w" . "Mark word") . markmacro-mark-words)
   (("s" . "Mark symbol") . markmacro-mark-symbols)
   (("l" . "Mark line") . markmacro-mark-lines)
   (("c" . "Mark char") . markmacro-mark-chars)
   (("p" . "Mark parameters") . markmacro-mark-parameters)
   (("i" . "Mark imenu") . markmacro-mark-imenus)
   (("h" . "Secondary region set") . markmacro-secondary-region-set)
   (("j" . "Secondary region mark cursor") . markmacro-secondary-region-mark-cursors)
   )
 t)

(provide 'init-markmacro)
;;; init-markmacro.el ends here
