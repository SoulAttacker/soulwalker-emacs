;;; init-ui.el --- ui configuration                  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: dashboard, theme, modeline, tabs, icons, indent

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

;; ui basic configuration

;;; Code:

(require 'cl-macs)
(require 'init-funcs)

(defun setup-basic-ui ()
  "Basic ui setup."
  ;; disable startup
  (setq inhibit-startup-message t)

  ;; disable tool-bar
  (tool-bar-mode -1)

  ;; disable scroll-bar
  (scroll-bar-mode -1)

  ;; scroll mode
  (setq scroll-step 1
        scroll-margin 0)

  ;; disable menu-bar
  (menu-bar-mode 1)

  ;; title bar
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)))


(defun setup-all-the-icons ()
  "Setup package: all-the-icons."
  (when (display-graphic-p)
    (require 'all-the-icons)))


(defun setup-centaur-tabs ()
  "Setup package: centaur-tabs."
  (require 'centaur-tabs)
  (setq centaur-tabs-style "rounded"
        centaur-tabs-height 16
        centaur-tabs-set-icons t
        centaur-tabs-set-bar 'under
        centaur-tabs-show-count nil
        centaur-tabs-show-new-tab-button nil
        centaur-tabs-plain-icons t
        x-underline-at-descent-line t
        centaur-tabs-left-edge-margin nil
        centaur-tabs-adjust-buffer-order 'left)
  (centaur-tabs-mode))

(defun disable-centaur-tabs-mode ()
  "Disable `centaur-tabs-mode' in `dashboard-mode'."
  (centaur-tabs-local-mode))


(defun setup-dashboard ()
  "Setup package: dashboard."
  (require 'dashboard)
  (setq dashboard-startup-banner (concat user-emacs-directory "etc/logo_scale.png")
        dashboard-banner-logo-title "Welcome to SoulWalker's Emacs! Love ya~"
        dashboard-center-content t
        dashboard-show-shortcuts t
        dashboard-set-file-icons t

        dashboard-items '((recents . 10)
                          (projects . 5)))
  (dashboard-setup-startup-hook)
  (dashboard-refresh-buffer)
  (require 'centaur-tabs)
  (centaur-tabs-local-mode))


(defun setup-soulwalker-theme ()
  "Setup personal theme: soulwalker-theme."
  (add-to-list 'custom-theme-load-path (concat user-emacs-directory "lisp/themes"))
  (load-theme 'soulwalker-dark t))


(defun setup-highlight-indent-guides ()
  "Setup package: highlight-indent-guides."
  (require 'highlight-indent-guides)
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-auto-character-face-perc 300
        highlight-indent-guides-reponsive 'top)
  (highlight-indent-guides-mode))


(defun slogon-info ()
  "Personal slogn."
  "Code is ART!")


(defun setup-awesome-tray ()
  "Setup package: awesome-tray."
  (require 'awesome-tray)
  (add-to-list 'awesome-tray-module-alist
               '("slogon" . (slogon-info awesome-tray-pink-face)))
  (setq awesome-tray-active-modules '("location" "belong" "file-path" "mode-name" "date" "slogon"))
  (awesome-tray-mode))

(provide 'init-ui)
;;; init-ui.el ends here
