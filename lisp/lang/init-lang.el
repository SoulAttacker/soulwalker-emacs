;;; init-lang.el --- programming language configuration  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: c

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

(require 'init-markdown)
(require 'init-yasnippet)
(require 'init-prog)
(require 'init-corfu)
(require 'init-python)
(require 'init-cc)
(require 'init-clojure)
(require 'init-quickrun)
(require 'init-elisp)
(require 'init-lsp-bridge)
(require 'init-lsp-mode)

(provide 'init-lang)
;;; init-lang.el ends here
