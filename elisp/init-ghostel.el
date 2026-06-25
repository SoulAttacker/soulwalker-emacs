;;; init-ghostel.el --- ghostel configuration        -*- lexical-binding: t; -*-

;; Copyright (C) 2026  soulwalker

;; Author: soulwalker <soulwalker@Mac>
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

(require 'ghostel)

(defun ghostel-other-window ()
  (interactive)
  (split-window-below)
  (ghostel))

(one-key-create-menu
 "GTERM"
 '(
   (("t" . "Terminal Ghostel") . ghostel-other-window)
   ))

(provide 'init-ghostel)
;;; init-ghostel.el ends here
