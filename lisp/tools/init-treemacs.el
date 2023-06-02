;;; init-treemacs.el --- auto insert configuration   -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: tools

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

(defun setup-treemacs ()
  "Setup package: treemacs."
  (require 'treemacs)
  (require 'treemacs-file-management)
  (require 'cfrs)
  (add-hook 'treemacs-mode-hook 'treemacs-follow-mode)
  (add-hook 'treemacs-mode-hook #'setup-treemacs-evil)
  (setup-treemacs-nerd-icons))

(defun setup-treemacs-evil ()
  "Setup package: treemacs-evil."
  (require 'treemacs-evil))

(defun setup-treemacs-nerd-icons ()
  "Setup package: treemacs-nerd-icons."
  (if (eq soulwalker-icons-mode 'nerd-icons)
      (progn
        (require 'treemacs-nerd-icons)
        (treemacs-load-theme "nerd-icons"))))

(provide 'init-treemacs)
;;; init-treemacs.el ends here
