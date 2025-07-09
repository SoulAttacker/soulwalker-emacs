;;; init-key.el --- key config                       -*- lexical-binding: t; -*-

;; Copyright (C) 2025  soulwalker

;; Author: soulwalker
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

(require 'lazy-load)

;; toolkit
(lazy-load-set-keys
 '(
   ("M-h" . set-mark-command)
   ("M-H" . rectangle-mark-mode)
   ("C-S-<left>" . shrink-window-horizontally)
   ("C-S-<right>" . enlarge-window-horizontally)
   ("C-S-<up>" . enlarge-window)
   ("C-S-<down>" . shrink-window)
   ("C-k" . kill-whole-line)
   ("C-S-k" . kill-line)
   ("C-S-l" . duplicate-line)
   ("C-`" . popper-toggle)
   ("M-`" . popper-cycle)
   ("C-M-`" . popper-toggle-type)
   ("M-[" . sort-tab-select-prev-tab)
   ("M-]" . sort-tab-select-next-tab)
   ("M-d" . kill-word)
   ("M-D" . backward-kill-word)
   ("M-;" . comment-line)
   ("C-h r" . restart-emacs)
   ))

;; avy
(lazy-load-global-keys
 '(
   ("M-a" . avy-goto-char-timer)
   )
 "init-avy")

;; thing-edit
(lazy-load-global-keys
 '(
   ("C-t" . one-key-menu-thing-edit)
   )
 "init-thing-edit")

;; vundo
(lazy-load-global-keys
 '(
   ("M-S-z" . vundo)
   )
 "init-vundo")

;; blink-search
(lazy-load-global-keys
 '(
   ("s-s" . blink-search)
   )
 "init-blink-search")

;; consult
(lazy-load-global-keys
 '(
   ("M-c" . one-key-menu-consult)
   )
 "init-consult")

;; treemacs
(lazy-load-global-keys
 '(
   ("M-e" . treemacs)
   )
 "init-treemacs")

;; projectile
(lazy-load-global-keys
 '(
   ("M-p" . one-key-menu-project)
   )
 "init-projectile")

;; vterm
(lazy-load-unset-keys '("M-t"))
(lazy-load-global-keys
 '(
   ("M-t" . one-key-menu-vterm)
   )
 "init-vterm")

;; dirvish
(lazy-load-global-keys
 '(
   ("M-P" . dirvish)
   )
 "init-dirvish")

;; default-text-scale
(lazy-load-global-keys
 '(
   ("M--" . default-text-scale-decrease)
   ("M-=" . default-text-scale-increase)
   )
 "init-default-text-scale")

;; ace-window
(lazy-load-global-keys
 '(
   ("M-o" . ace-window)
   )
 "init-ace-window")

;; buffer move
(lazy-load-unset-keys
 '("C-x b"))
(lazy-load-global-keys
 '(
   ("C-x b" . one-key-menu-buffer)
   )
 "init-buffer-move")

;; move-text
(lazy-load-global-keys
 '(
   ("C-S-p" . move-text-up)
   ("C-S-n" . move-text-down)
   )
 "init-move-text")

;; quick-indent
(lazy-load-global-keys
 '(
   ("C->" . quick-indent-forward)
   ("C-<" . quick-indent-backward)
   )
 "init-quick-indent")

;; open new line
(lazy-load-global-keys
 '(
   ("C-o" . open-newline-below)
   ("C-l" . open-newline-above)
   )
 "init-open-newline")

;; lsp
(lazy-load-set-keys
 '(
   ("M-l" . one-key-menu-lsp)
   ))

;; window
(one-key-create-menu
 "WINDOW"
 '(
   (("v" . "Window split-vertically") . split-window-vertically)
   (("h" . "Window split-horizontally") . split-window-horizontally)
   ))

;; window
(lazy-load-unset-keys '("s-w"))
(lazy-load-set-keys
 '(
   ("s-w" . one-key-menu-window)
   ))

;; mark-macro
(lazy-load-global-keys
 '(
   ("M-m" . one-key-menu-mark-macro)
   )
 "init-markmacro")

;; magit
(lazy-load-unset-keys '("s-m"))
(lazy-load-global-keys
 '(
   ("s-m" . magit)
   )
 "init-magit")

(provide 'init-key)
;;; init-key.el ends here
