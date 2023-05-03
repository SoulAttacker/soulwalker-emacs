;;; init-corfu.el --- corfu configuration            -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
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

(defun setup-corfu ()
  "Setup corfu."
  (require 'corfu)
  (require 'corfu-popupinfo)
  (setq corfu-cycle t
        corfu-auto t
        corfu-auto-prefix 1
        corfu-popupinfo-delay 0.1
        corfu-preselect 'prompt)

  (define-key corfu-map [tab] 'corfu-next)
  (define-key corfu-map [backtab] 'corfu-previous)
  (define-key corfu-map [ret] 'corfu-insert)
  (global-corfu-mode)
  (corfu-popupinfo-mode)
  (setup-kind-icon))


(defun setup-kind-icon ()
  "Setup kind-icon."
  (require 'kind-icon)
  (setq kind-icon-default-face 'corfu-default)
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))


(provide 'init-corfu)
;;; init-corfu.el ends here
