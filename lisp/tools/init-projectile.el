;;; init-projectile.el --- projectile configuration  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: projectile

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

(defun setup-projectile ()
  "Setup projectile."
  (require 'projectile)
  (setq projectile-switch-project-action #'projectile-dired)
  (add-hook 'after-init-hook 'projectile-mode)
  (with-eval-after-load 'projectile
    (setup-counsel-projectile)))

(defun setup-counsel-projectile ()
  "Setup counsel-projectile."
  (if (eq soulwalker-completion-mechanism 'ivy)
      (progn
        (require 'counsel-projectile)
        (setq counsel-projectile-grep-initial-input '(ivy-thing-at-point))
        (when (executable-find "ugrep")
          (setq counsel-projectile-grep-base-command "ugrep --color=never -rnEI %s"))
        (counsel-projectile-mode))))


(defun setup-consult-projectile ()
  "Setup consult-projectile."
  (if (eq soulwalker-completion-mechanism 'vertico)
      (progn
        (require 'consult-projectile))))



(provide 'init-projectile)
;;; init-projectile.el ends here
