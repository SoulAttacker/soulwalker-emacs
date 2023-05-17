;;; init-evil.el --- evil configuration              -*- lexical-binding: t; -*-

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


(defun setup-evil ()
  "Setup evil."
  (setq evil-want-keybinding nil
        evil-want-integration t
        evil-want-Y-yank-to-eol t
        evil-want-fine-undo t)
  (require 'evil)
  (evil-mode))

(defun setup-evil-goggles ()
  "Setup evil-goggles."
  (require 'evil-goggles)
  (evil-goggles-mode)
  (evil-goggles-use-diff-faces))

(defun setup-evil-collection ()
  "Setup evil-collection."
  (require 'evil-collection)
  (evil-collection-init)
  (setup-evil-goggles))



(provide 'init-evil)
;;; init-evil.el ends here
