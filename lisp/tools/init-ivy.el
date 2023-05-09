;;; init-ivy.el --- ivy, swiper, counsel configuration  -*- lexical-binding: t; -*-

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

(defun setup-ivy ()
  "Setup ivy."
  (require 'ivy)
  (setq ivy-count-format "(%d/%d) ")
  (ivy-mode))


(defun setup-swiper ()
  "Setup swiper."
  (require 'swiper)
  (global-set-key (kbd "C-s") 'swiper))

(defun setup-counsel ()
  "Setup swiper."
  (require 'counsel)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x b") 'counsel-switch-buffer)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file))

(defun setup-ivy-rich ()
  "Setup ivy-rich."
  (require 'ivy-rich)
  (ivy-rich-mode))

(defun setup-all-the-icons-ivy-rich ()
  "Setup all-the-icons-ivy-rich."
  (require 'all-the-icons-ivy-rich)
  (setq
   ;; Whether display the icons
   all-the-icons-ivy-rich-icon t
   ;; Whether display the colorful icons.
   all-the-icons-ivy-rich-color-icon t
   ;; The icon size
   all-the-icons-ivy-rich-icon-size 1.0
   ;; Whether support project root
   all-the-icons-ivy-rich-project t
   ;; Maximum truncation width of annotation fields.
   all-the-icons-ivy-rich-field-width 80)
  (all-the-icons-ivy-rich-mode))


(defun setup-ivy-posframe ()
  "Setup ivy-posframe."
  (require 'ivy-posframe)
  (setq ivy-height 15
        ivy-posframe-border-width 3
        ivy-posframe-parameters '((left-fringe . 8)
                                  (right-fringe . 8))
        ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
  (ivy-posframe-mode))


(provide 'init-ivy)
;;; init-ivy.el ends here
