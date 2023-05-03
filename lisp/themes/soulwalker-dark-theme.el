;;; soulwalker-themes.el --- personal theme based on soulwalker theme  -*- lexical-binding: t; -*-

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

;;


(require 'soulwalker-themes)


;;
;;; Variables

(defgroup soulwalker-dark-theme nil
  "Options for the `soulwalker-theme.el' theme."
  :group 'soulwalker-themes)

(defcustom soulwalker-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'soulwalker-dark-theme
  :type 'boolean)

(defcustom soulwalker-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'soulwalker-dark-theme
  :type 'boolean)

(defcustom soulwalker-dark-comment-bg soulwalker-dark-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'soulwalker-dark-theme
  :type 'boolean)

(defcustom soulwalker-dark-padded-modeline soulwalker-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'soulwalker-dark-theme
  :type '(choice integer boolean))



;;
;;; Theme definition

(def-soulwalker-theme
 soulwalker-dark "A dark theme inspired by lazycat-theme"

 ;; name        default   256       16
 ((bg         '("#060606" nil       nil            ))
  (bg-alt     '("#333333" nil       nil            ))
  (base0      '("#1B2229" "black"   "black"        ))
  (base1      '("#1c1f24" "#1e1e1e" "brightblack"  ))
  (base2      '("#202328" "#2e2e2e" "brightblack"  ))
  (base3      '("#3f444e" "#262626" "brightblack"  ))
  (base4      '("#3f444a" "#3f3f3f" "brightblack"  ))
  (base5      '("#5B6268" "#525252" "brightblack"  ))
  (base6      '("#73797e" "#6b6b6b" "brightblack"  ))
  (base7      '("#9ca0a4" "#979797" "brightblack"  ))
  (base8      '("#DFDFDF" "#dfdfdf" "white"        ))
  (fg         '("#449e48" "#bfbfbf" "brightwhite"  ))
  (fg-alt     '("green4" "#2d2d2d" "white"        ))


  (grey       base4)
  (red        '("#d02b61" "#d02b61" "red"))
  (orange     '("#fd673a" "#dd8411" "brightred"))
  (green      '("#00DD00" "#60aa00" "green"))
  (teal       '("#4db5bd" "#44b9b1" "brightgreen"))
  ;; (yellow     '("#ecbe7b" "#d08928" "yellow"))
  (yellow     '("#f9e076" "#d08928" "yellow"))
  (type-blue  '("#0092ff" "#b0c0ff" "#8cb7ff"))
  (light-blue '("#4adede" "#4adede" "blue"))
  (blue       '("#6c9ef8" "#6c9ef8" "brightblue"))
  (dark-blue  '("#6688aa" "#6688aa" "blue"))
  (magenta    '("#b77fdb" "#b77fdb" "magenta"))
  (violet     '("#a9a1e1" "#a9a1e1" "brightmagenta"))
  (cyan       '("#00aa80" "#00aa80" "brightcyan"))
  (dark-cyan  '("#5699AF" "#5699AF" "cyan"))
  (urlblue    '("#57aadd" "#57aadd" "blue"))

  ;; face categories -- required for all themes
  (highlight      green)
  (vertical-bar   base1)
  (selection      dark-blue)
  (builtin        magenta)
  (comments       (if soulwalker-dark-brighter-comments dark-cyan base6))
  (doc-comments   (soulwalker-lighten (if soulwalker-dark-brighter-comments dark-cyan base6) 0.25))
  (constants      green)
  (functions      orange)
  (keywords       type-blue)
  (methods        teal)
  (operators      blue)
  (type           cyan)
  (strings        yellow)
  (variables      dark-cyan)
  (numbers        green)
  (region         grey)
  (error          red)
  (warning        yellow)
  (success        green)
  (vc-modified    orange)
  (vc-added       green)
  (vc-deleted     red)

  ;; custom categories
  (hidden     `(,(car bg) "black" "black"))
  (-modeline-bright soulwalker-dark-brighter-modeline)
  (-modeline-pad
   (when soulwalker-dark-padded-modeline
     (if (integerp soulwalker-dark-padded-modeline) soulwalker-dark-padded-modeline 4)))

  (modeline-fg     nil)
  (modeline-fg-alt base6)

  (modeline-bg
   (if -modeline-bright
       (soulwalker-darken blue 0.45)
     `(,(soulwalker-darken (car bg-alt) 0.1) ,@(cdr base0))))
  (modeline-bg-alt
   (if -modeline-bright
       (soulwalker-darken blue 0.475)
     `(,(soulwalker-darken (car bg-alt) 0.15) ,@(cdr base0))))
  (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
  (modeline-bg-inactive-alt `(,(soulwalker-darken (car bg-alt) 0.1) ,@(cdr bg-alt))))


  ;;;; Base theme face overrides
 (((font-lock-comment-face &override)
   :background (if soulwalker-dark-comment-bg (soulwalker-lighten bg 0.05))
   :slant 'italic)
  ;; ((font-lock-function-name-face &override) :weight 'bold) ;; not bold yeah!
  ((font-lock-doc-face &override) :slant 'normal)
  (lazy-highlight :background fg :foreground bg :weight 'bold)
  ((line-number &override) :foreground base4)
  ((line-number-current-line &override) :foreground fg :background bg)

  ;; lsp
  (lsp-face-highlight-textual
   (&all   :weight 'bold)
   (&light :background base3 :foreground base0 :distant-foreground base8)
   (&dark  :background (soulwalker-blend highlight bg 0.3) :foreground base8 :distant-foreground base0))
  (lsp-face-highlight-textual :foreground yellow)
  (lsp-face-highlight-read    :inherit 'lsp-face-highlight-textual)
  (lsp-face-highlight-write   :inherit 'lsp-face-highlight-textual)
  (lsp-headerline-breadcrumb-separator-face :inherit 'shadow)

  (mode-line
   :background modeline-bg :foreground modeline-fg
   :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
  (mode-line-inactive
   :background modeline-bg-inactive :foreground modeline-fg-alt
   :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
  (mode-line-emphasis :foreground (if -modeline-bright base8 highlight))
  ((tooltip &override) :background base0)

   ;;;; border
  (ivy-posframe-border :background light-blue :foreground grey)

   ;;;; css-mode <built-in> / scss-mode
  (css-proprietary-property :foreground orange)
  (css-property             :foreground green)
  (css-selector             :foreground blue)
   ;;;; soulwalker-modeline
  (soulwalker-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   ;;;; elscreen
  (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; highlight-escape-sequences
  ((hes-escape-backslash-face &override) :inherit 'normal :foreground red)
  ((hes-escape-sequence-face &override) :inherit 'normal :foreground red)
   ;;;; highlight-numbers
  (highlight-numbers-number :foreground numbers)

   ;;;; ivy
  (ivy-current-match :background base4 :distant-foreground base0 :weight 'normal)
   ;;;; js2-mode
  ((js2-function-param &override) :foreground fg :slant 'italic)
  ((js2-object-property &override) :foreground fg)
   ;;;; markdown-mode
  ((markdown-bold-face &override) :foreground cyan)
  ((markdown-code-face &override) :background (soulwalker-lighten base3 0.05))
  (markdown-header-delimiter-face :inherit 'bold :foreground red)
  (markdown-header-face :inherit 'bold :foreground fg)
  ((markdown-italic-face &override) :foreground cyan)
  ((markdown-link-face &override) :foreground blue)
  ((markdown-list-face &override) :foreground magenta)
  (markdown-markup-face :foreground red)
  ((markdown-url-face &override) :foreground base5)
   ;;;; outline
  ((outline-1 &override) :foreground blue)
  ((outline-2 &override) :foreground magenta)
  ((outline-3 &override) :foreground dark-cyan)
  ((outline-6 &override) :foreground (soulwalker-lighten dark-cyan 0.2))
  ((outline-7 &override) :foreground (soulwalker-lighten blue 0.4))
  ((outline-8 &override) :foreground (soulwalker-lighten magenta 0.4))
   ;;;; org <built-in>
  (org-hide :foreground hidden)
  (org-link :foreground urlblue :underline t)
  ((org-block &override) :background bg-alt)
  ((org-quote &override) :background bg-alt)
  ((org-block-begin-line &override) :foreground comments :background bg)
   ;;;; mic-paren
  ((paren-face-match &override) :foreground blue :background magenta :weight 'ultra-bold)
   ;;;; solaire-mode
  (solaire-mode-line-face
   :inherit 'mode-line
   :background modeline-bg-alt
   :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
  (solaire-mode-line-inactive-face
   :inherit 'mode-line-inactive
   :background modeline-bg-inactive-alt
   :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt)))

   ;;;; swiper
  (swiper-background-match-face-1 :background grey)

   ;;;; highlight-indent-guide
  ;; ((highlight-indent-guides-character-face &override) :foreground blue)

   ;;;; whitespace <built-in>
  ((whitespace-tab &override) :background bg))
  ;;;; Base theme variable overrides-
 ;; ()
 )
