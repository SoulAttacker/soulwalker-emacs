;;; init-basic.el --- basic config                   -*- lexical-binding: t; -*-

;; Copyright (C) 2025  soulwalker

;; Author: soulwalker
;; Keywords: basic configuration

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

;; default coding system
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(setq system-time-locale "C")
(set-selection-coding-system 'utf-8)

;; backup
(setq make-backup-files nil
      auto-save-default nil)

;; disable locking file
(setq create-lockfiles nil)

;; always load newest file
(setq load-prefer-newer t)

;; disable bell & blink cursor
(setq ring-bell-function 'ignore
      blink-cursor-mode  nil)

;; pair highlight
(show-paren-mode 1)
(set-face-attribute 'show-paren-match nil :background "cyan" :underline t)

;; tab initialize
(setq-default indent-tabs-mode nil
              tab-width        soulwalker-indent-width)

;; replace command key with meta key in mac
(when *is-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  ;; (global-set-key (kbd "M-c") 'kill-ring-save) ; ⌘-c = Copy
  ;; (global-set-key (kbd "M-v") 'yank) ; ⌘-v = Paste
  (global-set-key (kbd "M-z") 'undo) ; ⌘-z = Undo
  (global-set-key (kbd "≈") 'execute-extended-command)) ; Replace ≈ with whatever your option-x produces)

;; replace yes-or-no with y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)

;; font setup
(defun font-installed-p (font-name)
  "Check if font with FONT-NAME is available."
  (find-font (font-spec :name font-name)))


(when (display-graphic-p)
  ;; Set default font
  (cl-loop for font in '("Aporetic Sans Mono" "Maple Mono NF CN" "M+CodeLat50 Nerd Font Mono" "Pragmasevka" "FantasqueSansM Nerd Font Mono" "0xProto Nerd Font" "Retro Pixel Cute Mono"
                         "Mx437 IBM VGA 9x16" "Victor Mono"  "Rec Mono Casual" "Cartograph CF" "Iosevka" "AnonymicePro Nerd Font" "CaskaydiaCove Nerd Font"
                         "PT Mono" "Fira Code" "Jetbrains Mono"
                         "SF Mono" "Hack" "Source Code Pro" "Menlo"
                         "Monaco" "DejaVu Sans Mono" "CozetteVector")
           when (font-installed-p font)
           return (set-face-attribute 'default nil
                                      :family font
                                      :height 130))

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
  (cl-loop for font in '("LXGW WenKai Mono" "Retro Pixel Cute Mono"  "Sonti TC" "PingFang SC" "Microsoft Yahei" "STFangsong")
           when (font-installed-p font)
           return (progn
                    (setq face-font-rescale-alist `((,font . 0.95)))
                    (set-fontset-font t '(#x4e00 . #x9fff) (font-spec :family font)))))



;; env path
(defun my-load-envvars-file (file &optional noerror)
  "Read and set envvars from FILE.
If NOERROR is non-nil, don't throw an error if the file doesn't exist or is unreadable.
Returns the names of envvars that were changed."
  (if (not (file-readable-p file))
      (unless noerror
        (signal 'file-error (list "Couldn't read envvar file" file)))
    (let (envvars environment)
      (with-temp-buffer
        (save-excursion
          (insert "\n")
          (insert-file-contents file))
        (while (re-search-forward "\n *\\([^#= \n]*\\)=" nil t)
          (push (match-string 1) envvars)
          (push (buffer-substring
                 (match-beginning 1)
                 (1- (or (save-excursion
                           (when (re-search-forward "^\\([^= ]+\\)=" nil t)
                             (line-beginning-position)))
                         (point-max))))
                environment)))
      (when environment
        (setq process-environment
              (append (nreverse environment) process-environment)
              exec-path
              (if (member "PATH" envvars)
                  (append (split-string (getenv "PATH") path-separator t)
                          (list exec-directory))
                exec-path)
              shell-file-name
              (if (member "SHELL" envvars)
                  (or (getenv "SHELL") shell-file-name)
                shell-file-name))
        envvars))))

(defconst my-env-dir (concat user-emacs-directory ".local"))
(defconst my-env-file (concat user-emacs-directory ".local/env" ))

;; `printenv > ~/.config/emacs/.local/env`
(defconst make-env-file (concat "printenv > " my-env-file))

(unless (file-exists-p my-env-dir)
  (make-directory my-env-dir))

(unless (file-exists-p my-env-file)
  (shell-command make-env-file))

(when (and (or (display-graphic-p)
               (daemonp))
           (file-exists-p my-env-file))
  (my-load-envvars-file my-env-file))

;; proxy setting
(defun set-proxy ()
  "Setup network proxy."
  (interactive)
  (setq url-proxy-services
        '(("no_proxy" . "^\\(localhost\\|10.*\\)")
          ("http" . "127.0.0.1:7890")
          ("https" . "127.0.0.1:7890")))
  (message "Proxy setup!"))

(defun unset-proxy ()
  "Unset network proxy."
  (interactive)
  (setq url-proxy-services nil)
  (message "Proxy unset!"))

;; default set proxy
(set-proxy)

;; basic ui
(setq inhibit-startup-message t  ;; disable startup page
      scroll-step             1  ;; scroll-step to 1
      scroll-margin           0) ;; scroll-margin to 0

;; disable tool bar
(tool-bar-mode -1)

;; disable scroll bar
(scroll-bar-mode -1)

;; disable menu bar
(menu-bar-mode 1)

;; highlight current line
;; (global-hl-line-mode)

;; for hyprland
(when (and (display-graphic-p) (is-hyprland))
  ;; set off all gui decoration
  (set-frame-parameter nil 'undecorated t)
  (setq default-frame-alist
        '((tool-bar-lines . 0)
          (menu-bar-lines . 0)
          (vertical-scroll-bars . nil)
          (horizontal-scroll-bars . nil)
          (alpha . 90)))

  (setq x-gtk-use-system-tooltips nil)
  (setq x-gtk-resize-child-frames 'resize-mode))


(provide 'init-basic)
;;; init-basic.el ends here
