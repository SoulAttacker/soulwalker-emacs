;;; init-company.el --- company configuration        -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: company

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

(defun setup-company-box ()
  "Setup company-box."
  (with-eval-after-load 'company
    (require 'company-box)
    (company-box-mode)))

(defun setup-company ()
  "Setup company."
  (require 'company)
  (require 'company-tng)
  (setq company-minimum-prefix-length 1
        company-transformers '(company-sort-by-occurrence))
  (global-company-mode)
  (company-tng-mode)
  (add-hook 'prog-mode-hook 'global-company-mode)
  (add-hook 'company-mode 'company-tng-mode))

(provide 'init-company)
;;; init-company.el ends here
