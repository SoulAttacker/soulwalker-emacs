;;; init-prog-mode.el --- prog-mode config           -*- lexical-binding: t; -*-

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

(require 'symbol-overlay)
(require 'yasnippet)

;; display line number
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; yasnippet
(add-hook 'prog-mode-hook 'yas-minor-mode)

;; yasnippet-snippets
;; (with-eval-after-load 'yas-minor-mode
;;   (require 'yasnippet-snippets))

;; flycheck
(when (eq soulwalker-static-check-backend 'flycheck)
  (require 'flycheck)
  (setq
   flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list
   flycheck-check-syntax-automatically '(save idle-change mode-enabled)
   flycheck-display-errors-dealy 0.25)

  (define-key flycheck-error-list-mode-map (kbd "C-n") flycheck-error-list-next-erorr)
  (define-key flycheck-error-list-mode-map (kbd "C-p") flycheck-error-list-previous-error)
  (define-key flycheck-error-list-mode-map (kbd "RET") flycheck-error-list-goto-error)

  (add-hook 'prog-mode-hook 'flycheck-mode))

;; flymake
(when (eq soulwalker-static-check-backend 'flymake)
  (require 'flymake)
  (add-hook 'prog-mode-hook 'flymake-mode))

(add-hook 'prog-mode-hook 'symbol-overlay-mode)

(provide 'init-prog-mode)
;;; init-prog-mode.el ends here
