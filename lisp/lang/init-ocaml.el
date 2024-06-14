;;; init-ocaml.el --- ocaml configuration            -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: ocaml

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


(defun setup-ocaml ()
  "Setup ocaml."

  ;; caml-mode
  (add-to-list 'auto-mode-alist '("\\.ml[iylp]?$" . caml-mode))
  (autoload 'caml-mode "caml" "Major mode for editing OCaml code." t)
  (autoload 'run-caml "inf-caml" "Run an inferior OCaml process." t)
  (autoload 'camldebug "camldebug" "Run ocamldebug on program." t)
  (add-to-list 'interpreter-mode-alist '("ocamlrun" . caml-mode))
  (add-to-list 'interpreter-mode-alist '("ocaml" . caml-mode))

  ;; tuareg-mode
  (add-to-list 'auto-mode-alist '("\\.ocamlinit\\'" . tuareg-mode))

  ;; merlin
  (require 'merlin)
  (add-hook 'tuareg-mode-hook #'merlin-mode)
  (setq merlin-error-after-save nil)

  ;; merlin-eldoc
  (require 'merlin-eldoc)
  (add-hook 'tuareg-mode-hook #'merlin-eldoc-setup)

  ;; utop
  (require 'utop)
  (setq utop-command "opam exec -- utop -emacs")

  )

(provide 'init-ocaml)
;;; init-ocmal.el ends here
