;;; init-which-key.el --- which-key configuration    -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: which-key

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
(defun setup-which-key ()
  "Setup which-key."
  (require 'which-key)
  (setq which-key-idle-delay 0.3)
  (add-hook 'after-init-hook 'which-key-mode)
  (with-eval-after-load 'which-key
    (setup-which-key-posframe)))

(defun setup-which-key-posframe ()
  "Setup which-key-posframe."
  (require 'which-key-posframe)
  (which-key-posframe-mode))

(provide 'init-which-key)
;;; init-which-key.el ends here
