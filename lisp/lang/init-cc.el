;;; init-cc.el --- c/c++ configuration               -*- lexical-binding: t; -*-

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

(defun setup-cc-mode ()
  "Setup cc-mode."
  (require 'cc-mode)
  (setq c-basic-offset 4)
  (setup-cmake-mode))

(defun setup-cmake-mode()
  "Setup cmake-mode."
  (require 'cmake-mode)
  (add-to-list 'auto-mode-alist '("CMakeLists\\.txt'" . #'cmake-mode)))

(provide 'init-cc)
;;; init-cc.el ends here
