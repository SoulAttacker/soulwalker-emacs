;;; init-sort-tab.el --- sort-tab config             -*- lexical-binding: t; -*-

;; Copyright (C) 2025  soulwalker

;; Author: soulwalker
;; Keywords: sort-tab

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

(require 'sort-tab)


(global-set-key (kbd "M-1") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-2") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-3") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-4") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-5") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-6") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-7") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-8") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-9") 'sort-tab-select-visible-tab)
(global-set-key (kbd "M-0") 'sort-tab-select-visible-tab)
(global-set-key (kbd "C-;") 'sort-tab-close-current-tab)

;; hide in dashboard mode
(setq sort-tab-hide-function '(lambda (buf)
                                (with-current-buffer buf (derived-mode-p 'dashboard-mode))))

(sort-tab-mode 1)

(provide 'init-sort-tab)
;;; init-sort-tab.el ends here
