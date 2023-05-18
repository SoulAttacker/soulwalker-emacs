;;; init-eaf.el --- eaf configuration                -*- lexical-binding: t; -*-

;; Copyright (C) 2023  soulwalker

;; Author: soulwalker <soulwalker@soulwalkerdeMac-Studio.local>
;; Keywords: eaf

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

(add-to-list 'load-path "~/tools/emacs-application-framework")

(require 'eaf)
(require 'eaf-music-player)
(require 'eaf-js-video-player)
(require 'eaf-rss-reader)
(require 'eaf-image-viewer)
(require 'eaf-pdf-viewer)
(require 'eaf-browser)
(require 'eaf-markdown-previewer)
(require 'eaf-file-browser)
(require 'eaf-file-manager)
(require 'eaf-mindmap)
(require 'eaf-video-player)
(require 'eaf-org-previewer)
(require 'eaf-netease-cloud-music)
(require 'eaf-system-monitor)
(require 'eaf-markmap)

(provide 'init-eaf)
;;; init-eaf.el ends here
