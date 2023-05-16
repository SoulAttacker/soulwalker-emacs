;;; init-tree-sitter.el --- tree-sitter configuration  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: tree-sitter

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


(defun setup-tree-sitter ()
  "Setup package: tree-sitter."
  (require 'tree-sitter)
  (require 'tree-sitter-hl)
  (require 'tree-sitter-langs)
  (require 'tree-sitter-debug)
  (require 'tree-sitter-query)
  (add-hook 'python-mode-hook 'tree-sitter-mode)
  (add-hook 'c-mode-hook 'tree-sitter-mode)
  (add-hook 'c++-mode-hook 'tree-sitter-mode)
  (add-hook 'python-mode-hook 'tree-sitter-hl-mode)
  (add-hook 'c-mode-hook 'tree-sitter-hl-mode)
  (add-hook 'c++-mode-hook 'tree-sitter-hl-mode))


(provide 'init-tree-sitter)
;;; init-treesitter.el ends here
