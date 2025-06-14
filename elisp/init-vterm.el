;;; init-vterm.el --- vterm config                   -*- lexical-binding: t; -*-

;; Copyright (C) 2025  soulwalker

;; Author: soulwalker
;; Keywords: vterm

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

(require 'vterm)
(setq vterm-kill-buffer-on-exit t)

(one-key-create-menu
 "VTERM"
 '(
   (("t" . "Terminal vterm") . vterm-other-window)
   (("c" . "Terminal multi-vterm") . multi-vterm)
   (("n" . "Terminal multi-vterm-next") . multi-vterm-next)
   (("p" . "Terminal multi-vterm-prev") . multi-vterm-prev)
   ))


(provide 'init-vterm)
;;; init-vterm.el ends here
