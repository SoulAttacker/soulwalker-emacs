;;; init-org.el --- org configuration                -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: org

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

(defun setup-org-bullets ()
  "Setup org-bullets."
  (require 'org-bullets)
  (add-hook 'org-mode-hook 'org-bullets-mode))

(defun setup-org-superstar ()
  "Setup org-superstar."
  (require 'org-superstar)
  (setq org-superstar-remove-leading-stars t
        org-superstar-headline-bullets-list '("◉" ("🞛" ?◈) "○" "▷")
        org-hiddien-keywords '(title))

  (set-face-attribute 'org-level-8 nil :weight 'bold :inherit 'default)
  ;; Low levels are unimportant => no scaling
  (set-face-attribute 'org-level-7 nil :inherit 'org-level-8)
  (set-face-attribute 'org-level-6 nil :inherit 'org-level-8)
  (set-face-attribute 'org-level-5 nil :inherit 'org-level-8)
  (set-face-attribute 'org-level-4 nil :inherit 'org-level-8)
  ;; Top ones get scaled the same as in LaTeX (\large, \Large, \LARGE)
  (set-face-attribute 'org-level-3 nil :inherit 'org-level-8 :height 1.2) ;\large
  (set-face-attribute 'org-level-2 nil :inherit 'org-level-8 :height 1.44) ;\Large
  (set-face-attribute 'org-level-1 nil :inherit 'org-level-8 :height 1.728) ;\LARGE
  (add-hook 'org-mode-hook 'org-superstar-mode))

(defun setup-toc-org ()
  "Setup toc-org."
  (require 'toc-org)
  (add-to-list 'org-tag-alist '("TOC" . ?T))
  (add-hook 'org-mode-hook 'toc-org-mode))

(defun setup-org-mode ()
  "Setup org-mode."
  ;; code indent, inline image
  (setq org-src-preserve-indentation nil
        org-edit-src-content-indentation 0
        org-startup-with-inline-images t
        org-hide-emphasis-markers t
        org-pretty-entities t
        org-confirm-babel-evaluate nil)

  ;; org-babel
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (shell . t)
     (python . t)))

  ;; short alist
  (require 'org-tempo)
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python"))

  ;; other plugin
  (setup-org-bullets)
  (setup-org-superstar)
  (setup-toc-org))


(provide 'init-org)
;;; init-org.el ends here
