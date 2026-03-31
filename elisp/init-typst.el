;;; init-typst.el --- typst config                   -*- lexical-binding: t; -*-

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

(require 'typst-ts-mode)
(require 'typst-preview)

(setq
 typst-ts-mode-indent-offset soulwalker-indent-width
 typst-ts-mode-watch-options "--open")

;; (add-hook 'typst-ts-mode smartparens-mode)
(add-hook 'typst-ts-mode lsp-bridge-mode)

(setq typst-preview-browser "xwidget"
      typst-preview-invert-colors "yes"
      typst-preview-start-subfile-preview-automatically nil)

(defun soulwalker/save-clipboard-image (file)
  (cond
   ;; macOS
   ((eq system-type 'darwin)
    (call-process "pngpaste" nil nil nil (shell-quote-argument file)))

   ;; Wayland
   ((executable-find "wl-paste")
    (call-process-shell-command
     (format "wl-paste --type image/png > %s" (shell-quote-argument file))))

   ;; X11
   ((executable-find "xclip")
    (call-process-shell-command
     (format "xclip -selection clipboard -t image/png -o > %s" (shell-quote-argument file))))

   (t (error "No clipboard image tool found"))))


(defun soulwalker/typst-next-image-name (dir)
  (unless (file-directory-p dir)
    (make-directory dir t))

  (let* ((files (directory-files dir nil "^img[0-9]+\\.png$"))
         (nums (mapcar (lambda (f)
                         (string-to-number
                          (replace-regexp-in-string "[^0-9]" "" f)))
                       files))
         (next (1+ (or (and nums (apply #'max nums)) 0))))
    (format "img%d.png" next)))

(defun soulwalker/typst-paste-image ()
  "Save image from clipboard and insert it to typst document"
  (interactive)
  (let* ((dir (expand-file-name "images/" (file-name-directory buffer-file-name)))
         (name (soulwalker/typst-next-image-name dir))
         (file (expand-file-name name dir)))

    (soulwalker/save-clipboard-image file)

    (insert
     (format "#image(\"%s\")"
             (file-relative-name file
                                 (file-name-directory buffer-file-name))))))

;; Bind `C-c i` to insert image from clipboard
(with-eval-after-load 'typst-ts-mode (define-key typst-ts-mode-map (kbd "C-c i") #'soulwalker/typst-paste-image))

(provide 'init-typst)
;;; init-typst.el ends here
