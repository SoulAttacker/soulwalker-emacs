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

(defun setup-vertico ()
  "Setup package: vertico."
  (if (eq soulwalker-completion-mechanism 'vertico)
      (progn
        (require 'vertico)
        (vertico-mode)
        (if (eq soulwalker-display-mode 'posframe)
            (setup-vertico-posframe))
        (setup-vertico-directory)
        (setup-orderless)
        (setup-consult)
        (setup-marginalia))))


(defun setup-vertico-posframe ()
  "Setup package: vertico-posframe."
  (require 'vertico-posframe)
  (require 'vertico-multiform)
  (setq vertico-posframe-border-width 3
        vertico-posframe-parameters '((left-fringe . 8)
                                      (right-fringe . 8))
        vertico-multiform-commands
        '((consult-line
           posframe
           (vertico-posframe-poshandler . posframe-poshandler-frame-top-center)
           (vertico-posframe-border-width . 10)
           (vertico-posframe-fallback-mode . vertico-buffer-mode))
          (t posframe)))
  (vertico-posframe-mode))

(defun setup-vertico-directory ()
  "Setup package: vertico-directory"
  (require 'vertico-directory)
  (define-key vertico-map (kbd "RET") 'vertico-directory-enter)
  (define-key vertico-map (kbd "DEL") 'vertico-directory-delete-char)
  (define-key vertico-map (kbd "M-DEL") 'vertico-directory-delete-word))

(defun setup-orderless ()
  "Setup package: orderless."
  (require 'orderless)
  (setq completion-styles '(orderless)))

(defun setup-consult ()
  "Setup package: consult."
  (require 'consult)
  (global-set-key (kbd "C-s") 'consult-line))

(defun setup-marginalia ()
  "Setup package: marginalia."
  (require 'marginalia)
  (marginalia-mode)
  (setup-all-the-icons-completion))

(defun setup-all-the-icons-completion ()
  "Setup package: all-the-icons-completion."
  (require 'all-the-icons-completion)
  (all-the-icons-completion-mode))

(provide 'init-vertico)
;;; init-vertico.el ends here
