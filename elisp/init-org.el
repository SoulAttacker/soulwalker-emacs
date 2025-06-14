;;; init-org.el --- org config                       -*- lexical-binding: t; -*-

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

;; vars
(setq
 org-src-preserve-indentation nil
 org-edit-src-content-indent 0
 org-startup-with-inline-images t
 org-hide-emaphasis-markers t
 org-pretty-entities t
 org-confirm-babel-evaluate nil)

;; org-babel
(setq
 org-babel-load-languages '((emacs-lisp . t)
                            (shell . t)
                            (python . t)))

;; org-tempo
(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

;; org-modern
(require 'org-modern)
(setq
 org-modern-fold-stars '(("󰓏" . "▼") ("󰚀" . "▽") ("󰫤" . "⯆") ("󰴈" . "▿") ("󰄄" . "▾"))
 org-modern-list '((?* . "") (?- . "") (?+ . "")))

(setq
 org-modern-keyword
 '(("options" . "") ("title" . "")
   ("author" . "󱆀") ("email" . "")
   ("startup" . "") ("property" . "")
   ("date" . "") ("tags" . "")
   ("reveal" . "󰐩") ("latex" . "") ("latex_header" . "")
   ("logbook" . "log")
   ("todo" . "") (t . t)))

(setq
 org-modern-block-name
 '(("src" . "") ("quote" . ("" ""))
   (t . t)))


(provide 'init-org)
;;; init-org.el ends here
