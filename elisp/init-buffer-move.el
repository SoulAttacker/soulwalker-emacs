;;; init-buffer-move.el --- buffer-move config       -*- lexical-binding: t; -*-

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

(require 'buffer-move)
(require 'consult)

(one-key-create-menu
 "Buffer"
 '(
   (("b" . "Buffer switch-buffer") . consult-buffer)
   (("k" . "Buffer kill-this-buffer") . kill-this-buffer)
   (("n" . "Buffer next-buffer") . next-buffer)
   (("p" . "Buffer previous-buffer") . previous-buffer)
   (("H" . "Buffer move-to-left") . buf-move-left)
   (("J" . "Buffer move-to-down") . buf-move-down)
   (("K" . "Buffer move-to-up") . buf-move-up)
   (("L" . "Buffer move-to-right") . buf-move-right)
   )
 t)

(provide 'init-buffer-move)
;;; init-buffer-move.el ends here
