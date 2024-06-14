;;; init-clojure.el --- clojure configuration        -*- lexical-binding: t; -*-

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


(defun setup-clojure-mode ()
  "Setup clojure-mode."
  (require 'clojure-mode)
  (add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))
  (setup-cider))

(defun setup-cider ()
  "Setup cider."
  (require 'clojure-mode)
  (require 'cider)

  (setq nerpl-pop-statcktraces nil))

(provide 'init-clojure)
;;; init-clojure.el ends here
