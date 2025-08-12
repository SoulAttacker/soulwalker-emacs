;;; init-rust.el --- rust config                     -*- lexical-binding: t; -*-

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

(require 'rust-mode)
(require 'rust-ts-mode)

(setq rust-indent-offset soulwalker-indent-width)

(lazy-load-set-keys
 '(("C-c b" . rust-compile)
   ("C-c r" . rust-run)
   ("C-c t" . rust-test)
   ("C-c k" . rust-check))
 rust-ts-mode-map)

(provide 'init-rust)
;;; init-rust.el ends here
