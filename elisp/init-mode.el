;;; init-mode.el --- mode config                     -*- lexical-binding: t; -*-

;; Copyright (C) 2025  soulwalker

;; Author: soulwalker
;; Keywords: mode

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

;;; ### auto-mode-alist ###
(defun add-to-alist (alist-var elt-cons &optional no-replace)
  "Add to the value of ALIST-VAR an element ELT-CONS if it isn't there yet.
If an element with the same car as the car of ELT-CONS is already present,
replace it with ELT-CONS unless NO-REPLACE is non-nil; if a matching
element is not already present, add ELT-CONS to the front of the alist.
The test for presence of the car of ELT-CONS is done with `equal'."
  (let ((existing-element (assoc (car elt-cons) (symbol-value alist-var))))
    (if existing-element
        (or no-replace
            (rplacd existing-element (cdr elt-cons)))
      (set alist-var (cons elt-cons (symbol-value alist-var)))))
  (symbol-value alist-var))

(dolist (elt-cons '(
                    ("\\.markdown" . markdown-mode)
                    ("\\.md" . markdown-mode)
                    ("\\.coffee$" . coffee-mode)
                    ("\\.iced$" . coffee-mode)
                    ("Cakefile" . coffee-mode)
                    ("\\.stumpwmrc\\'" . lisp-mode)
                    ("\\.[hg]s\\'" . haskell-mode)
                    ("\\.hi\\'" . haskell-mode)
                    ("\\.hs-boot\\'" . haskell-mode)
                    ("\\.chs\\'" . haskell-mode)
                    ("\\.l[hg]s\\'" . literate-haskell-mode)
                    ("\\.inc\\'" . asm-mode)
                    ("\\.max\\'" . maxima-mode)
                    ("\\.org\\'" . org-mode)
                    ("\\.cron\\(tab\\)?\\'" . crontab-mode)
                    ("cron\\(tab\\)?\\." . crontab-mode)
                    ("\\.a90\\'" . intel-hex-mode)
                    ("\\.hex\\'" . intel-hex-mode)
                    ("\\.py$" . python-mode)
                    ("/\\.php_cs\\(?:\\.dist\\)?\\'" . php-mode)
                    ("\\.\\(?:php\\.inc\\|stub\\)\\'" . php-mode)
                    ("\\.\\(?:php[s345]?\\|phtml\\)\\'" . php-mode-maybe)
                    ("SConstruct". python-mode)
                    ("\\.ml\\'" . tuareg-mode)
                    ("\\.mli\\'" . tuareg-mode)
                    ("\\.mly\\'" . tuareg-mode)
                    ("\\.mll\\'" . tuareg-mode)
                    ("\\.mlp\\'" . tuareg-mode)
                    ("\\.qml\\'" . qml-mode)
                    ("\\.jl\\'" . lisp-mode)
                    ("\\.asdf\\'" . lisp-mode)
                    ("CMakeLists\\.txt\\'" . cmake-mode)
                    ("\\.cmake\\'" . cmake-mode)
                    ("\\.vue" . web-mode)
                    ("\\.wxml" . web-mode)
                    ("\\.phtml\\'" . web-mode)
                    ("\\.jsp\\'" . web-mode)
                    ("\\.as[cp]x\\'" . web-mode)
                    ("\\.erb\\'" . web-mode)
                    ("\\.mustache\\'" . web-mode)
                    ("\\.djhtml\\'" . web-mode)
                    ("\\.html?\\'" . web-mode)
                    ("\\.coffee\\'" . coffee-mode)
                    ("\\.coffee.erb\\'" . coffee-mode)
                    ("\\.js.erb\\'" . js-mode)
                    ("\\.iced\\'" . coffee-mode)
                    ("\\.css\\'" . css-mode)
                    ("\\.wxss\\'" . css-mode)
                    ("Cakefile\\'" . coffee-mode)
                    ("\\.styl$" . sws-mode)
                    ("\\.jade" . jade-mode)
                    ("\\.go$" . go-mode)
                    ("\\.vala$" . vala-mode)
                    ("\\.vapi$" . vala-mode)
                    ("\\.rs$" . rust-mode)
                    ("\\.pro$" . qmake-mode)
                    ("\\.js$" . js-mode)
                    ("\\.wxs$" . js-mode)
                    ("\\.jsx$" . web-mode)
                    ("\\.lua$" . lua-mode)
                    ("\\.swift$" . swift-mode)
                    ("\\.l$" . flex-mode)
                    ("\\.y$" . bison-mode)
                    ("\\.pdf$" . pdf-view-mode)
                    ("\\.ts$" . typescript-ts-mode)
                    ("\\.tsx$" . typescript-ts-mode)
                    ("\\.mts$" . typescript-ts-mode)
                    ("\\.cpp$" . c++-mode)
                    ("\\.cc$" . c++-mode)
                    ("\\.c$" . c-mode)
                    ("\\.h$" . c-mode)
                    ("\\.hh$" . c++-mode)
                    ("\\.hpp$" . c++-mode)
                    ("\\.ll$" . llvm-mode)
                    ("\\.bc$" . hexl-mode)
                    ("\\.nim$" . nim-mode)
                    ("\\.nims$" . nim-mode)
                    ("\\.nimble$" . nim-mode)
                    ("\\.nim.cfg$" . nim-mode)
                    ("\\.exs$" . elixir-mode)
                    ("\\.json$" . json-mode)
                    ("\\.clj$" . clojure-ts-mode)
                    ("\\.dart$" . dart-mode)
                    ("\\.zig$" . zig-mode)
                    ("\\.kt$" . kotlin-mode)
                    ("\\.mojo$" . mojo-mode)
                    ("\\.fs$" . fsharp-mode)
                    ("\\.nix$" . nix-mode)
                    ("\\.sol$" . solidity-mode)
                    ("\\.org$" . org-mode)
                    ("\\.yml$" . yaml-mode)
                    ("\\.yaml$" . yaml-mode)
                    ("\\.typ" . typst-ts-mode)
                    ))
  (add-to-alist 'auto-mode-alist elt-cons))


;;; Mode load.
(autoload 'prog-mode "init-prog-mode")
(autoload 'org-mode "init-org")
(autoload 'cmake-mode "cmake-mode")
(autoload 'markdown-ts-mode "init-markdown")
(autoload 'go-ts-mode "init-go")
(autoload 'rust-ts-mode "init-rust")
(autoload 'python-ts-mode "init-python")
(autoload 'lua-mode "init-lua")
(autoload 'haskell-ts-mode "haskell-mode")
(autoload 'json-mode "json-mode")
(autoload 'c++-ts-mode "init-cc")
(autoload 'c-ts-mode "init-cc")
(autoload 'yaml-mode "init-yaml")
(autoload 'typst-ts-mode "init-typst")

(provide 'init-mode)
;;; init-mode.el ends here
