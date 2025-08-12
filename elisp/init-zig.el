;;; init-zig.el --- zig config                       -*- lexical-binding: t; -*-

;; Copyright (C) 2025  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: zig

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

(require 'zig-mode)
(require 'zig-ts-mode)

(with-eval-after-load 'zig-mode
  (when (treesit-ready-p 'zig)
    (zig-ts-mode)))

(add-hook 'zig-mode-hook
          (lambda ()
            (when (treesit-language-available-p 'zig)
              (when (fboundp 'zig-ts-mode)
                (zig-ts-mode)))))

(setq zig-indent-offset soulwalker-indent-width)

(lazy-load-set-keys
 '(("C-c b" . zig-compile)
   ("C-c r" . zig-run)
   ("C-c t" . zig-test-buffer))
 zig-ts-mode-map)

(provide 'init-zig)
;;; init-zig.el ends here
