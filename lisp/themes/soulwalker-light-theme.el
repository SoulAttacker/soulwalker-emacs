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

(defgroup soulwalker-light-theme nil
  "Options for the `soulwalker-theme.el' theme."
  :group 'soulwalker-themes)

(defcustom soulwalker-light-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'soulwalker-light-theme
  :type 'boolean)

(defcustom soulwalker-light-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'soulwalker-light-theme
  :type 'boolean)

(defcustom soulwalker-light-comment-bg soulwalker-dark-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'soulwalker-light-theme
  :type 'boolean)

(defcustom soulwalker-light-padded-modeline soulwalker-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'soulwalker-light-theme
  :type '(choice integer boolean))



;;
;;; Theme definition

(def-soulwalker-theme
 soulwalker-dark "A dark theme inspired by lazycat-theme"

 ;; name        default   256       16
 ((bg        '("#040404" nil       nil            ))
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
  (fg         '("#0ac30a" "#bfbfbf" "brightwhite"  ))
  (fg-darker  '("#449e48" "#bfbfbf" "brightwhite"  ))
  (fg-alt     '("green4" "#2d2d2d" "white"        ))

  ((bg          "#fff7f7")
   (bg-alt      "#efe7e7")
   (fg          "#201f36")
   (fg-alt      "#af4988")
   (base1       "")


   (red             "#b00234")
   (red-warmer      "#e00033")
   (red-cooler      "#d5305f")
   (red-faint       "#af3f5f")
   (green           "#217a3c")
   (green-warmer    "#4a7d00")
   (green-cooler    "#008358")
   (green-faint     "#61756c")
   (yellow          "#9a6012")
   (yellow-warmer   "#b6530f")
   (yellow-cooler   "#a04646")
   (yellow-faint    "#a65d6a")
   (blue            "#3c3bbe")
   (blue-warmer     "#4250ef")
   (blue-cooler     "#065fff")
   (blue-faint      "#6060d0")
   (magenta         "#a01f64")
   (magenta-warmer  "#9f248a")
   (magenta-cooler  "#7022bf")
   (magenta-faint   "#954f90")
   (cyan            "#2f5f9f")
   (cyan-warmer     "#3f6faf")
   (cyan-cooler     "#1077ab")
   (cyan-faint      "#506fa0")

   (bg-red-intense     "#ff8f88")
   (bg-green-intense   "#8adf80")
   (bg-yellow-intense  "#fac200")
   (bg-blue-intense    "#cbcfff")
   (bg-magenta-intense "#df8fff")
   (bg-cyan-intense    "#88c8ff")

   (bg-red-subtle      "#ffcfbf")
   (bg-green-subtle    "#b3fabf")
   (bg-yellow-subtle   "#fff576")
   (bg-blue-subtle     "#ccdfff")
   (bg-magenta-subtle  "#ffddff")
   (bg-cyan-subtle     "#bfefff")


   (bg-added          "#c2efcf")
   (bg-added-faint    "#e0f3e0")
   (bg-added-refine   "#bae0c8")
   (fg-added          "#005000")

   (bg-changed        "#ffe5b9")
   (bg-changed-faint  "#ffefc5")
   (bg-changed-refine "#ffd09f")
   (fg-changed        "#553d00")

   (bg-removed        "#ffcfda")
   (bg-removed-faint  "#ffe3e3")
   (bg-removed-refine "#ffb9c9")
   (fg-removed        "#8f1313")


   (bg-graph-red-0     "#ef7969")
   (bg-graph-red-1     "#ffaab4")
   (bg-graph-green-0   "#2fe029")
   (bg-graph-green-1   "#75ef30")
   (bg-graph-yellow-0  "#ffcf00")
   (bg-graph-yellow-1  "#f9ff00")
   (bg-graph-blue-0    "#7f90ff")
   (bg-graph-blue-1    "#9fc6ff")
   (bg-graph-magenta-0 "#e07fff")
   (bg-graph-magenta-1 "#fad0ff")
   (bg-graph-cyan-0    "#70d3f0")
   (bg-graph-cyan-1    "#afefff")

;;; Special hues

   (bg-mode-line       "#e0bfba")
   (fg-mode-line       "#151515")
   (bg-completion      "#f2d5c9")
   (bg-hover           "#c0d0ff")
   (bg-hover-secondary "#efd5ff")
   (bg-hl-line         "#f2e5d9")
   (bg-region          "#dfe4f4")
   (bg-paren           "#b0dffa")
   (bg-err             "#ffdde5") ; check with err
   (bg-warning         "#ffe0aa") ; check with warning
   (bg-info            "#ddf5cc") ; check with info

   (border        "#bab7bc")
   (cursor        "#d06f30")
   (fg-intense    "#000000")

   (modeline-err     "#9f0000")
   (modeline-warning "#5f0070")
   (modeline-info    "#002fa0")

   (underline-err     "#ef0f1f")
   (underline-warning "#bf5f00")
   (underline-info    "#02af52")

   (bg-char-0 "#7feaff")
   (bg-char-1 "#ffaaff")
   (bg-char-2 "#dff000")


   (bg-region-intense "#f0c0f0")


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
   (variables      sea-green)
   (numbers        green)
   (region         bg-region)
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
   ((paren-face-match &override) :background base5 :weight 'ultra-bold)
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
