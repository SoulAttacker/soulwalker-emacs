;;; init-treesit.el --- treesit config               -*- lexical-binding: t; -*-

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

(require 'treesit)

;; treesit dylib load path
(setq treesit-extra-load-path (list (concat user-emacs-directory "/tree-sitter")))

;; `treesit-install-language-grammar` download library to `treesit-extra-load-path`
(setq treesit--install-language-grammar-out-dir-history treesit-extra-load-path)

;; M-x `treesit-install-language-grammar` to install language grammar.
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
        (markdown . ("https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown/src"))
        (markdown-inline . ("https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown-inline/src"))
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
        ;; (zig . ("https://github.com/GrayJack/tree-sitter-zig"))
        (zig . ("https://github.com/maxxnino/tree-sitter-zig")) ;; but this is deprecated
        (clojure . ("https://github.com/sogaiu/tree-sitter-clojure"))
        (nix . ("https://github.com/nix-community/nix-ts-mode"))
        (qmljs . ("https://github.com/yuja/tree-sitter-qmljs"))
        (mojo . ("https://github.com/HerringtonDarkholme/tree-sitter-mojo"))))

;; mode remap
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
        (clojure-mode    . clojure-ts-mode)
        (markdown-mode   . markdown-ts-mode)
        (yaml-mode       . yaml-ts-mode)
        (go-mode         . go-ts-mode)
        (zig-mode        . zig-ts-mode)
        (qml-mode        . qml-ts-mode)
        ))

(add-hook 'markdown-mode-hook #'(lambda () (treesit-parser-create 'markdown)))
(add-hook 'zig-mode-hook #'(lambda () (treesit-parser-create 'zig)))
(add-hook 'zig-ts-mode-hook #'(lambda () (treesit-parser-create 'zig)))
(add-hook 'emacs-lisp-mode-hook #'(lambda () (treesit-parser-create 'elisp)))
(add-hook 'ielm-mode-hook #'(lambda () (treesit-parser-create 'elisp)))
(add-hook 'json-mode-hook #'(lambda () (treesit-parser-create 'json)))
(add-hook 'go-mode-hook #'(lambda () (treesit-parser-create 'go)))
(add-hook 'java-mode-hook #'(lambda () (treesit-parser-create 'java)))
(add-hook 'java-ts-mode-hook #'(lambda () (treesit-parser-create 'java)))
(add-hook 'php-mode-hook #'(lambda () (treesit-parser-create 'php)))
(add-hook 'php-ts-mode-hook #'(lambda () (treesit-parser-create 'php)))
(add-hook 'qml-mode-hook #'(lambda() (treesit-parser-create 'qmljs)))

(provide 'init-treesit)
;;; init-treesit.el ends here
