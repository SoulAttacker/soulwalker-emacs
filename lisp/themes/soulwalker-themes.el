;;; soulwalker-themes.el --- personal theme based on doom-theme and lazycat-theme -*- lexical-binding: t; -*-

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


(require 'cl-lib)

(defvar soulwalker-themes-base-faces
  '((bold        :weight 'bold :foreground (if bold 'unspecified base8))
    (bold-italic :inherit '(bold italic))
    (italic      :slant  'italic)
    (escape-glyph :foreground cyan)
    (default :background bg :foreground fg)
    (fringe  :inherit 'default :foreground base4)
    (region               :background region :distant-foreground (soulwalker-darken fg 0.2) :extend t)
    (highlight            :background highlight :foreground base0 :distant-foreground base8)
    (cursor               :background highlight)
    (shadow               :foreground base5)
    (minibuffer-prompt    :foreground highlight)
    (tooltip              :background bg-alt :foreground fg)
    (secondary-selection  :background grey :extend t)
    (lazy-highlight
     (&dark  :background (soulwalker-darken highlight 0.3)   :foreground base8 :distant-foreground base0 :weight 'bold)
     (&light :background (soulwalker-blend bg highlight 0.7) :foreground base0 :distant-foreground base8))
    (match                :foreground green      :background base0 :weight 'bold)
    (trailing-whitespace  :background red)
    (nobreak-space        :inherit 'escape-glyph :underline t)
    (vertical-border      :background vertical-bar :foreground vertical-bar)
    (link                 :foreground highlight :underline t :weight 'bold)
    (error   :foreground error)
    (warning :foreground warning)
    (success :foreground success)
    ;;;; font-lock-* faces
    (font-lock-builtin-face              :foreground builtin)
    (font-lock-comment-face              :foreground comments)
    (font-lock-comment-delimiter-face    :inherit 'font-lock-comment-face)
    (font-lock-doc-face                  :inherit 'font-lock-comment-face :foreground doc-comments)
    (font-lock-constant-face             :foreground constants)
    (font-lock-function-name-face        :foreground functions)
    (font-lock-keyword-face              :foreground keywords)
    (font-lock-string-face               :foreground strings)
    (font-lock-type-face                 :foreground type)
    (font-lock-variable-name-face        :foreground variables)
    (font-lock-warning-face              :inherit 'warning)
    (font-lock-negation-char-face        :inherit 'bold :foreground operators)
    (font-lock-preprocessor-face         :inherit 'bold :foreground operators)
    (font-lock-preprocessor-char-face    :inherit 'bold :foreground operators)
    (font-lock-regexp-grouping-backslash :inherit 'bold :foreground operators)
    (font-lock-regexp-grouping-construct :inherit 'bold :foreground operators)
    ;;;; mode-line / header-line
    (mode-line           :background bg     :foreground fg     :distant-foreground bg)
    (mode-line-active    :inherit 'mode-line)
    (mode-line-inactive  :background bg-alt :foreground fg-alt :distant-foreground bg-alt)
    (mode-line-emphasis  :foreground highlight :distant-foreground bg)
    (mode-line-highlight :inherit 'highlight :distant-foreground bg)
    (mode-line-buffer-id :weight 'bold)
    (header-line :inherit 'mode-line)
    (header-line-highlight :inherit 'mode-line-highlight)
    ;;;; tab-line/tab-bar (Emacs 27+)
    ;; (tab-line :background bg-alt :foreground bg-alt)
    (tab-line :background base0 :foreground base0)
    (tab-line-tab :background bg :foreground fg)
    (tab-line-tab-inactive :inherit 'tab-line-tab :background bg-alt :foreground fg-alt)
    (tab-line-tab-inactive-alternate :inherit 'tab-line-tab-inactive)
    (tab-line-tab-current :background bg :foreground fg)
    ;; (tab-line-special )
    (tab-line-highlight :inherit 'tab-line-tab)
    (tab-line-close-highlight :foreground highlight)
    ((tab-bar &inherit tab-line))
    ((tab-bar-tab &inherit tab-line-tab))
    ((tab-bar-tab-inactive &inherit tab-line-tab-inactive))
    ;;;; Line numbers
    ;; 1. Line number faces must explicitly disable its text style attributes
    ;;    because nearby faces may "bleed" into the line numbers otherwise.
    ;; 2. All other line number plugin faces should &inherit from these.
    (line-number
     :inherit 'default
     :foreground base5 :distant-foreground 'unspecified
     :weight 'normal :italic 'unspecified
     :underline 'unspecified :strike-through 'unspecified)
    (line-number-current-line
     :inherit '(hl-line default)
     :foreground fg :distant-foreground 'unspecified
     :weight 'normal :italic 'unspecified
     :underline 'unspecified :strike-through 'unspecified)

    ;;;; --- Package faces ----------------------
    ;; What follows are faces for all the packages soulwalker-themes explicitly
    ;; supports. Headings are formatted as such:
    ;;
    ;;   PACKAGE [<built-in>] [<modes:some-mode[, ...]>]
    ;;
    ;; The purpose of this is to make it easy to jump to via `imenu', or search
    ;; for with isearch, swiper, etc.
    ;;;; auctex <modes:latex-mode>
    (font-latex-bold-face         :inherit 'bold)
    (font-latex-italic-face       :inherit 'italic)
    (font-latex-math-face         :foreground blue)
    (font-latex-sectioning-0-face :foreground blue    :weight 'ultra-bold)
    (font-latex-sectioning-1-face :foreground magenta :weight 'semi-bold)
    (font-latex-sectioning-2-face :foreground violet  :weight 'semi-bold)
    (font-latex-sectioning-3-face :foreground (soulwalker-lighten blue 0.3)    :weight 'semi-bold)
    (font-latex-sectioning-4-face :foreground (soulwalker-lighten magenta 0.3) :weight 'semi-bold)
    (font-latex-sectioning-5-face :foreground (soulwalker-lighten violet 0.3)  :weight 'semi-bold)
    (font-latex-script-char-face  :foreground dark-blue)
    (font-latex-string-face       :inherit 'font-lock-string-face)
    (font-latex-warning-face      :inherit 'font-lock-warning-face)
    (font-latex-verbatim-face     :inherit 'fixed-pitch :foreground violet :slant 'italic)
    (TeX-error-description-error    :inherit 'error   :weight 'bold)
    (TeX-error-description-warning  :inherit 'warning :weight 'bold)
    (TeX-error-description-tex-said :inherit 'success :weight 'bold)
    ;;;; alert
    (alert-high-face         :inherit bold :foreground warning)
    (alert-low-face          :foreground grey)
    (alert-moderate-face     :inherit bold :foreground fg-alt)
    (alert-trivial-face      :foreground doc-comments)
    (alert-urgent-face       :inherit bold :foreground error)
    ;;;; all-the-icons
    (all-the-icons-blue       :foreground blue)
    (all-the-icons-blue-alt   :foreground teal)
    (all-the-icons-cyan       :foreground cyan)
    (all-the-icons-cyan-alt   :foreground cyan)
    (all-the-icons-dblue      :foreground dark-blue)
    (all-the-icons-dcyan      :foreground dark-cyan)
    (all-the-icons-dgreen     :foreground (soulwalker-darken green 0.3))
    (all-the-icons-dmaroon    :foreground (soulwalker-darken magenta 0.3))
    (all-the-icons-dorange    :foreground (soulwalker-darken orange 0.3))
    (all-the-icons-dpink      :foreground (soulwalker-lighten red 0.15))
    (all-the-icons-dpurple    :foreground (soulwalker-darken violet 0.3))
    (all-the-icons-dred       :foreground (soulwalker-darken red 0.3))
    (all-the-icons-dsilver    :foreground (soulwalker-lighten grey 0.1))
    (all-the-icons-dyellow    :foreground (soulwalker-darken yellow 0.3))
    (all-the-icons-green      :foreground green)
    (all-the-icons-lblue      :foreground (soulwalker-lighten blue 0.3))
    (all-the-icons-lcyan      :foreground (soulwalker-lighten cyan 0.3))
    (all-the-icons-lgreen     :foreground (soulwalker-lighten green 0.3))
    (all-the-icons-lmaroon    :foreground (soulwalker-lighten magenta 0.3))
    (all-the-icons-lorange    :foreground (soulwalker-lighten orange 0.3))
    (all-the-icons-lpink      :foreground (soulwalker-lighten red 0.55))
    (all-the-icons-lpurple    :foreground (soulwalker-lighten violet 0.3))
    (all-the-icons-lred       :foreground (soulwalker-lighten red 0.3))
    (all-the-icons-lsilver    :foreground (soulwalker-lighten grey 0.7))
    (all-the-icons-lyellow    :foreground (soulwalker-lighten yellow 0.3))
    (all-the-icons-maroon     :foreground magenta)
    (all-the-icons-orange     :foreground orange)
    (all-the-icons-pink       :foreground (soulwalker-lighten red 0.35))
    (all-the-icons-purple     :foreground violet)
    (all-the-icons-purple-alt :foreground (soulwalker-blend violet grey 0.15))
    (all-the-icons-red        :foreground red)
    (all-the-icons-red-alt    :foreground (soulwalker-blend red grey 0.15))
    (all-the-icons-silver     :foreground (soulwalker-lighten grey 0.45))
    (all-the-icons-yellow     :foreground yellow)
    ;;;; all-the-icons-dired
    (all-the-icons-dired-dir-face    :foreground doc-comments)
    ;;;; ansi-color <built-in>
    (ansi-color-black          :foreground bg      :background bg)
    (ansi-color-red            :foreground red     :background red)
    (ansi-color-green          :foreground green   :background green)
    (ansi-color-yellow         :foreground yellow  :background yellow)
    (ansi-color-blue           :foreground blue    :background blue)
    (ansi-color-magenta        :foreground magenta :background magenta)
    (ansi-color-cyan           :foreground cyan    :background cyan)
    (ansi-color-white          :foreground fg      :background fg)
    (ansi-color-bright-black   :foreground base0   :background base2)
    (ansi-color-bright-red     :foreground (soulwalker-lighten red 0.15)     :background (soulwalker-lighten red 0.15))
    (ansi-color-bright-green   :foreground (soulwalker-lighten green 0.15)   :background (soulwalker-lighten green 0.15))
    (ansi-color-bright-yellow  :foreground (soulwalker-lighten yellow 0.15)  :background (soulwalker-lighten yellow 0.15))
    (ansi-color-bright-blue    :foreground (soulwalker-lighten blue 0.15)    :background (soulwalker-lighten blue 0.15))
    (ansi-color-bright-magenta :foreground (soulwalker-lighten magenta 0.15) :background (soulwalker-lighten magenta 0.15))
    (ansi-color-bright-cyan    :foreground (soulwalker-lighten cyan 0.15)    :background (soulwalker-lighten cyan 0.15))
    (ansi-color-bright-white   :foreground base8   :background base8)
    ;;;; avy
    (avy-background-face :foreground comments)
    (avy-lead-face :background highlight :foreground bg :distant-foreground fg :weight 'bold)
    (avy-lead-face-0
     (&all   :inherit 'avy-lead-face)
     (&dark  :background (soulwalker-lighten highlight 0.3))
     (&light :background (soulwalker-darken highlight 0.3)))
    (avy-lead-face-1
     (&all   :inherit 'avy-lead-face)
     (&dark  :background (soulwalker-lighten highlight 0.6))
     (&light :background (soulwalker-darken highlight 0.6)))
    (avy-lead-face-2
     (&all   :inherit 'avy-lead-face)
     (&dark  :background (soulwalker-lighten highlight 0.9))
     (&light :background (soulwalker-darken highlight 0.9)))
    ;;;; bookmark
    (bookmark-face :background (soulwalker-blend highlight bg 0.1) :extend t)
    ;;;; bookmark+
    (bmkp-*-mark :foreground bg :background yellow)
    (bmkp->-mark :foreground yellow)
    (bmkp-D-mark :foreground bg :background red)
    (bmkp-X-mark :foreground red)
    (bmkp-a-mark :background red)
    (bmkp-bad-bookmark :foreground bg :background yellow)
    (bmkp-bookmark-file :foreground violet :background bg-alt)
    (bmkp-bookmark-list :background bg-alt)
    (bmkp-buffer :foreground blue)
    (bmkp-desktop :foreground bg :background violet)
    (bmkp-file-handler :background red)
    (bmkp-function :foreground green)
    (bmkp-gnus :foreground orange)
    (bmkp-heading :foreground yellow)
    (bmkp-info :foreground cyan)
    (bmkp-light-autonamed :foreground bg-alt :background cyan)
    (bmkp-light-autonamed-region :foreground bg-alt :background red)
    (bmkp-light-fringe-autonamed :foreground bg-alt :background violet)
    (bmkp-light-fringe-non-autonamed :foreground bg-alt :background green)
    (bmkp-light-mark :foreground bg :background cyan)
    (bmkp-light-non-autonamed :foreground bg :background violet)
    (bmkp-light-non-autonamed-region :foreground bg :background red)
    (bmkp-local-directory :foreground bg :background violet)
    (bmkp-local-file-with-region :foreground yellow)
    (bmkp-local-file-without-region :foreground comments)
    (bmkp-man :foreground violet)
    (bmkp-no-jump :foreground comments)
    (bmkp-no-local :foreground yellow)
    (bmkp-non-file :foreground green)
    (bmkp-remote-file :foreground orange)
    (bmkp-sequence :foreground blue)
    (bmkp-su-or-sudo :foreground red)
    (bmkp-t-mark :foreground violet)
    (bmkp-url :foreground blue :underline t)
    (bmkp-variable-list :foreground green)
    ;;;; centaur-tabs
    ((centaur-tabs-default &inherit tab-bar) :box nil)
    ((centaur-tabs-selected &inherit tab-bar-tab) :box nil)
    ((centaur-tabs-unselected &inherit tab-bar-tab-inactive) :box nil)
    (centaur-tabs-selected-modified   :background bg :foreground teal)
    (centaur-tabs-unselected-modified :background bg-alt :foreground teal)
    (centaur-tabs-active-bar-face :background (if (bound-and-true-p -modeline-bright) modeline-bg highlight))
    (centaur-tabs-modified-marker-selected
     :foreground (if (bound-and-true-p -modeline-bright) modeline-bg highlight)
     :inherit 'centaur-tabs-selected)
    (centaur-tabs-modified-marker-unselected
     :foreground (if (bound-and-true-p -modeline-bright) modeline-bg highlight)
     :inherit 'centaur-tabs-unselected)
    ;;;; company
    (company-tooltip            :inherit 'tooltip)
    (company-tooltip-common                           :foreground highlight :distant-foreground base0 :weight 'bold)
    (company-tooltip-search     :background highlight :foreground bg :distant-foreground fg :weight 'bold)
    (company-tooltip-search-selection :background (soulwalker-darken selection 0.25))
    (company-tooltip-selection  :background selection :weight 'bold)
    (company-tooltip-mouse      :background magenta   :foreground bg :distant-foreground fg)
    (company-tooltip-annotation                       :foreground violet :distant-foreground bg)
    (company-scrollbar-bg       :inherit 'tooltip)
    (company-scrollbar-fg       :background highlight)
    (company-preview                              :foreground comments)
    (company-preview-common     :background base3 :foreground highlight)
    (company-preview-search     :inherit 'company-tooltip-search)
    (company-template-field     :inherit 'match)
    ;;;; company-box
    (company-box-candidate :foreground fg)
    ;;;; corfu
    (corfu-default :inherit 'tooltip)
    (corfu-current :background bg :foreground fg)
    ;;;; cperl <built-in>
    (cperl-array-face          :weight 'bold :inherit 'font-lock-variable-name-face)
    (cperl-hash-face           :weight 'bold :slant 'italic :inherit 'font-lock-variable-name-face)
    (cperl-nonoverridable-face :inherit 'font-lock-builtin-face)
    ;;;; compilation <built-in>
    (compilation-column-number  :inherit 'font-lock-comment-face)
    (compilation-line-number    :foreground highlight)
    (compilation-error   :inherit 'error   :weight 'bold)
    (compilation-warning :inherit 'warning :slant 'italic)
    (compilation-info    :inherit 'success)
    (compilation-mode-line-exit :inherit 'compilation-info)
    (compilation-mode-line-fail :inherit 'compilation-error)
    ;;;; custom <built-in>
    (custom-button                  :foreground blue   :background bg     :box '(:line-width 1 :style none))
    (custom-button-unraised         :foreground violet :background bg     :box '(:line-width 1 :style none))
    (custom-button-pressed-unraised :foreground bg     :background violet :box '(:line-width 1 :style none))
    (custom-button-pressed          :foreground bg     :background blue   :box '(:line-width 1 :style none))
    (custom-button-mouse            :foreground bg     :background blue   :box '(:line-width 1 :style none))
    (custom-variable-button         :foreground green  :underline t)
    (custom-saved                   :foreground green  :background (soulwalker-blend green bg 0.2) :bold bold)
    (custom-comment                 :foreground fg     :background region)
    (custom-comment-tag             :foreground grey)
    (custom-modified                :foreground blue   :background (soulwalker-blend blue bg 0.2))
    (custom-variable-tag            :foreground magenta)
    (custom-visibility              :foreground blue   :underline 'unspecified)
    (custom-group-subtitle          :foreground red)
    (custom-group-tag               :foreground violet)
    (custom-group-tag-1             :foreground blue)
    (custom-set                     :foreground yellow :background bg)
    (custom-themed                  :foreground yellow :background bg)
    (custom-invalid                 :foreground red    :background (soulwalker-blend red bg 0.2))
    (custom-variable-obsolete       :foreground grey   :background bg)
    (custom-state                   :foreground green  :background (soulwalker-blend green bg 0.2))
    (custom-changed                 :foreground blue   :background bg)
    (cider-debug-code-overlay-face :background base3)
    (cider-enlightened-face
     :inherit 'cider-result-overlay-face :box `(:color ,orange :line-width -1))
    (cider-enlightened-local-face :foreground orange :weight 'bold)
    (cider-result-overlay-face :background base3 :box `(:line-width -1 :color base5))
    (cider-fringe-good-face    :foreground green)
    (cider-deprecated-face     :background (soulwalker-blend bg yellow 0.8))
    (cider-instrumented-face   :background (soulwalker-blend bg red 0.8))
    (cider-traced-face         :background (soulwalker-blend bg cyan 0.8))
    (cider-error-highlight-face
     `((((supports :underline (:style wave)))
        (:inherit unspecified :underline (:style wave :color ,(car error))))
       (t (:inherit font-lock-warning-face :underline t))))
    (cider-warning-highlight-face
     `((((supports :underline (:style wave)))
        (:underline (:style wave :color ,(car warning)) :inherit unspecified))
       (t (:inherit font-lock-warning-face :underline (:color ,(car warning))))))
    (cider-test-failure-face :background (soulwalker-blend bg error 0.7))
    (cider-test-error-face   :background orange)
    (cider-test-success-face
     (&light :foreground base0 :background green)
     (&dark  :foreground green :background base0))
    ;;;; diff-hl
    (diff-hl-change :foreground vc-modified :background vc-modified)
    (diff-hl-delete :foreground vc-deleted :background vc-deleted)
    (diff-hl-insert :foreground vc-added :background vc-added)
    ;;;; diff-mode <built-in>
    (diff-added   :inherit 'hl-line :foreground green)
    (diff-changed :foreground violet)
    (diff-context
     (&dark  :foreground (soulwalker-darken fg 0.12))
     (&light :foreground (soulwalker-lighten fg 0.12)))
    (diff-removed :foreground red :background base3)
    (diff-header  :foreground cyan)
    (diff-file-header :foreground blue)
    (diff-hunk-header :foreground violet)
    (diff-refine-added   :inherit 'diff-added :inverse-video t)
    (diff-refine-changed :inherit 'diff-changed :inverse-video t)
    (diff-refine-removed :inherit 'diff-removed :inverse-video t)
    ;;;; dired <built-in>
    (dired-directory  :foreground builtin)
    (dired-ignored    :foreground comments)
    (dired-flagged    :foreground red)
    (dired-header     :foreground blue :weight 'bold)
    (dired-mark       :foreground orange :weight 'bold)
    (dired-marked     :foreground magenta :weight 'bold :inverse-video t)
    (dired-perm-write :foreground fg :underline t)
    (dired-symlink    :foreground cyan :weight 'bold)
    (dired-warning    :foreground warning)
    ;;;; soulwalker-modeline
    (soulwalker-modeline-eldoc-bar :background green)
    (soulwalker-modeline-bar-inactive) ; transparent
    ;;;; ediff <built-in>
    (ediff-fine-diff-A    :background (soulwalker-blend selection bg 0.7) :weight 'bold :extend t)
    (ediff-fine-diff-B    :inherit 'ediff-fine-diff-A)
    (ediff-fine-diff-C    :inherit 'ediff-fine-diff-A)
    (ediff-current-diff-A :background (soulwalker-blend selection bg 0.3) :extend t)
    (ediff-current-diff-B :inherit 'ediff-current-diff-A)
    (ediff-current-diff-C :inherit 'ediff-current-diff-A)
    (ediff-even-diff-A    :inherit 'hl-line)
    (ediff-even-diff-B    :inherit 'ediff-even-diff-A)
    (ediff-even-diff-C    :inherit 'ediff-even-diff-A)
    (ediff-odd-diff-A     :inherit 'ediff-even-diff-A)
    (ediff-odd-diff-B     :inherit 'ediff-odd-diff-A)
    (ediff-odd-diff-C     :inherit 'ediff-odd-diff-A)
    ;;;; embark
    ((embark-target &inherit vertico-current))
    ;;;; erc <built-in>
    (erc-button :weight 'bold :underline t)
    (erc-default-face :inherit 'default)
    (erc-action-face  :weight 'bold)
    (erc-command-indicator-face :weight 'bold)
    (erc-direct-msg-face :foreground magenta)
    (erc-error-face :inherit 'error)
    (erc-header-line :background (soulwalker-darken bg-alt 0.15) :foreground highlight)
    (erc-input-face :foreground green)
    (erc-current-nick-face :foreground green :weight 'bold)
    (erc-timestamp-face :foreground blue :weight 'bold)
    (erc-nick-default-face :weight 'bold)
    (erc-nick-msg-face :foreground magenta)
    (erc-nick-prefix-face :inherit 'erc-nick-default-face)
    (erc-my-nick-face :foreground green :weight 'bold)
    (erc-my-nick-prefix-face :inherit 'erc-my-nick-face)
    (erc-notice-face :foreground comments)
    (erc-prompt-face :foreground highlight :weight 'bold)
    ;;;; eshell <built-in>
    (eshell-prompt        :foreground highlight :weight 'bold)
    (eshell-ls-archive    :foreground magenta)
    (eshell-ls-backup     :foreground yellow)
    (eshell-ls-clutter    :foreground red)
    (eshell-ls-directory  :foreground blue)
    (eshell-ls-executable :foreground green)
    (eshell-ls-missing    :foreground red)
    (eshell-ls-product    :foreground orange)
    (eshell-ls-readonly   :foreground orange)
    (eshell-ls-special    :foreground violet)
    (eshell-ls-symlink    :foreground cyan)
    (eshell-ls-unreadable :foreground base5)
    ;;;; evil
    (evil-ex-info                   :foreground error :slant 'italic)
    (evil-ex-search                 :background highlight :foreground base0 :weight 'bold)
    (evil-ex-substitute-matches     :background base0     :foreground red   :weight 'bold :strike-through t)
    (evil-ex-substitute-replacement :background base0     :foreground green :weight 'bold)
    (evil-search-highlight-persist-highlight-face :inherit 'lazy-highlight)
    ;;;; evil-mc
    (evil-mc-cursor-default-face :background magenta :foreground base0)
    (evil-mc-region-face         :inherit 'region)
    (evil-mc-cursor-bar-face     :height 1 :background magenta :foreground base0)
    (evil-mc-cursor-hbar-face    :underline `(:color ,highlight))
    ;;;; evil-snipe
    (evil-snipe-first-match-face :foreground highlight :background dark-blue :weight 'bold)
    (evil-snipe-matches-face     :foreground highlight :underline t :weight 'bold)
    ;;;; eww
    (eww-form-checkbox :inherit 'eww-form-file)
    (eww-form-file   :inherit 'eww-form-submit :background bg-alt)
    (eww-form-select :inherit 'eww-form-submit :background bg-alt)
    (eww-form-submit :inherit 'eww-form-text :box `(:line-width 2 :style released-button) :background base2)
    (eww-form-text :box `(:line-width 1 :color ,base3) :background bg :foreground fg :distant-foreground bg)
    (eww-form-textarea :inherit 'eww-form-text)
    (eww-invalid-certificate :foreground error)
    (eww-valid-certificate :foreground highlight)
    ;;;; flycheck
    (flycheck-error          :underline `(:style wave :color ,red))
    (flycheck-warning        :underline `(:style wave :color ,yellow))
    (flycheck-info           :underline `(:style wave :color ,green))
    (flycheck-fringe-error   :inherit 'fringe :foreground error)
    (flycheck-fringe-warning :inherit 'fringe :foreground warning)
    (flycheck-fringe-info    :inherit 'fringe :foreground success)
    ;;;; flycheck-posframe
    (flycheck-posframe-face            :inherit 'default)
    (flycheck-posframe-background-face :background bg-alt)
    (flycheck-posframe-error-face      :inherit 'flycheck-posframe-face :foreground error)
    (flycheck-posframe-info-face       :inherit 'flycheck-posframe-face :foreground fg)
    (flycheck-posframe-warning-face    :inherit 'flycheck-posframe-face :foreground warning)
    ;;;; flymake
    (flymake-error   :underline `(:style wave :color ,red))
    (flymake-note    :underline `(:style wave :color ,green))
    (flymake-warning :underline `(:style wave :color ,orange))
    ;;;; flyspell <built-in>
    (flyspell-incorrect :underline `(:style wave :color ,error) :inherit 'unspecified)
    (flyspell-duplicate :underline `(:style wave :color ,warning) :inherit 'unspecified)
    ;;;; flx-ido
    (flx-highlight-face :weight 'bold :foreground yellow :underline nil)
    ;;;; git-commit
    (git-commit-summary               :foreground strings)
    (git-commit-overlong-summary      :inherit 'error          :background base0 :slant 'italic :weight 'bold)
    (git-commit-nonempty-second-line  :inherit 'git-commit-overlong-summary)
    (git-commit-keyword               :foreground cyan         :slant 'italic)
    (git-commit-pseudo-header         :foreground doc-comments :slant 'italic)
    (git-commit-known-pseudo-header   :foreground doc-comments :weight 'bold     :slant 'italic)
    (git-commit-comment-branch-local  :foreground magenta)
    (git-commit-comment-branch-remote :foreground green)
    (git-commit-comment-detached      :foreground orange)
    (git-commit-comment-heading       :foreground keywords)
    (git-commit-comment-file          :foreground violet)
    (git-commit-comment-action)
    ;;;; git-gutter
    (git-gutter:modified :inherit 'fringe :foreground vc-modified)
    (git-gutter:added    :inherit 'fringe :foreground vc-added)
    (git-gutter:deleted  :inherit 'fringe :foreground vc-deleted)
    ;;;; git-gutter+
    (git-gutter+-modified :inherit 'fringe :foreground vc-modified :background 'unspecified)
    (git-gutter+-added    :inherit 'fringe :foreground vc-added    :background 'unspecified)
    (git-gutter+-deleted  :inherit 'fringe :foreground vc-deleted  :background 'unspecified)
    ;;;; git-gutter-fringe
    ((git-gutter-fr:modified &inherit git-gutter:modified))
    ((git-gutter-fr:added    &inherit git-gutter:added))
    ((git-gutter-fr:deleted  &inherit git-gutter:deleted))
    ;;;; gnus (built-in)
    (gnus-group-mail-1           :weight 'bold :foreground fg)
    (gnus-group-mail-2           :inherit 'gnus-group-mail-1)
    (gnus-group-mail-3           :inherit 'gnus-group-mail-1)
    (gnus-group-mail-1-empty     :foreground base5)
    (gnus-group-mail-2-empty     :inherit 'gnus-group-mail-1-empty)
    (gnus-group-mail-3-empty     :inherit 'gnus-group-mail-1-empty)
    (gnus-group-news-1           :inherit 'gnus-group-mail-1)
    (gnus-group-news-2           :inherit 'gnus-group-news-1)
    (gnus-group-news-3           :inherit 'gnus-group-news-1)
    (gnus-group-news-4           :inherit 'gnus-group-news-1)
    (gnus-group-news-5           :inherit 'gnus-group-news-1)
    (gnus-group-news-6           :inherit 'gnus-group-news-1)
    (gnus-group-news-1-empty     :inherit 'gnus-group-mail-1-empty)
    (gnus-group-news-2-empty     :inherit 'gnus-group-news-1-empty)
    (gnus-group-news-3-empty     :inherit 'gnus-group-news-1-empty)
    (gnus-group-news-4-empty     :inherit 'gnus-group-news-1-empty)
    (gnus-group-news-5-empty     :inherit 'gnus-group-news-1-empty)
    (gnus-group-news-6-empty     :inherit 'gnus-group-news-1-empty)
    (gnus-group-mail-low         :inherit 'gnus-group-mail-1 :weight 'normal)
    (gnus-group-mail-low-empty   :inherit 'gnus-group-mail-1-empty)
    (gnus-group-news-low         :inherit 'gnus-group-mail-1 :foreground base5)
    (gnus-group-news-low-empty   :inherit 'gnus-group-news-low :weight 'normal)
    (gnus-header-content         :inherit 'message-header-other)
    (gnus-header-from            :inherit 'message-header-other)
    (gnus-header-name            :inherit 'message-header-name)
    (gnus-header-newsgroups      :inherit 'message-header-other)
    (gnus-header-subject         :inherit 'message-header-subject)
    (gnus-summary-cancelled      :foreground red :strike-through t)
    (gnus-summary-high-ancient   :foreground (soulwalker-lighten base5 0.2) :inherit 'italic)
    (gnus-summary-high-read      :foreground (soulwalker-lighten fg 0.2))
    (gnus-summary-high-ticked    :foreground (soulwalker-lighten magenta 0.2))
    (gnus-summary-high-unread    :foreground (soulwalker-lighten green 0.2))
    (gnus-summary-low-ancient    :foreground (soulwalker-darken base5 0.2) :inherit 'italic)
    (gnus-summary-low-read       :foreground (soulwalker-darken fg 0.2))
    (gnus-summary-low-ticked     :foreground (soulwalker-darken magenta 0.2))
    (gnus-summary-low-unread     :foreground (soulwalker-darken green 0.2))
    (gnus-summary-normal-ancient :foreground base5 :inherit 'italic)
    (gnus-summary-normal-read    :foreground fg)
    (gnus-summary-normal-ticked  :foreground magenta)
    (gnus-summary-normal-unread  :foreground green :inherit 'bold)
    (gnus-summary-selected       :foreground blue :weight 'bold)
    (gnus-cite-1                 :foreground violet)
    (gnus-cite-2                 :foreground yellow)
    (gnus-cite-3                 :foreground magenta)
    (gnus-cite-4                 :foreground green)
    (gnus-cite-5                 :foreground green)
    (gnus-cite-6                 :foreground green)
    (gnus-cite-7                 :foreground magenta)
    (gnus-cite-8                 :foreground magenta)
    (gnus-cite-9                 :foreground magenta)
    (gnus-cite-10                :foreground yellow)
    (gnus-cite-11                :foreground yellow)
    (gnus-signature              :foreground yellow)
    (gnus-x-face                 :background base5 :foreground fg)
    ;;;; helm
    (helm-selection
     (&all :inherit 'bold :background selection :extend t)
     (&dark  :distant-foreground highlight)
     (&light :distant-foreground base0))
    (helm-match :inherit 'bold :foreground highlight :distant-foreground base8)
    (helm-source-header          :background base2 :foreground keywords :weight 'bold)
    (helm-visible-mark           :inherit '(bold highlight))
    (helm-moccur-buffer          :inherit 'link)
    (helm-ff-file                :foreground fg)
    (helm-ff-prefix              :foreground keywords)
    (helm-ff-dotted-directory    :foreground grey)
    (helm-ff-directory           :foreground variables)
    (helm-ff-executable          :foreground base8 :inherit 'italic)
    (helm-grep-match             :foreground highlight :distant-foreground red)
    (helm-grep-file              :foreground methods)
    (helm-grep-lineno            :foreground base5)
    (helm-grep-finish            :foreground green)
    ;;;; helm-swoop
    (helm-swoop-target-line-face       :foreground highlight :inverse-video t)
    (helm-swoop-target-line-block-face :foreground yellow)
    (helm-swoop-target-word-face       :foreground green :inherit 'bold)
    (helm-swoop-target-number-face     :foreground base5)
    ;;;; helm-rg
    (helm-rg-active-arg-face        :foreground green  :weight 'normal)
    (helm-rg-base-rg-cmd-face       :foreground grey   :weight 'normal)
    (helm-rg-colon-separator-ripgrep-output-face :foreground base8)
    (helm-rg-directory-cmd-face     :foreground (soulwalker-darken yellow 0.25) :background base0 :weight 'normal)
    (helm-rg-directory-header-face  :foreground base8 :background base0 :weight 'bold)
    (helm-rg-error-message          :foreground red)
    (helm-rg-extra-arg-face         :foreground yellow :weight 'normal)
    (helm-rg-file-match-face        :foreground cyan :underline t)
    (helm-rg-inactive-arg-face      :foreground grey   :weight 'normal)
    (helm-rg-line-number-match-face :foreground orange :underline t)
    (helm-rg-match-text-face        :foreground base8 :background violet)
    (helm-rg-title-face             :foreground violet :background base0 :weight 'bold)
    ;;;; helpful
    (helpful-heading :weight 'bold :height 1.2)
    ;;;; hi-lock <built-in>
    (hi-yellow   :background yellow)
    (hi-pink     :background magenta)
    (hi-red-b    :foreground red :weight 'bold)
    (hi-green    :background green)
    (hi-green-b  :foreground green :weight 'bold)
    (hi-blue     :background blue)
    (hi-blue-b   :foreground blue :weight 'bold)
    ;; (hi-black-b  :weight 'bold)
    ;; (hi-black-hb :inherit 'variable-pitch :weight 'bold :height 1.67)
    ;;;; hideshow <built-in>
    (+fold-hideshow-folded-face :inherit 'font-lock-comment-face
                                :weight 'light
                                :background (soulwalker-darken bg 0.125))
    ;;;; highlight-numbers-mode
    (highlight-numbers-number :inherit 'bold :foreground numbers)
    ;;;; highlight-indentation-mode
    (highlight-indentation-face                :inherit 'hl-line)
    (highlight-indentation-current-column-face :background base5)
    (highlight-indentation-guides-odd-face     :inherit 'highlight-indentation-face)
    (highlight-indentation-guides-even-face    :inherit 'highlight-indentation-face)
    ;;;; highlight-quoted-mode
    (highlight-quoted-symbol :foreground type)
    (highlight-quoted-quote  :foreground operators)
    ;;;; highlight-symbol
    (highlight-symbol-face
     (&dark  :background (soulwalker-lighten region 0.1) :distant-foreground fg-alt)
     (&light :background (soulwalker-darken region 0.1) :distant-foreground fg-alt))
    ;;;; highlight-thing
    (highlight-thing
     (&dark  :background (soulwalker-lighten region 0.1) :distant-foreground fg-alt)
     (&light :background (soulwalker-darken region 0.1) :distant-foreground fg-alt))
    ;;;; hl-fill-column-face
    (hl-fill-column-face :inherit '(hl-line shadow))
    ;;;; hl-line (built-in)
    ;; (hl-line :background bg-alt :extend t)
    (hl-line :background base0 :extend t)
    ;;;; hl-todo
    (hl-todo :foreground red :weight 'bold)
    ;;;; hlinum
    (linum-highlight-face :foreground fg :weight 'normal)
    ;;;; hydra
    (hydra-face-red      :foreground red     :weight 'bold)
    (hydra-face-blue     :foreground blue    :weight 'bold)
    (hydra-face-amaranth :foreground magenta :weight 'bold)
    (hydra-face-pink     :foreground violet  :weight 'bold)
    (hydra-face-teal     :foreground teal    :weight 'bold)
    ;;;; iedit
    (iedit-occurrence :foreground magenta :weight 'bold :inverse-video t)
    (iedit-read-only-occurrence :inherit 'region)
    ;;;; ido <built-in>
    (ido-first-match :foreground orange)
    (ido-indicator   :foreground red :background bg)
    (ido-only-match  :foreground green)
    (ido-subdir      :foreground violet)
    (ido-virtual     :foreground comments)
    ;;;; imenu-list
    ;; (imenu-list-entry-face)
    (imenu-list-entry-face-0 :foreground highlight)
    (imenu-list-entry-subalist-face-0 :inherit 'imenu-list-entry-face-0 :weight 'bold)
    (imenu-list-entry-face-1 :foreground green)
    (imenu-list-entry-subalist-face-1 :inherit 'imenu-list-entry-face-1 :weight 'bold)
    (imenu-list-entry-face-2 :foreground yellow)
    (imenu-list-entry-subalist-face-2 :inherit 'imenu-list-entry-face-2 :weight 'bold)
    ;;;; indent-guide
    ((indent-guide-face &inherit highlight-indentation-face))
    ;;;; isearch <built-in>
    (isearch :inherit 'lazy-highlight :weight 'bold)
    (isearch-fail :background error :foreground base0 :weight 'bold)
    ;;;; ivy
    (ivy-current-match :background region :extend t)
    (ivy-minibuffer-match-face-1
     :foreground (soulwalker-lighten grey 0.14)
     :weight 'light)
    (ivy-minibuffer-match-face-2
     :inherit 'ivy-minibuffer-match-face-1
     :foreground magenta :background base1 :weight 'semi-bold)
    (ivy-minibuffer-match-face-3
     :inherit 'ivy-minibuffer-match-face-2
     :foreground green :weight 'semi-bold)
    (ivy-minibuffer-match-face-4
     :inherit 'ivy-minibuffer-match-face-2
     :foreground yellow :weight 'semi-bold)
    (ivy-minibuffer-match-highlight :foreground violet)
    (ivy-highlight-face :foreground violet)
    (ivy-confirm-face :foreground success)
    (ivy-match-required-face :foreground error)
    (ivy-virtual :inherit 'italic :foreground doc-comments)
    (ivy-modified-buffer :inherit 'bold :foreground warning)
    ;;;; ivy-posframe
    (ivy-posframe :background bg)
    (ivy-posframe-border :inherit internal-border)
    ;;;; selectrum
    (selectrum-current-candidate :background region :extend t)
    ;;;; vertico
    (vertico-current :background region :extend t)
    ;;;; vertico-posframe
    ;;(vertico-posframe :inherit 'default)
    (vertico-posframe-border :background grey)
    (vertico-posframe-border-2 :background red)
    (vertico-posframe-border-3 :background green)
    (vertico-posframe-border-4 :background blue)
    (vertico-posframe-border-fallback :background yellow)
    ;;;; linum <built-in>
    ((linum &inherit line-number))
    ;;;; linum-relative
    ((linum-relative-current-face &inherit line-number-current-line))
    ;;;; lui
    (lui-time-stamp-face :foreground violet)
    (lui-highlight-face :foreground highlight)
    (lui-button-face :foreground builtin :underline t)
    ;;;; magit
    (magit-bisect-bad        :foreground red)
    (magit-bisect-good       :foreground green)
    (magit-bisect-skip       :foreground orange)
    (magit-blame-hash        :foreground cyan)
    (magit-blame-date        :foreground red)
    (magit-blame-heading     :foreground orange :background base3 :extend t)
    (magit-branch-current    :foreground blue)
    (magit-branch-local      :foreground cyan)
    (magit-branch-remote     :foreground green)
    (magit-cherry-equivalent :foreground violet)
    (magit-cherry-unmatched  :foreground cyan)
    (magit-diff-added             :foreground (soulwalker-darken vc-added 0.2)  :background (soulwalker-blend vc-added bg 0.1) :extend t)
    (magit-diff-added-highlight   :foreground vc-added                    :background (soulwalker-blend vc-added bg 0.2) :weight 'bold :extend t)
    (magit-diff-base              :foreground (soulwalker-darken orange 0.2) :background (soulwalker-blend orange bg 0.1) :extend t)
    (magit-diff-base-highlight    :foreground orange                   :background (soulwalker-blend orange bg 0.2) :weight 'bold :extend t)
    (magit-diff-context           :foreground (soulwalker-darken fg 0.4) :background bg :extend t)
    (magit-diff-context-highlight :foreground fg                   :background bg-alt :extend t)
    (magit-diff-file-heading           :foreground fg :weight 'bold :extend t)
    (magit-diff-file-heading-selection :foreground magenta               :background dark-blue :weight 'bold :extend t)
    (magit-diff-hunk-heading           :foreground bg                    :background (soulwalker-blend violet bg 0.3) :extend t)
    (magit-diff-hunk-heading-highlight :foreground bg                    :background violet :weight 'bold :extend t)
    (magit-diff-lines-heading          :foreground yellow :background red :extend t :extend t)
    (magit-diff-removed                :foreground (soulwalker-darken vc-deleted 0.2) :background (soulwalker-blend vc-deleted base3 0.1) :extend t)
    (magit-diff-removed-highlight      :foreground vc-deleted                   :background (soulwalker-blend vc-deleted base3 0.2) :weight 'bold :extend t)
    (magit-diffstat-added              :foreground vc-added)
    (magit-diffstat-removed            :foreground vc-deleted)
    (magit-dimmed :foreground comments)
    (magit-hash :foreground comments)
    (magit-header-line :background dark-blue :foreground base8 :weight 'bold
                       :box `(:line-width 3 :color ,dark-blue))
    (magit-filename :foreground violet)
    (magit-log-author :foreground orange)
    (magit-log-date :foreground blue)
    (magit-log-graph :foreground comments)
    (magit-process-ng :inherit 'error)
    (magit-process-ok :inherit 'success)
    (magit-reflog-amend :foreground magenta)
    (magit-reflog-checkout :foreground blue)
    (magit-reflog-cherry-pick :foreground green)
    (magit-reflog-commit :foreground green)
    (magit-reflog-merge :foreground green)
    (magit-reflog-other :foreground cyan)
    (magit-reflog-rebase :foreground magenta)
    (magit-reflog-remote :foreground cyan)
    (magit-reflog-reset :inherit 'error)
    (magit-refname :foreground comments)
    (magit-section-heading :foreground blue :weight 'bold :extend t)
    (magit-section-heading-selection :foreground orange :weight 'bold :extend t)
    (magit-section-highlight :inherit 'hl-line)
    (magit-section-secondary-heading :foreground violet :weight 'bold :extend t)
    (magit-sequence-drop :foreground red)
    (magit-sequence-head :foreground blue)
    (magit-sequence-part :foreground orange)
    (magit-sequence-stop :foreground green)
    (magit-signature-bad :inherit 'error)
    (magit-signature-error :inherit 'error)
    (magit-signature-expired :foreground orange)
    (magit-signature-good :inherit 'success)
    (magit-signature-revoked :foreground magenta)
    (magit-signature-untrusted :foreground yellow)
    (magit-tag :foreground yellow)
    ;;;; make-mode <built-in> <modes:makefile-mode,makefile-automake-mode,makefile-makepp-mode,makefile-gmake-mode,makefile-imake-mode,makefile-bsdmake-mode>
    (makefile-targets :foreground blue)
    ;;;; man <built-in> <mode:Man-mode>
    (Man-overstrike :inherit 'bold :foreground operators)
    (Man-underline :inherit 'underline :foreground keywords)
    ;;;; markdown-mode <modes:markdown-mode,gfm-mode>
    (markdown-header-face           :inherit 'bold :foreground highlight)
    (markdown-header-delimiter-face :inherit 'markdown-header-face)
    (markdown-metadata-key-face     :foreground red)
    (markdown-list-face             :foreground red)
    (markdown-link-face             :foreground highlight)
    (markdown-url-face              :foreground magenta :weight 'normal)
    (markdown-italic-face           :inherit 'italic :foreground violet)
    (markdown-bold-face             :inherit 'bold   :foreground orange)
    (markdown-markup-face           :foreground operators)
    (markdown-blockquote-face       :inherit 'italic :foreground doc-comments)
    (markdown-pre-face              :foreground strings)
    (markdown-code-face             :background base3 :extend t)
    (markdown-reference-face        :foreground doc-comments)
    (markdown-inline-code-face      :inherit '(markdown-code-face markdown-pre-face) :extend nil)
    (markdown-html-attr-name-face     :inherit 'font-lock-variable-name-face)
    (markdown-html-attr-value-face    :inherit 'font-lock-string-face)
    (markdown-html-entity-face        :inherit 'font-lock-variable-name-face)
    (markdown-html-tag-delimiter-face :inherit 'markdown-markup-face)
    (markdown-html-tag-name-face      :inherit 'font-lock-keyword-face)
    ;;;; message <built-in>
    (message-header-name       :foreground green)
    (message-header-subject    :foreground highlight :weight 'bold)
    (message-header-to         :foreground highlight :weight 'bold)
    (message-header-cc         :inherit 'message-header-to :foreground (soulwalker-darken highlight 0.15))
    (message-header-other      :foreground violet)
    (message-header-newsgroups :foreground yellow)
    (message-header-xheader    :foreground doc-comments)
    (message-separator         :foreground comments)
    (message-mml               :foreground comments :slant 'italic)
    ((message-cited-text   &inherit gnus-cite-1))
    ((message-cited-text-1 &inherit gnus-cite-2))
    ((message-cited-text-2 &inherit gnus-cite-3))
    ((message-cited-text-3 &inherit gnus-cite-4))
    ((message-cited-text-4 &inherit gnus-cite-5))
    ;;;; mic-paren
    (paren-face-match    :foreground red   :background base0 :weight 'ultra-bold)
    (paren-face-mismatch :foreground base0 :background red   :weight 'ultra-bold)
    (paren-face-no-match :inherit 'paren-face-mismatch :weight 'ultra-bold)
    ;;;; minimap
    (minimap-current-line-face :background selection)
    (minimap-active-region-background :background vertical-bar)
    ;;;; lsp-mode
    (lsp-face-highlight-textual
     (&all   :weight 'bold)
     (&light :background base3 :foreground base0 :distant-foreground base8)
     (&dark  :background (soulwalker-blend highlight bg 0.3) :foreground base8 :distant-foreground base0))
    (lsp-face-highlight-read    :inherit 'lsp-face-highlight-textual)
    (lsp-face-highlight-write   :inherit 'lsp-face-highlight-textual)
    (lsp-headerline-breadcrumb-separator-face :inherit 'shadow)
    ;;;; lsp-ui
    (lsp-ui-doc-background :inherit 'tooltip)
    (lsp-ui-peek-filename :inherit 'mode-line-buffer-id)
    (lsp-ui-peek-header :foreground fg :background (soulwalker-lighten bg 0.1) :bold bold)
    (lsp-ui-peek-selection :foreground bg :background blue :bold bold)
    (lsp-ui-peek-list :background (soulwalker-darken bg 0.1))
    (lsp-ui-peek-peek :background (soulwalker-darken bg 0.1))
    (lsp-ui-peek-highlight :inherit 'lsp-ui-peek-header :background region :foreground bg :box t)
    (lsp-ui-peek-line-number :foreground success)
    (lsp-ui-sideline-code-action :foreground (soulwalker-blend highlight bg 0.85))
    (lsp-ui-sideline-current-symbol :inherit 'highlight)
    (lsp-ui-sideline-symbol-info :foreground (soulwalker-blend comments bg 0.85)
                                 :background bg-alt :extend t)
    ;;;; orderless
    (orderless-match-face-0 :weight 'bold :foreground (soulwalker-blend blue    fg 0.6) :background (soulwalker-blend blue    bg 0.1))
    (orderless-match-face-1 :weight 'bold :foreground (soulwalker-blend magenta fg 0.6) :background (soulwalker-blend magenta bg 0.1))
    (orderless-match-face-2 :weight 'bold :foreground (soulwalker-blend green   fg 0.6) :background (soulwalker-blend green   bg 0.1))
    (orderless-match-face-3 :weight 'bold :foreground (soulwalker-blend yellow  fg 0.6) :background (soulwalker-blend yellow  bg 0.1))
    ;;;; org <built-in> <modes:org-mode>
    (org-archived                 :foreground doc-comments)
    (org-block                    :background base3    :extend t)
    (org-block-background         :background base3    :extend t)
    (org-block-begin-line         :inherit 'org-block  :foreground comments)
    (org-block-end-line           :inherit 'org-block-begin-line)
    (org-checkbox                 :inherit 'org-todo)
    (org-checkbox-statistics-done :inherit 'org-done)
    (org-checkbox-statistics-todo :inherit 'org-todo)
    (org-cite                     :foreground (soulwalker-blend teal fg 0.9))
    (org-cite-key                 :foreground (soulwalker-blend teal fg 0.6) :underline t)
    (org-code                     :inherit 'org-block :foreground orange)
    (org-date                     :foreground yellow)
    (org-default                  :inherit 'variable-pitch)
    (org-document-info            :foreground builtin)
    (org-document-title           :foreground builtin         :weight 'bold)
    (org-done                     :inherit 'org-headline-done :strike-through nil :weight 'bold)
    (org-drawer                   :foreground comments)
    (org-ellipsis                 :foreground comments :underline nil)
    (org-footnote                 :foreground orange)
    (org-formula                  :foreground cyan)
    (org-headline-done            :foreground base5)
    (org-hide                     :foreground bg)
    (org-latex-and-related        :foreground base8           :weight 'bold)
    (org-link                     :inherit 'link              :foreground highlight)
    (org-list-dt                  :foreground highlight)
    (org-meta-line                :foreground doc-comments)
    (org-priority                 :foreground red)
    (org-property-value           :foreground doc-comments)
    (org-quote                    :inherit 'org-block :slant 'italic)
    (org-special-keyword          :foreground doc-comments)
    (org-table                    :foreground violet)
    (org-tag                      :foreground doc-comments :weight 'normal)
    (org-todo                     :foreground green :bold 'inherit)
    (org-verbatim                 :foreground green)
    (org-warning                  :foreground warning)
    ;; Omitted because we rely on style they inherit from the outline-N faces
    ;;(org-level-1)
    ;;(org-level-2)
    ;;(org-level-3)
    ;;(org-level-4)
    ;;(org-level-5)
    ;;(org-level-6)
    ;;(org-level-7)
    ;;(org-level-8)
    ;;;; org-agenda <built-in>
    (org-agenda-done :inherit 'org-done)
    (org-agenda-dimmed-todo-face :foreground comments)
    (org-agenda-date          :foreground violet :weight 'ultra-bold)
    (org-agenda-date-today    :foreground (soulwalker-lighten violet 0.4)   :weight 'ultra-bold)
    (org-agenda-date-weekend  :foreground (soulwalker-darken violet 0.4)  :weight 'ultra-bold)
    (org-agenda-structure     :foreground fg :weight 'ultra-bold)
    (org-agenda-clocking      :background (soulwalker-blend blue bg 0.2))
    (org-upcoming-deadline         :foreground (soulwalker-blend fg bg 0.8))
    (org-upcoming-distant-deadline :foreground (soulwalker-blend fg bg 0.5))
    (org-scheduled            :foreground fg)
    (org-scheduled-today      :foreground base7)
    (org-scheduled-previously :foreground base8)
    (org-time-grid            :foreground comments)
    (org-sexp-date            :foreground fg)
    ;;;; org-habit
    (org-habit-clear-face          :weight 'bold :background base4)
    (org-habit-clear-future-face   :weight 'bold :background base3)
    (org-habit-ready-face          :weight 'bold :background (soulwalker-blend blue bg-alt 0.5))
    (org-habit-ready-future-face   :weight 'bold :background (soulwalker-blend blue bg-alt 0.3))
    (org-habit-alert-face          :weight 'bold :background (soulwalker-blend yellow bg-alt 0.5))
    (org-habit-alert-future-face   :weight 'bold :background (soulwalker-blend yellow bg-alt 0.3))
    (org-habit-overdue-face        :weight 'bold :background (soulwalker-blend red bg-alt 0.5))
    (org-habit-overdue-future-face :weight 'bold :background (soulwalker-blend red bg-alt 0.3))
    ;;;; org-ref
    (org-ref-acronym-face    :foreground violet)
    (org-ref-cite-face       :foreground yellow :weight 'light :underline t)
    (org-ref-glossary-face   :foreground magenta)
    (org-ref-label-face      :foreground blue)
    (org-ref-ref-face        :inherit 'link :foreground teal)
    ;;;; outline <built-in>
    ;; NOTE org-mode's org-level-N faces inherit these outline-N faces.
    (outline-1 :foreground blue                        :weight 'bold :extend t)
    (outline-2 :foreground magenta                     :weight 'bold :extend t)
    (outline-3 :foreground violet                      :weight 'bold :extend t)
    (outline-4 :foreground (soulwalker-lighten blue 0.25)    :weight 'bold :extend t)
    (outline-5 :foreground (soulwalker-lighten magenta 0.25) :weight 'bold :extend t)
    (outline-6 :foreground (soulwalker-lighten blue 0.5)     :weight 'bold :extend t)
    (outline-7 :foreground (soulwalker-lighten magenta 0.5)  :weight 'bold :extend t)
    (outline-8 :foreground (soulwalker-lighten blue 0.8)     :weight 'bold :extend t)
    ;;;; parenface
    (paren-face :foreground comments)
    ;;;; parinfer
    (parinfer-pretty-parens:dim-paren-face :foreground base5)
    (parinfer-smart-tab:indicator-face :foreground base5)
    ;;;; perspective
    (persp-selected-face :foreground blue :weight 'bold)
    ;;;; persp-mode
    (persp-face-lighter-default :foreground highlight :weight 'bold)
    (persp-face-lighter-buffer-not-in-persp :foreground doc-comments)
    (persp-face-lighter-nil-persp :foreground comments)
    ;;;; pkgbuild-mode <modes:pkgbuild-mode>
    (pkgbuild-error-face :underline `(:style wave :color ,red))
    ;;;; popup
    (popup-face           :inherit 'tooltip)
    (popup-tip-face       :inherit 'popup-face :foreground violet :background base0)
    (popup-selection-face :background selection)
    ;;;; power
    (powerline-active0   :inherit 'mode-line :background bg)
    (powerline-active1   :inherit 'mode-line :background (soulwalker-lighten 'bg 0.025))
    (powerline-active2   :inherit 'mode-line :foreground base8 :background (soulwalker-lighten 'bg 0.08))
    (powerline-inactive0 :inherit 'mode-line-inactive :background base2)
    (powerline-inactive1 :inherit 'mode-line-inactive :background (soulwalker-lighten 'base2 0.02))
    (powerline-inactive2 :inherit 'mode-line-inactive :background (soulwalker-lighten 'base2 0.04))
    ;;;; rainbow-delimiters
    (rainbow-delimiters-depth-1-face :foreground blue)
    (rainbow-delimiters-depth-2-face :foreground magenta)
    (rainbow-delimiters-depth-3-face :foreground green)
    (rainbow-delimiters-depth-4-face :foreground violet)
    (rainbow-delimiters-depth-5-face :foreground teal)
    (rainbow-delimiters-depth-6-face :foreground blue)
    (rainbow-delimiters-depth-7-face :foreground magenta)
    (rainbow-delimiters-depth-8-face :foreground green)
    (rainbow-delimiters-depth-9-face :foreground violet)
    (rainbow-delimiters-base-error-face :inherit 'rainbow-delimiters-base-face :foreground error)
    (rainbow-delimiters-base-face :inherit 'default)
    (rainbow-delimiters-unmatched-face  :foreground red :weight 'bold :inverse-video t)
    (rainbow-delimiters-mismatched-face :inherit 'rainbow-delimiters-unmatched-face)
    ;;;; re-builder <built-in>
    (reb-match-0 :foreground orange  :inverse-video t)
    (reb-match-1 :foreground magenta :inverse-video t)
    (reb-match-2 :foreground green   :inverse-video t)
    (reb-match-3 :foreground yellow  :inverse-video t)
    ;;;; sh-script <built-in> <modes:sh-mode,shell-script-mode>
    (sh-heredoc :inherit 'font-lock-string-face :weight 'normal)
    (sh-quoted-exec :inherit 'font-lock-preprocessor-face)
    ;;;; show-paren <built-in>
    ((show-paren-match &inherit paren-face-match))
    ((show-paren-mismatch &inherit paren-face-mismatch))
    ;;;; smart-mode-line
    (sml/charging          :foreground green)
    (sml/discharging       :foreground yellow :weight 'bold)
    (sml/filename          :foreground violet :weight 'bold)
    (sml/git               :foreground blue)
    (sml/modified          :foreground cyan)
    (sml/outside-modified  :foreground cyan)
    (sml/process           :weight 'bold)
    (sml/read-only         :foreground cyan)
    (sml/sudo              :foreground orange :weight 'bold)
    (sml/vc-edited         :foreground green)
    ;;;; smartparens
    (sp-pair-overlay-face :background region)
    ((sp-show-pair-match-face    &inherit show-paren-match))
    ((sp-show-pair-mismatch-face &inherit show-paren-mismatch))
    ;;;; symbol-overlay
    (symbol-overlay-default-face
     (&dark  :background (soulwalker-lighten region 0.1) :distant-foreground fg-alt)
     (&light :background (soulwalker-darken region 0.1)  :distant-foreground fg-alt))
    (symbol-overlay-face-1 :background (soulwalker-blend blue bg 0.4)    :distant-foreground fg-alt)
    (symbol-overlay-face-2 :background (soulwalker-blend violet bg 0.4)  :distant-foreground fg-alt)
    (symbol-overlay-face-3 :background (soulwalker-blend yellow bg 0.3)  :distant-foreground fg-alt)
    (symbol-overlay-face-4 :background (soulwalker-blend orange bg 0.3)  :distant-foreground fg-alt)
    (symbol-overlay-face-5 :background (soulwalker-blend red bg 0.3)     :distant-foreground fg-alt)
    (symbol-overlay-face-6 :background (soulwalker-blend magenta bg 0.3) :distant-foreground fg-alt)
    (symbol-overlay-face-7 :background (soulwalker-blend green bg 0.4)   :distant-foreground fg-alt)
    (symbol-overlay-face-8 :background (soulwalker-blend cyan bg 0.2)    :distant-foreground fg-alt)
    ;;;; swiper
    (swiper-line-face    :background blue    :foreground base0)
    (swiper-match-face-2 :inherit 'unspecified :background orange  :foreground base0 :weight 'bold)
    (swiper-match-face-3 :inherit 'unspecified :background magenta :foreground base0 :weight 'bold)
    (swiper-match-face-4 :inherit 'unspecified :background green   :foreground base0 :weight 'bold)
    ;;;; tabbar
    (tabbar-default             :foreground bg :background bg :height 1.0)
    (tabbar-highlight           :foreground fg :background selection :distant-foreground bg)
    (tabbar-button              :foreground fg :background bg)
    (tabbar-button-highlight    :inherit 'tabbar-button :inverse-video t)
    (tabbar-modified            :inherit 'tabbar-default :foreground red :weight 'bold)
    (tabbar-unselected          :inherit 'tabbar-default :foreground base5)
    (tabbar-unselected-modified :inherit 'tabbar-modified)
    (tabbar-selected
     :inherit 'tabbar-default :weight 'bold
     :foreground fg :background bg-alt)
    (tabbar-selected-modified :inherit 'tabbar-selected :foreground green)
    ;;;; term <built-in>
    (term               :foreground fg)
    (term-bold          :weight 'bold)
    (term-color-black   :background base0   :foreground base0)
    (term-color-red     :background red     :foreground red)
    (term-color-green   :background green   :foreground green)
    (term-color-yellow  :background yellow  :foreground yellow)
    (term-color-blue    :background blue    :foreground blue)
    (term-color-magenta :background magenta :foreground magenta)
    (term-color-cyan    :background cyan    :foreground cyan)
    (term-color-white   :background base8   :foreground base8)
    ;;;; treemacs
    (treemacs-directory-face        :foreground fg)
    (treemacs-file-face             :foreground fg)
    (treemacs-fringe-indicator-face :foreground highlight)
    (treemacs-git-added-face        :foreground vc-added)
    (treemacs-git-conflict-face     :foreground red)
    (treemacs-git-modified-face     :foreground violet)
    (treemacs-git-untracked-face    :inherit 'font-lock-doc-face)
    (treemacs-on-failure-pulse-face :foreground base0 :background error   :extend t)
    (treemacs-on-success-pulse-face :foreground base0 :background success :extend t)
    (treemacs-root-face             :inherit 'font-lock-string-face :weight 'bold       :height 1.2)
    (treemacs-tags-face             :foreground highlight)
    ;;;; vimish-fold
    (vimish-fold-overlay :inherit 'font-lock-comment-face :background base0 :weight 'light)
    (vimish-fold-fringe  :foreground magenta)
    ;;;; vterm
    (vterm-color-black   :background (soulwalker-lighten base0 0.25)   :foreground base0)
    (vterm-color-red     :background (soulwalker-lighten red 0.25)     :foreground red)
    (vterm-color-green   :background (soulwalker-lighten green 0.25)   :foreground green)
    (vterm-color-yellow  :background (soulwalker-lighten yellow 0.25)  :foreground yellow)
    (vterm-color-blue    :background (soulwalker-lighten blue 0.25)    :foreground blue)
    (vterm-color-magenta :background (soulwalker-lighten magenta 0.25) :foreground magenta)
    (vterm-color-cyan    :background (soulwalker-lighten cyan 0.25)    :foreground cyan)
    (vterm-color-white   :background (soulwalker-lighten base8 0.25)   :foreground base8)
    ;;;; wgrep <built-in>
    (wgrep-face :weight 'bold :foreground green :background base5)
    (wgrep-delete-face :foreground base3 :background red)
    (wgrep-done-face   :foreground blue)
    (wgrep-file-face   :foreground comments)
    (wgrep-reject-face :foreground red :weight 'bold)
    ;;;; which-func
    (which-func :foreground blue)
    ;;;; which-key
    (which-key-key-face                   :foreground green)
    (which-key-group-description-face     :foreground violet)
    (which-key-command-description-face   :foreground blue)
    (which-key-local-map-description-face :foreground magenta)
    ;;;; whitespace <built-in>
    (whitespace-empty    :background base3)
    (whitespace-space    :foreground base4)
    (whitespace-newline  :foreground base4)
    (whitespace-tab
     :foreground base4
     :background (if (default-value 'indent-tabs-mode) 'unspecified base3))
    (whitespace-indentation
     :foreground base4
     :background (if (default-value 'indent-tabs-mode) base3 'unspecified))
    (whitespace-trailing :inherit 'trailing-whitespace)
    (whitespace-line     :background base0 :foreground red :weight 'bold)
    ;;;; woman <built-in>
    (woman-bold :inherit 'Man-overstrike)
    (woman-italic :inherit 'Man-underline)
    ;;;; yasnippet
    (yas-field-highlight-face :inherit 'match)
    ;;;; xref <built-in>
    ((xref-file-header &inherit compilation-info))
    ((xref-line-number &inherit compilation-line-number))
    ((xref-match &inherit match))
    ;;;; --- END Package faces ------------------
    ))

;;;; --- Package variables ------------------
(defvar soulwalker-themes-base-vars
  '(
    ;;;; ansi-color <built-in> DEPRECATED
    (ansi-color-names-vector
     (vconcat (mapcar #'soulwalker-color '(bg red green yellow blue magenta cyan fg))))
    ;;;; rustic <modes:rustic-mode>
    (rustic-ansi-faces
     (vconcat (mapcar #'soulwalker-color '(bg red green yellow blue magenta cyan fg))))
    ;;;; exwm
    (exwm-floating-border-color (soulwalker-color 'vertical-bar))
    ;;;; fill-column-indicator
    (fci-rule-color (soulwalker-color 'base5))
    ;;;; jdee <modes:jdee-mode>
    (jdee-db-spec-breakpoint-face-colors `(cons ,(soulwalker-color 'base0) ,(soulwalker-color 'grey)))
    (jdee-db-requested-breakpoint-face-colors `(cons ,(soulwalker-color 'base0) ,(soulwalker-color 'green)))
    (jdee-db-active-breakpoint-face-colors `(cons ,(soulwalker-color 'base0) ,(soulwalker-color 'highlight)))
    ;;;; highlight-tail
    (highlight-tail-colors
     `((,(soulwalker-blend green bg 0.1) . 0)
       (,(soulwalker-blend cyan bg 0.1) . 20)))
    ;;;; objed
    (objed-cursor-color (soulwalker-color 'red))
    ;;;; pdf-tools
    (pdf-view-midnight-colors `(cons ,(soulwalker-color 'fg) ,(soulwalker-color 'bg)))
    ;;;; vc <built-in>
    (vc-annotate-color-map
     `(list (cons 20  ,(soulwalker-color 'green))
            (cons 40  ,(soulwalker-blend 'yellow 'green (/ 1.0 3)))
            (cons 60  ,(soulwalker-blend 'yellow 'green (/ 2.0 3)))
            (cons 80  ,(soulwalker-color 'yellow))
            (cons 100 ,(soulwalker-blend 'orange 'yellow (/ 1.0 3)))
            (cons 120 ,(soulwalker-blend 'orange 'yellow (/ 2.0 3)))
            (cons 140 ,(soulwalker-color 'orange))
            (cons 160 ,(soulwalker-blend 'magenta 'orange (/ 1.0 3)))
            (cons 180 ,(soulwalker-blend 'magenta 'orange (/ 2.0 3)))
            (cons 200 ,(soulwalker-color 'magenta))
            (cons 220 ,(soulwalker-blend 'red 'magenta (/ 1.0 3)))
            (cons 240 ,(soulwalker-blend 'red 'magenta (/ 2.0 3)))
            (cons 260 ,(soulwalker-color 'red))
            (cons 280 ,(soulwalker-blend 'grey 'red (/ 1.0 4)))
            (cons 300 ,(soulwalker-blend 'grey 'red (/ 2.0 4)))
            (cons 320 ,(soulwalker-blend 'grey 'red (/ 3.0 4)))
            (cons 340 ,(soulwalker-color 'base5))
            (cons 360 ,(soulwalker-color 'base5))))
    (vc-annotate-very-old-color nil)
    (vc-annotate-background (soulwalker-color 'bg)))
;;;; --- END Package variables --------------
  "TODO")



(defgroup soulwalker-themes nil
  "Options for soulwalker-themes."
  :group 'faces)

(defcustom soulwalker-themes-padded-modeline nil
  "Default value for padded-modeline setting for themes that support it."
  :group 'soulwalker-themes
  :type '(choice integer boolean))

;;
(defcustom soulwalker-themes-enable-bold t
  "If nil, bold will be disabled across all faces."
  :group 'soulwalker-themes
  :type 'boolean)

(defcustom soulwalker-themes-enable-italic t
  "If nil, italics will be disabled across all faces."
  :group 'soulwalker-themes
  :type 'boolean)


;;
;;; API

(defvar soulwalker-themes--colors nil)
(defvar soulwalker--min-colors '(257 256 16))
(defvar soulwalker--quoted-p nil)
(defvar soulwalker-themes--faces nil)

(defun soulwalker-themes--colors-p (item)
  (declare (pure t) (side-effect-free t))
  (when item
    (cond ((listp item)
           (let ((car (car item)))
             (cond ((memq car '(quote soulwalker-color)) nil)

                   ((memq car '(backquote \`))
                    (let ((soulwalker--quoted-p t))
                      (soulwalker-themes--colors-p (cdr item))))

                   ((eq car '\,)
                    (let (soulwalker--quoted-p)
                      (soulwalker-themes--colors-p (cdr item))))

                   ((or (soulwalker-themes--colors-p car)
                        (soulwalker-themes--colors-p (cdr-safe item)))))))

          ((and (symbolp item)
                (not (keywordp item))
                (not soulwalker--quoted-p)
                (not (equal (substring (symbol-name item) 0 1) "-"))
                (assq item soulwalker-themes--colors))))))

(defun soulwalker-themes--apply-faces (new-faces &optional default-faces)
  (declare (pure t) (side-effect-free t))
  (let ((default-faces (or default-faces soulwalker-themes-base-faces))
        (faces (make-hash-table :test #'eq :size (+ (length default-faces) (length new-faces))))
        (directives (make-hash-table :test #'eq)))
    (dolist (spec (append (mapcar #'copy-sequence default-faces) new-faces))
      (if (listp (car spec))
          (cl-destructuring-bind (face action &optional arg) (car spec)
            (unless (assq face new-faces)
              (puthash face (list action arg (cdr spec))
                       directives)))
        (puthash (car spec) (cdr spec) faces)))
    (cl-loop for face being the hash-keys of directives
             for (action target spec) = (gethash face directives)
             unless (memq action '(&inherit &extend &override))
             do (error "Invalid operation (%s) for '%s' face" action face)
             if (eq (car spec) 'quote)
             do (error "Can't extend literal face spec (for '%s')" face)
             ;; TODO Add &all/&light/&dark extension support
             else if (memq (car spec) '(&all &light &dark))
             do (error "Can't extend face with &all, &light or &dark specs (for '%s')" face)
             else do
             (puthash face
                      (let ((old-spec (gethash (or target face) faces))
                            (plist spec))
                        ;; remove duplicates
                        (while (keywordp (car plist))
                          (setq old-spec (plist-put old-spec (car plist) (cadr plist))
                                plist (cddr plist)))
                        old-spec)
                      faces))
    (let (results)
      (maphash (lambda (face plist)
                 (when (keywordp (car plist))
                   ;; TODO Clean up duplicates in &all/&light/&dark blocks
                   (dolist (prop (append (unless soulwalker-themes-enable-bold   '(:weight normal :bold nil))
                                         (unless soulwalker-themes-enable-italic '(:slant normal :italic nil))))
                     (when (and (plist-member plist prop)
                                (not (eq (plist-get plist prop) 'inherit)))
                       (plist-put plist prop
                                  (if (memq prop '(:weight :slant))
                                      (quote 'normal))))))
                 (push (cons face plist) results))
               faces)
      (nreverse results))))

(defun soulwalker-themes--colorize (item type)
  (declare (pure t) (side-effect-free t))
  (when item
    (let ((soulwalker--quoted-p soulwalker--quoted-p))
      (cond ((listp item)
             (cond ((memq (car item) '(quote soulwalker-color))
                    item)
                   ((eq (car item) 'soulwalker-ref)
                    (soulwalker-themes--colorize
                     (apply #'soulwalker-ref (cdr item)) type))
                   ((let* ((item (append item nil))
                           (car (car item))
                           (soulwalker--quoted-p
                            (cond ((memq car '(backquote \`)) t)
                                  ((eq car '\,) nil)
                                  (t soulwalker--quoted-p))))
                      (cons car
                            (cl-loop
                             for i in (cdr item)
                             collect (soulwalker-themes--colorize i type)))))))

            ((and (symbolp item)
                  (not (keywordp item))
                  (not soulwalker--quoted-p)
                  (not (equal (substring (symbol-name item) 0 1) "-"))
                  (assq item soulwalker-themes--colors))
             `(soulwalker-color ',item ',type))

            (item)))))

(defun soulwalker-themes--build-face (face)
  (declare (pure t) (side-effect-free t))
  `(list
    ',(car face)
    ,(let ((face-body (cdr face)))
       (cond ((keywordp (car face-body))
              (let ((real-attrs face-body)
                    defs)
                (if (soulwalker-themes--colors-p real-attrs)
                    (dolist (cl soulwalker--min-colors `(list ,@(nreverse defs)))
                      (push `(list '((class color) (min-colors ,cl))
                                   (list ,@(soulwalker-themes--colorize real-attrs cl)))
                            defs))
                  `(list (list 't (list ,@real-attrs))))))

             ((memq (car-safe (car face-body)) '(quote backquote \`))
              (car face-body))

             ((let (all-attrs defs)
                (dolist (attrs face-body `(list ,@(nreverse defs)))
                  (cond ((eq (car attrs) '&all)
                         (setq all-attrs (append all-attrs (cdr attrs))))

                        ((memq (car attrs) '(&dark &light))
                         (let ((bg (if (eq (car attrs) '&dark) 'dark 'light))
                               (real-attrs (append all-attrs (cdr attrs) '())))
                           (cond ((soulwalker-themes--colors-p real-attrs)
                                  (dolist (cl soulwalker--min-colors)
                                    (push `(list '((class color) (min-colors ,cl) (background ,bg))
                                                 (list ,@(soulwalker-themes--colorize real-attrs cl)))
                                          defs)))

                                 ((push `(list '((background ,bg)) (list ,@real-attrs))
                                        defs)))))))))))))


;;
;;; Color helper functions

;; Shamelessly *borrowed* from solarized
;;;###autoload
(defun soulwalker-name-to-rgb (color)
  "Retrieves the hexidecimal string repesented the named COLOR (e.g. \"red\")
for FRAME (defaults to the current frame)."
  (cl-loop with div = (float (car (tty-color-standard-values "#ffffff")))
           for x in (tty-color-standard-values (downcase color))
           collect (/ x div)))

;;;###autoload
(defun soulwalker-blend (color1 color2 alpha)
  "Blend two colors (hexidecimal strings) together by a coefficient ALPHA (a
float between 0 and 1)"
  (when (and color1 color2)
    (cond ((and color1 color2 (symbolp color1) (symbolp color2))
           (soulwalker-blend (soulwalker-color color1) (soulwalker-color color2) alpha))

          ((or (listp color1) (listp color2))
           (cl-loop for x in color1
                    when (if (listp color2) (pop color2) color2)
                    collect (soulwalker-blend x it alpha)))

          ((and (string-prefix-p "#" color1) (string-prefix-p "#" color2))
           (apply (lambda (r g b) (format "#%02x%02x%02x" (* r 255) (* g 255) (* b 255)))
                  (cl-loop for it    in (soulwalker-name-to-rgb color1)
                           for other in (soulwalker-name-to-rgb color2)
                           collect (+ (* alpha it) (* other (- 1 alpha))))))

          (color1))))

;;;###autoload
(defun soulwalker-darken (color alpha)
  "Darken a COLOR (a hexidecimal string) by a coefficient ALPHA (a float between
0 and 1)."
  (cond ((and color (symbolp color))
         (soulwalker-darken (soulwalker-color color) alpha))

        ((listp color)
         (cl-loop for c in color collect (soulwalker-darken c alpha)))

        ((soulwalker-blend color "#000000" (- 1 alpha)))))

;;;###autoload
(defun soulwalker-lighten (color alpha)
  "Brighten a COLOR (a hexidecimal string) by a coefficient ALPHA (a float
between 0 and 1)."
  (cond ((and color (symbolp color))
         (soulwalker-lighten (soulwalker-color color) alpha))

        ((listp color)
         (cl-loop for c in color collect (soulwalker-lighten c alpha)))

        ((soulwalker-blend color "#FFFFFF" (- 1 alpha)))))

;;;###autoload
(defun soulwalker-color (name &optional type)
  "Retrieve a specific color named NAME (a symbol) from the current theme."
  (let ((colors (if (listp name)
                    name
                  (cdr-safe (assq name soulwalker-themes--colors)))))
    (and colors
         (cond ((listp colors)
                (let ((i (or (plist-get '(256 1 16 2 8 3) type) 0)))
                  (if (> i (1- (length colors)))
                      (car (last colors))
                    (nth i colors))))
               (t colors)))))

;;;###autoload
(defun soulwalker-ref (face prop &optional class)
  "TODO"
  (let ((spec (or (cdr (assq face soulwalker-themes--faces))
                  (error "Couldn't find the '%s' face" face))))
    (when (memq (car spec) '(quote backquote \`))
      (user-error "Can't fetch the literal spec for '%s'" face))
    (when class
      (setq spec (cdr (assq class spec)))
      (unless spec
        (error "Couldn't find the '%s' class in the '%s' face"
               class face)))
    (unless (plist-member spec prop)
      (error "Couldn't find the '%s' property in the '%s' face%s"
             prop face (if class (format "'s '%s' class" class) "")))
    (plist-get spec prop)))


;;
;;; Defining themes

(defun soulwalker-themes-prepare-facelist (custom-faces)
  "Return an alist of face definitions for `custom-theme-set-faces'.

Faces in EXTRA-FACES override the default faces."
  (declare (pure t) (side-effect-free t))
  (setq soulwalker-themes--faces (soulwalker-themes--apply-faces custom-faces))
  (mapcar #'soulwalker-themes--build-face soulwalker-themes--faces))

(defun soulwalker-themes-prepare-varlist (vars)
  "Return an alist of variable definitions for `custom-theme-set-variables'.

Variables in EXTRA-VARS override the default ones."
  (declare (pure t) (side-effect-free t))
  (cl-loop for (var val) in (append soulwalker-themes-base-vars vars)
           collect `(list ',var ,val)))

;;;###autoload
(defun soulwalker-themes-set-faces (theme &rest faces)
  "Customize THEME (a symbol) with FACES.

If THEME is nil, it applies to all themes you load. FACES is a list of Soulwalker
theme face specs. These is a simplified spec. For example:

  (soulwalker-themes-set-faces 'user
    '(default :background red :foreground blue)
    '(soulwalker-modeline-bar :background (if -modeline-bright modeline-bg highlight))
    '(soulwalker-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
    '(soulwalker-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
    '(soulwalker-modeline-buffer-project-root :foreground green :weight 'bold))"
  (declare (indent defun))
  (apply #'custom-theme-set-faces
         (or theme 'user)
         (eval
          `(let* ((bold   ,soulwalker-themes-enable-bold)
                  (italic ,soulwalker-themes-enable-italic)
                  ,@(cl-loop for (var . val) in soulwalker-themes--colors
                             collect `(,var ',val)))
             (list ,@(mapcar #'soulwalker-themes--build-face faces))))))

(defmacro def-soulwalker-theme (name docstring defs &optional extra-faces extra-vars)
  "Define a SOULWALKER theme, named NAME (a symbol)."
  (declare (doc-string 2))
  (let ((soulwalker-themes--colors defs))
    `(let* ((bold   soulwalker-themes-enable-bold)
            (italic soulwalker-themes-enable-italic)
            ,@defs)
       (setq soulwalker-themes--colors
             (list ,@(cl-loop for (var val) in defs
                              collect `(cons ',var ,val))))
       (deftheme ,name ,docstring)
       (custom-theme-set-faces
        ',name ,@(soulwalker-themes-prepare-facelist extra-faces))
       (custom-theme-set-variables
        ',name ,@(soulwalker-themes-prepare-varlist extra-vars))
       (unless bold (set-face-bold 'bold nil))
       (unless italic (set-face-italic 'italic nil))
       (provide-theme ',name))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (let* ((base (file-name-directory load-file-name))
         (dir (expand-file-name "themes/" base)))
    (add-to-list 'custom-theme-load-path
                 (or (and (file-directory-p dir) dir)
                     base))))


;; init state
(defvar soulwalker-theme-status "init")

(defun soulwalker-theme-load-dark ()
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme 'soulwalker-dark t)
  (setq soulwalker-theme-status "dark"))

(defun soulwalker-theme-toggle ()
  (interactive)
  (let ((bg-mode (frame-parameter nil 'background-mode)))
    (if (eq bg-mode 'dark)
        (soulwalker-theme-load-dark))))


(provide 'soulwalker-themes)
;;; soulwalker-themes.el ends here
