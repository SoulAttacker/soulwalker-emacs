;;; init-prog.el --- prog-mode configuration         -*- lexical-binding: t; -*-

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

(require 'init-utils)

(defun setup-prog-mode ()
  "Setup prog-mode."
  (require 'prog-mode)
  (setq prettify-symbols-alist soulwalker-prettify-symbols-alist
        prettify-symbols-unprettify-at-point 'right-edge)
  (add-hook 'prog-mode-hook 'prettify-symbols-mode)
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))


(defun setup-flycheck ()
  "Setup package flycheck."
  (require 'flycheck)
  (add-hook 'prog-mode-hook 'flycheck-mode))

(defun setup-flymake ()
  "Setup package flymake."
  (add-hook 'prog-mode-hook 'flymake-mode))


(defun setup-elec-pair ()
  "Setup elec-pair."
  (setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit)
  (add-hook 'prog-mode-hook 'electric-pair-mode))


(defun setup-rainbow-delimiters ()
  "Setup rainbow-delimiters."
  (require 'rainbow-delimiters)
  (add-hook 'after-init-hook 'rainbow-delimiters-mode))

(provide 'init-prog)
;;; init-prog.el ends here
