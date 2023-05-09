;;; init-prescient.el --- prescient configuration    -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: prescient

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

(defun setup-prescient ()
  "Setup prescient."
  (require 'prescient))

(defun setup-ivy-prescient ()
  "Setup ivy-prescient."
  (require 'ivy)
  (require 'ivy-prescient)
  (with-eval-after-load 'ivy
    (ivy-prescient-mode)))


(provide 'init-prescient)
;;; init-prescient.el ends here
