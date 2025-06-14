;;; init-dashboard.el --- dashboard config           -*- lexical-binding: t; -*-

;; Copyright (C) 2025  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: dashboard

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

(require 'dashboard)
(require 'projectile)

(setq
 dashboard-startup-banner (concat user-emacs-directory "etc/logo_scale.png")
 dashboard-banner-logo-title "Welcome to SoulWalker's Emacs! Love ya~"
 dashboard-center-content t
 dashboard-show-shortcuts t
 dashboard-set-file-icons t
 dashboard-projects-backend 'projectile
 dashboard-items '((recents . 10)
                   (projects . 5)))

;; refresh dashboard
(dashboard-refresh-buffer)

(provide 'init-dashboard)
;;; init-dashboard.el ends here
