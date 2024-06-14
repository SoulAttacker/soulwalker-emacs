;;; init-funcs.el --- basic functions                -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: functions

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


;; (defun hook-packages
;;     (basic-hook package-mode-hook)
;;   "hook all package-mode-hook to basic-hook"
;;   (dolist (package-mode-hook)
;;     (add-hook 'basic-hook #'package-mode-hook)))

(defun export-org-to-csv (directory export-directory)
  "Export all Org files in the given DIRECTORY to CSV files with the same names, and save them in the EXPORT-DIRECTORY."
  (interactive "DDirectory: \nDExport Directory: ")
  (let ((files (directory-files directory nil "\\.org$")))
    (dolist (file files)
      (let* ((org-filepath (concat (file-name-as-directory directory) file))
             (csv-filename (file-name-sans-extension file))
             (csv-filepath (concat (file-name-as-directory export-directory) csv-filename ".csv")))
        (when (file-regular-p org-filepath)
          (let ((buf (find-file-noselect org-filepath)))
            (with-current-buffer buf
              (save-excursion
                (goto-char (point-min))
                (when (re-search-forward "|.*|\\(\n|.*|\\)*" nil t)
                  (org-table-export csv-filepath "orgtbl-to-csv"))))
            (kill-buffer buf)))))))


(provide 'init-funcs)
;;; init-funcs.el ends here
