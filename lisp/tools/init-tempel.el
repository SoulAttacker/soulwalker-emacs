;;; init-tempel.el --- tempel configuration          -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: tempel

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


(defun setup-tempel-collection ()
  "Setup tempel-collection.")

(defun setup-tempel ()
  "Setup tempel."
  (require 'tempel)
  (setq-local completion-at-point-functions
                (cons #'tempel-expand
                      completion-at-point-functions))
  (tempel-abbrev-mode))

(provide 'init-tempel)
;;; init-tempel.el ends here
