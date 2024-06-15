;;; init-tree-sitter.el --- tree-sitter configuration  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: tree-sitter

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


;; (defun setup-tree-sitter ()
;;   "Setup package: tree-sitter."
;;   (require 'tree-sitter)
;;   (require 'tree-sitter-hl)
;;   (require 'tree-sitter-langs)
;;   (require 'tree-sitter-debug)
;;   (require 'tree-sitter-query)
;;   (add-hook 'python-mode-hook 'tree-sitter-mode)
;;   (add-hook 'c-mode-hook 'tree-sitter-mode)
;;   (add-hook 'c++-mode-hook 'tree-sitter-mode)
;;   (add-hook 'python-mode-hook 'tree-sitter-hl-mode)
;;   (add-hook 'c-mode-hook 'tree-sitter-hl-mode)
;;   (add-hook 'c++-mode-hook 'tree-sitter-hl-mode)
;;   (add-hook 'rust-mode-hook 'tree-sitter-hl-mode)
;;   (add-hook 'lua-mode-hook 'tree-sitter-hl-mode))

(defun setup-cask ()
  "Ssetup package: cask"

  (require 'cask))

(defun setup-tree-sitter ()
  "Setup package: tree-sitter."
  (setup-cask)
    (setq treesit-language-source-alist
        '((bash . ("https://github.com/tree-sitter/tree-sitter-bash"))
            (c . ("https://github.com/tree-sitter/tree-sitter-c"))
            (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp"))
            (css . ("https://github.com/tree-sitter/tree-sitter-css"))
            (cmake . ("https://github.com/uyha/tree-sitter-cmake"))
            (csharp     . ("https://github.com/tree-sitter/tree-sitter-c-sharp.git"))
            (dockerfile . ("https://github.com/camdencheek/tree-sitter-dockerfile"))
            (elisp . ("https://github.com/Wilfred/tree-sitter-elisp"))
            (elixir "https://github.com/elixir-lang/tree-sitter-elixir" "main" "src" nil nil)
            (go . ("https://github.com/tree-sitter/tree-sitter-go"))
            (gomod      . ("https://github.com/camdencheek/tree-sitter-go-mod.git"))
            (haskell "https://github.com/tree-sitter/tree-sitter-haskell" "master" "src" nil nil)
            (html . ("https://github.com/tree-sitter/tree-sitter-html"))
            (java       . ("https://github.com/tree-sitter/tree-sitter-java.git"))
            (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
            (json . ("https://github.com/tree-sitter/tree-sitter-json"))
            (lua . ("https://github.com/Azganoth/tree-sitter-lua"))
            (make . ("https://github.com/alemuller/tree-sitter-make"))
            (markdown . ("https://github.com/MDeiml/tree-sitter-markdown" nil "tree-sitter-markdown/src"))
            (ocaml . ("https://github.com/tree-sitter/tree-sitter-ocaml" nil "ocaml/src"))
            (org . ("https://github.com/milisims/tree-sitter-org"))
            (python . ("https://github.com/tree-sitter/tree-sitter-python"))
            (php . ("https://github.com/tree-sitter/tree-sitter-php"))
            (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "typescript/src"))
            (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "tsx/src"))
            (ruby . ("https://github.com/tree-sitter/tree-sitter-ruby"))
            (rust . ("https://github.com/tree-sitter/tree-sitter-rust"))
            (sql . ("https://github.com/m-novikov/tree-sitter-sql"))
            (scala "https://github.com/tree-sitter/tree-sitter-scala" "master" "src" nil nil)
            (toml "https://github.com/tree-sitter/tree-sitter-toml" "master" "src" nil nil)
            (vue . ("https://github.com/merico-dev/tree-sitter-vue"))
            (kotlin . ("https://github.com/fwcd/tree-sitter-kotlin"))
            (yaml . ("https://github.com/ikatyang/tree-sitter-yaml"))
            (zig . ("https://github.com/GrayJack/tree-sitter-zig"))
            (mojo . ("https://github.com/HerringtonDarkholme/tree-sitter-mojo"))))

    (setq major-mode-remap-alist
      '((c-mode          . c-ts-mode)
        (c++-mode        . c++-ts-mode)
        (cmake-mode      . cmake-ts-mode)
        (conf-toml-mode  . toml-ts-mode)
        (css-mode        . css-ts-mode)
        (js-mode         . js-ts-mode)
        (js-json-mode    . json-ts-mode)
        (python-mode     . python-ts-mode)
        (sh-mode         . bash-ts-mode)
        (typescript-mode . typescript-ts-mode)
        (rust-mode       . rust-ts-mode)
        (java-mode       . java-ts-mode)
        ))

    (add-hook 'web-mode-hook #'(lambda ()
                             (let ((file-name (buffer-file-name)))
                               (when file-name
                                 (treesit-parser-create
                                  (pcase (file-name-extension file-name)
                                    ("vue" 'vue)
                                    ("html" 'html)
                                    ("php" 'php))))
                               )))

    (add-hook 'markdown-mode-hook #'(lambda () (treesit-parser-create 'markdown)))
    (add-hook 'zig-mode-hook #'(lambda () (treesit-parser-create 'zig)))
    (add-hook 'mojo-mode-hook #'(lambda () (treesit-parser-create 'mojo)))
    (add-hook 'emacs-lisp-mode-hook #'(lambda () (treesit-parser-create 'elisp)))
    (add-hook 'ielm-mode-hook #'(lambda () (treesit-parser-create 'elisp)))
    (add-hook 'json-mode-hook #'(lambda () (treesit-parser-create 'json)))
    (add-hook 'go-mode-hook #'(lambda () (treesit-parser-create 'go)))
    (add-hook 'java-mode-hook #'(lambda () (treesit-parser-create 'java)))
    (add-hook 'java-ts-mode-hook #'(lambda () (treesit-parser-create 'java)))
    (add-hook 'php-mode-hook #'(lambda () (treesit-parser-create 'php)))
    (add-hook 'php-ts-mode-hook #'(lambda () (treesit-parser-create 'php)))
    (add-hook 'java-ts-mode-hook #'(lambda () (treesit-parser-create 'java)))
    (add-hook 'haskell-mode-hook #'(lambda () (treesit-parser-create 'haskell)))
    (add-hook 'kotlin-mode-hook #'(lambda () (treesit-parser-create 'kotlin)))
  )


(provide 'init-tree-sitter)
;;; init-treesitter.el ends here
