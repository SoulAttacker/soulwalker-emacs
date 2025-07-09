;;; quick-indent.el --- Quick indent                 -*- lexical-binding: t; -*-

;; Copyright (C) 2025  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: convenience

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

(defgroup quick-indent nil
  "Quick indentation utilities."
  :group 'convenience
  :prefix "quick-indent-")

(defcustom quick-indent-offset tab-width
  "Number of columns to indent when using quick-indent commands.
This value can be different from `tab-width'."
  :type 'integer
  :group 'quick-indent
  :safe 'integerp)


(defun quick-indent-forward ()
  "Indent the current line or region to the right.
When region is active, keep it selected after indentation."
  (interactive)
  (let ((deactivate-mark nil))
    (if (use-region-p)
        (indent-rigidly (region-beginning) (region-end) quick-indent-offset)
      (indent-rigidly (line-beginning-position) (line-end-position) quick-indent-offset))))

(defun quick-indent-backward ()
  "Indent the current line or region to the left.
When region is active, keep it selected after indentation."
  (interactive)
  (let ((deactivate-mark nil))
    (if (use-region-p)
        (indent-rigidly (region-beginning) (region-end) (- quick-indent-offset))
      (indent-rigidly (line-beginning-position) (line-end-position) (- quick-indent-offset)))))

(provide 'quick-indent)
;;; quick-indent.el ends here
