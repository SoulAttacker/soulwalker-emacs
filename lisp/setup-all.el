;;; setup-all.el --- setup all packages              -*- lexical-binding: t; -*-

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

(require 'init-utils)
(require 'init-config)
(require 'init-lang)
(require 'init-tools)

;; basic setup at startup
(setup-basic)
(setup-basic-ui)
(setup-path)
(setup-all-the-icons)
;; (setup-centaur-tabs)
(setup-sort-tab)
(setup-dashboard)
(setup-soulwalker-theme)
(setup-awesome-tray)
(setup-evil)
(setup-evil-collection)


;; prog setup
(setup-highlight-indent-guides)
(setup-format-all)
(setup-hl-todo)
(setup-prog-mode)
(setup-flycheck)
(setup-flymake)
(setup-elec-pair)
(setup-rainbow-delimiters)
(setup-corfu)
(setup-company)
(setup-quickrun)
(setup-yasnippet)
(setup-lsp-bridge)
(setup-git-gutter)
(setup-tempel)


;; language setup
(setup-cc-mode)
(setup-rainbow-mode)
(setup-xenops)
(setup-markdown-mode)
(setup-python-mode)
(setup-conda)
(setup-lsp-mode)
(setup-tree-sitter)
(setup-ts-docstr)

;; tool setup
(setup-auto-save)
(setup-avy)
(setup-default-text-scale)
(setup-general)
(setup-vertico)
(setup-ivy)
(setup-magit)
(setup-prescient)
(setup-ivy-prescient)
(setup-projectile)
(setup-consult-projectile)
(setup-counsel-projectile)
(setup-transwin)
(setup-treemacs)
(setup-treemacs-evil)
(setup-vterm)
(setup-which-key)
(setup-org-mode)
(setup-popper)


(provide 'setup-all)
;;; setup-all.el ends here
