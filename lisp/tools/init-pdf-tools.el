;;; init-pdf-tools.el --- pdf-tools configuration    -*- lexical-binding: t; -*-

;; Copyright (C) 2024  soulwalker

;; Author: soulwalker <soulwalker@192.168.0.100>
;; Keywords: pdf-tools

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

(defun setup-pdf-tools ()
  "setup pdf-tools"
  (require 'pdf-tools)
  (pdf-tools-install)
  (define-key pdf-view-mode-map (kbd "g" 'pdf-view-first-page))
  (define-key pdf-view-mode-map (kbd "G" 'pdf-view-last-page))
  (define-key pdf-view-mode-map (kbd "l" 'image-forward-hscroll))
  (define-key pdf-view-mode-map (kbd "h" 'image-backward-hscroll))
  (define-key pdf-view-mode-map (kbd "j" 'pdf-view-next-page))
  (define-key pdf-view-mode-map (kbd "k" 'pdf-view-previous-page))
  (define-key pdf-view-mode-map (kbd "e" 'pdf-view-goto-page))
  (define-key pdf-view-mode-map (kbd "u" 'pdf-view-revert-buffer))
  (define-key pdf-view-mode-map (kbd "al" 'pdf-annot-list-annotations)))


(provide 'init-pdf-tools)
;;; init-pdf-tools.el ends here
