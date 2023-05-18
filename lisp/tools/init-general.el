;;; init-general.el --- general configuration        -*- lexical-binding: t; -*-

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

(defun setup-default-text-scale ()
  "init package: default-text-scale"
  (require 'default-text-scale))

(defun setup-general ()
  "init package: general"
  (require 'general)
  (general-evil-setup t))


(defun open-soulwalker-configuration ()
  "Open soulwalker config file."
  (interactive)
  (counsel-find-file user-emacs-directory))


(require 'general)

;; global key binding
(general-define-key
 "M--" 'default-text-scale-decrease
 "M-=" 'default-text-scale-increase
 "C-S-<left>"  '(shrink-window-horizontally :wk "shrink-window-horizontally")
 "C-S-<right>" '(enlarge-window-horizontally :wk "enlarge-window-horizontally")
 "C-S-<down>"  '(shrink-window :wk "shrink-window")
 "C-S-<up>"    '(enlarge-window :wk "enlarge-window")
 "C-a" '(move-beginning-of-line :wk "move-begin")
 "C-e" '(move-end-of-line :wk "move-end")
 "C-`" '(popper-toggle-latest :wk "popper-toggle-latest")
 "M-`" '(popper-cycle :wk "popper-cycle")
 "C-M-`" '(popper-toggle-type :wk "popper-toggle-type")
 "M-[" '(sort-tab-select-prev-tab :wk "prev-tab")
 "M-]" '(sort-tab-select-next-tab :wk "prev-tab")
 )


;; func to define soulwalker leader-key keymap
(general-create-definer soulwalker-leader-def
  :states '(normal insert visual emacs)
  :keymaps 'override
  :prefix "SPC"
  :non-normal-prefix "C-,")

;; func to define soulwalker normal state keymap
(general-create-definer soulwalker-normal-def
  :states '(normal)
  :keymaps 'override)

;; func to define soulwalker insert state keymap
(general-create-definer soulwalker-insert-def
  :states '(insert)
  :keymaps 'override)

(soulwalker-insert-def
  ;; activate C-a C-e in insert state
  "C-a" '(move-beginning-of-line :wk "move-begin")
  "C-e" '(move-end-of-line :wk "move-end")

  ;; can use C-hjkl to move cursor in insert state
  "C-h" '(backward-char :wk "backward-char")
  "C-j" '(next-line :wk "next-line")
  "C-k" '(previous-line :wk "previous-line")
  "C-l" '(forward-char :wk "forward-char")
  )

;; normal state key definition
(soulwalker-normal-def
  ;; activate C-a C-e in insert state
  "C-a" '(move-beginning-of-line :wk "move-begin")
  "C-e" '(move-end-of-line :wk "move-end")


  ;; siper
  "/" '(swiper :wk "swiper")

  ;; remap C-r
  "C-r" '(undo-redo :wk "undo-redo")

  ;; command for macos
  "M-s" '(save-buffer :wk "save-file")
  )

;; leader key definition, prefix is "SPC" or "C-,"
(soulwalker-leader-def
  "SPC" '(counsel-M-x :wk "counsel-M-x")
  "a" '(:wk "Avy")
  "ac" '(avy-goto-char :wk "avy-goto-char")
  "aw" '(avy-goto-word-1 :wk "avy-goto-word")

  "b" '(:wk "Buffer")
  "bb" '(counsel-switch-buffer :wk "switch-buffer")
  "bk" '(kill-this-buffer :wk "kill-this-buffer")
  "bn" '(next-buffer :wk "next-buffer")
  "bp" '(previous-buffer :wk "previous-buffer")

  "bH" '(buf-move-left :wk "buffer-move-left")
  "bJ" '(buf-move-down :wk "buffer-move-down")
  "bK" '(buf-move-up :wk "buffer-move-up")
  "bL" '(buf-move-right :wk "buffer-move-right")

  "c" '(:wk "Code")
  "cb" '(cmake-ide-run-cmake :wk "cmake-run-cmake")
  "cc" '(cmake-ide-compile :wk "cmake-compile")
  "cr" '(quickrun :wk "code-quickrun")

  "e" '(treemacs :wk "treemacs")

  "f" '(:wk "File")
  "ff" '(counsel-find-file :wk "find-file")
  "fr" '(counsel-recentf :wk "recent-file")

  "g" '(:wk "Generator")
  "gc" '(comment-region :wk "comment-line")
  "gu" '(uncomment-region :wk "comment-line")

  "h" '(:wk "Help")
  "hr" '(restart-emacs :wk "restart-emacs")

  "l" '(:wk "Language")
  ;; "la" '(lsp-bridge-code-action :wk "code-action")
  "la" '(lsp-ui-code-actions :wk "code-action")
  "le" '(eval-buffer :wk "eval-buffer")
  ;; "lf" '(lsp-bridge-code-format :wk "lsp-bridge-code-format")
  "lf" '(lsp-format-buffer :wk "lsp-format-buffer")
  ;; for lsp-mode
  "l" '(:wk "Goto")
  "ld" '(lsp-find-definition :wk "peek-definition")
  "lh" '(lsp-find-references :wk "peek-references")
  "li" '(lsp-find-implementation :wk "peek-implementation")
  "lr" '(lsp-rename :wk "rename-symbols")
  "ls" '(lsp-ui-peek-find-workspace-symbol :wk "peek-symbols")
  "lD" '(lsp-ui-peek-find-definitions :wk "peek-definition")
  "lH" '(lsp-ui-peek-find-references :wk "peek-references")
  "lI" '(lsp-ui-peek-find-implementation :wk "peek-implementation")

  "lF" '(format-all-buffer :wk "format-all-buffer")

  "m" '(magit :wk "magit")

  "w" '(:wk "Window")
  "wh" '(evil-window-left :wk "window-left")
  "wl" '(evil-window-right :wk "window-right")
  "wk" '(evil-window-up :wk "window-up")
  "wj" '(evil-window-down :wk "window-up")
  "wq" '(evil-window-delete :wk "window-delete")
  "wv" '(evil-window-vsplit :wk "window-vsplit")
  "wh" '(evil-window-split :wk "window-hsplit")

  "wt" '(transwin-toggle :wk "transwin-toggle")

  "p" '(:wk "Project")
  "pc" '(projectile-compile-project :wk "projectile-compile-project")
  "pf" '(projectile-find-file :wk "projectile-find-file")
  "pp" '(open-soulwalker-configuration :wk "personal-config")
  "pr" '(counsel-projectile-rg :wk "projectile-rg")
  "ps" '(counsel-projectile-switch-project :wk "counsel-switch-project")
  "pS" '(set-proxy :wk "set-proxy")
  "pR" '(projectile-replace :wk "projectile-replace")
  "pU" '(unset-proxy :wk "unset-proxy")

  "t" '(:wk "Terminal")
  "tt" '(vterm-other-window :wk "vterm-other-window")
  "tv" '(vterm :wk "vertm-new-window")

  "T" '(lsp-ui-imenu :wk "lsp-ui-imenu")

  "v" '(evil-window-vsplit :wk "window-vsplit")
  "s" '(evil-window-split :wk "window-split")


  )

(provide 'init-general)
;;; init-general.el ends here
