;;; init-vertico.el --- vertico configuration        -*- lexical-binding: t; -*-

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

;; package: vertico
(progn 
  (require 'vertico)
  (require 'vertico-posframe)
  
  (vertico-mode)
  (vertico-posframe-mode))

;; package: vertico-directory
(progn
  (require 'vertico-directory)
  (define-key vertico-map (kbd "RET") 'vertico-directory-enter)
  (define-key vertico-map (kbd "DEL") 'vertico-directory-delete-word))

;; package: orderless
(progn
  (require 'orderless)
  (setq completion-styles '(orderless)))

;; package: consult
(progn
  (require 'consult)
  (global-set-key (kbd "C-s") 'consult-line))

;; package: marginalia
(progn
  (require 'marginalia)
  (marginalia-mode 1))

(provide 'init-vertico)
;;; init-vertico.el ends here
