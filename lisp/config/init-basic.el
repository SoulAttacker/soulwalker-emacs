;;; init-basic.el --- basic configuration               -*- lexical-binding: t; -*-

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


(require 'cl-macs)

(defun setup-fonts ()
  "Setup fonts."
  (when (display-graphic-p)
    ;; Set default font
    (cl-loop for font in '("CaskaydiaCove Nerd Font" "PT Mono" "Fira Code" "Jetbrains Mono"
                           "SF Mono" "Hack" "Source Code Pro" "Menlo"
                           "Monaco" "DejaVu Sans Mono" "CozetteVector")
             when (font-installed-p font)
             return (set-face-attribute 'default nil
                                        :family font
                                        :height 150))

    ;; Specify font for all unicode characters
    (cl-loop for font in '("Segoe UI Symbol" "Symbola" "Symbol")
             when (font-installed-p font)
             return (if (< emacs-major-version 27)
                        (set-fontset-font "fontset-default" 'unicode font nil 'prepend)
                      (set-fontset-font t 'symbol (font-spec :family font) nil 'prepend)))

    ;; Emoji
    (cl-loop for font in '("Noto Color Emoji" "Apple Color Emoji" "Segoe UI Emoji")
             when (font-installed-p font)
             return (cond
                     ((< emacs-major-version 27)
                      (set-fontset-font "fontset-default" 'unicode font nil 'prepend))
                     ((< emacs-major-version 28)
                      (set-fontset-font t 'symbol (font-spec :family font) nil 'prepend))
                     (t
                      (set-fontset-font t 'emoji (font-spec :family font) nil 'prepend))))

    ;; Specify font for Chinese characters
    (cl-loop for font in '("Sonti TC" "PingFang SC" "Microsoft Yahei" "STFangsong")
             when (font-installed-p font)
             return (progn
                      (setq face-font-rescale-alist `((,font . 1.0)))
                      (set-fontset-font t '(#x4e00 . #x9fff) (font-spec :family font))))))

(defun setup-basic ()
  "Basic setup."
  ;; Set UTF-8 as the default coding system
  (when (fboundp 'set-charset-priority)
    (set-charset-priority 'unicode))
  (prefer-coding-system 'utf-8)
  (setq locale-coding-system 'utf-8)
  (setq system-time-locale "C")
  (set-selection-coding-system 'utf-8)

  ;; backup
  ;; disable file backup & auto save
  (setq make-backup-files nil auto-save-default nil)

  ;; disable locking file
  (setq create-lockfiles nil)

  ;; always load newest file
  (setq load-prefer-newer t)

  ;; disable bell
  (setq ring-bell-function 'ignore blink-cursor-mode nil)

  ;; font
  (defun font-installed-p (font-name)
    "Check if font with FONT-NAME is available."
    (find-font (font-spec :name font-name)))

  ;; setup fonts
  (setup-fonts)

  ;; pair highlight
  (show-paren-mode 1)

  ;; tab
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)

  ;; os setting
  (defconst *is-mac* (eq system-type 'darwin))
  (defconst *is-linux* (eq system-type 'gnu/linux))
  (defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

  ;; replace command with meta in mac
  (when *is-mac*
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier 'alt)
    (global-set-key (kbd "M-c") 'kill-ring-save) ; ⌘-c = Copy
    (global-set-key (kbd "M-v") 'yank) ; ⌘-v = Paste
    (global-set-key (kbd "M-z") 'undo) ; ⌘-z = Undo
    (global-set-key (kbd "≈") 'execute-extended-command)) ; Replace ≈ with whatever your option-x produces)

  ;; replace yes-or-no with y-or-n
  (defalias 'yes-or-no-p 'y-or-n-p))

(provide 'init-basic)
;;; init-basic.el ends here
