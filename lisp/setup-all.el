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
(progn
  (setup-basic)
  (setup-basic-ui)
  (setup-path)
  (setup-proxy)
  (setup-all-the-icons)
  (setup-centaur-tabs)
  (setup-dashboard)
  (setup-soulwalker-theme)
  (setup-awesome-tray)
  (setup-evil)
  (setup-evil-collection)
  )


;; prog setup
(add-hook 'prog-mode-hook
          '(lambda ()
             (setup-highlight-indent-guides)
             (setup-format-all)
             (setup-hl-todo)
             (setup-prog-mode)
             (setup-flycheck)
             (setup-elec-pair)
             (setup-rainbow-delimiters)
             (setup-corfu)
             ;; (setup-company)
             (setup-quickrun)
             (setup-yasnippet)
             ;; (setup-lsp-bridge)
             (setup-git-gutter)
             (setup-tempel)
             ))


;; language setup
(progn

  ;; cc setup
  (add-hook 'c-mode #'setup-cc-mode)
  (add-hook 'cc-mode #'setup-cc-mode)
  (add-hook 'c++-mode #'setup-cc-mode)

  ;; elisp setup
  (add-hook 'emacs-lisp-mode #'setup-rainbow-mode)

  ;; latex
  (add-hook 'latex-mode-hook #'setup-xenops)

  ;; markdown
  (require 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.m[M]d[D]\\'" . #'markdown-mode))
  (add-hook 'markdown-mode-hook #'setup-markdown-mode)

  ;; python
  (add-hook 'python-mode-hook (lambda ()
                                (setup-python-mode)
                                (setup-conda)
                                ))

  ;; lsp-mode
  (add-hook 'c-mode-hook #'setup-lsp-mode)
  (add-hook 'c++-mode-hook #'setup-lsp-mode)
  (add-hook 'python-mode-hook #'setup-lsp-mode)
  (add-hook 'go-mode-hook #'setup-lsp-mode)
)

;; tool setup
(add-hook 'after-init-hook
          '(lambda ()
             (setup-auto-save)
             (setup-avy)
             (setup-default-text-scale)
             (setup-general)
             (setup-ivy)
             (setup-swiper)
             (setup-counsel)
             (setup-ivy-rich)
             (setup-all-the-icons-ivy-rich)
             (setup-ivy-posframe)
             (setup-magit)
             (setup-prescient)
             (setup-ivy-prescient)
             (setup-projectile)
             (setup-counsel-projectile)
             (setup-transwin)
             (setup-treemacs)
             (setup-treemacs-evil)
             (setup-vterm)
             (setup-which-key)
             (setup-which-key-posframe)
             (setup-org-mode)
             ))


(provide 'setup-all)
;;; setup-all.el ends here
