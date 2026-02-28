;;; custom_section_tty.el.el -*- coding: utf-8; lexical-binding: t; -*-

;;; CREATED: <Fri Feb 01 16:50:27 EET 2019>
;;; Time-stamp: <Последнее обновление -- Saturday November 28 1:51:45 EET 2020>



;;; Commentary:

;;; Code:





(custom-set-faces
 '(default ((((class color) (min-colors 4096))
             (:foreground "#eeeeec" :background "#2e3436"))
            (((class color) (min-colors 256))
             (:foreground "#eeeeec" :background "#222"))
            (((class color) (min-colors 89))
             (:foreground "#eeeeec" :background "black"))))
;; ----------------------------------------------------------------

 '(cursor ((((class color) (min-colors 89)) (:background "#fce94f"))))
;; ----------------------------------------------------------------

 '(ediff-current-diff-A ((((class color) (min-colors 89)) (:background "#555753"))))
 '(ediff-current-diff-B ((((class color) (min-colors 89)) (:background "#555753"))))
 '(ediff-even-diff-A ((((class color) (min-colors 89)) (:background "#555753".5))))
 '(ediff-even-diff-B ((((class color) (min-colors 89)) (:background "#555753".5))))
 '(ediff-fine-diff-A ((((class color) (min-colors 89)) (:background "#204a87"))))
 '(ediff-fine-diff-B ((((class color) (min-colors 89)) (:background "#8f5902"))))
 '(ediff-odd-diff-A ((((class color) (min-colors 89)) (:background "#555753".5))))
 '(ediff-odd-diff-B ((((class color) (min-colors 89)) (:background "#555753".5))))
;; ----------------------------------------------------------------
 '(font-lock-builtin-face ((((class color) (min-colors 89)) (:foreground "#e090d7"))))
 '(font-lock-comment-face ((((class color) (min-colors 89)) (:foreground "#73d216"))))
 '(font-lock-constant-face ((((class color) (min-colors 88) (background dark)) (:foreground "#d33682"))))
 '(font-lock-function-name-face ((((class color) (min-colors 89)) (:foreground "#fce94f"))))
 '(font-lock-keyword-face ((((class color) (min-colors 89)) (:foreground "#b4fa70"))))
 '(font-lock-string-face ((((class color) (min-colors 88) (background dark)) (:foreground "#b58900"))))
 '(font-lock-type-face ((((class color) (min-colors 89)) (:foreground "#8cc4ff"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 89)) (:foreground "#fcaf3e"))))
;; ----------------------------------------------------------------

 '(help-argument-name ((t (:italic t :slant italic))))
 '(highlight ((((class color) (min-colors 89)) (:foreground "#2e3436" :background "#edd400"))))
 '(hl-line ((t (:inherit nil  :bold nil :background "white" :foreground "black"))))
;; ----------------------------------------------------------------

 '(isearch ((((class color) (min-colors 89)) (:foreground "#eeeeec" :background "#ce5c00"))))

;; ----------------------------------------------------------------

 '(lazy-highlight ((((class color) (min-colors 89)) (:background "#8f5902"))))
 '(link ((((class color) (min-colors 89)) (:underline t :foreground "#729fcf"))))
 '(link-visited ((((class color) (min-colors 89)) (:underline t :foreground "#3465a4"))))
;; ----------------------------------------------------------------

 '(region ((t (:bold t :background "#556832" :foreground "white"))))
;; ----------------------------------------------------------------

 '(secondary-selection ((((class color) (min-colors 89)) (:background "#204a87"))))
 '(show-paren-match ((t (:weight bold :background "#3e3b32" :foreground "white" :weight bold))))
 '(show-paren-mismatch-face ((t (:background "navy" :foreground "white"))))
 '(show-paren-match-expression ((t (:background "color-16" :inherit default :foreground "unspecified"))))
 '(semantic-decoration-on-includes ((((class color) (min-colors 89)) (:underline "#888a85"))))
 '(semantic-decoration-on-private-members-face ((((class color) (min-colors 89)) (:background "#5c3566"))))
 '(semantic-decoration-on-protected-members-face ((((class color) (min-colors 89)) (:background "#8f5902"))))
 '(semantic-decoration-on-unknown-includes ((((class color) (min-colors 89)) (:background "#a40000"))))
 '(semantic-decoration-on-unparsed-includes ((((class color) (min-colors 89)) (:background "#555753".5))))
 '(semantic-tag-boundary-face ((((class color) (min-colors 89)) (:overline "#729fcf"))))
 '(semantic-unmatched-syntax-face ((((class color) (min-colors 89)) (:underline "#ef2929"))))

 `(mode-line ((t (:background "grey" :foreground "black"))))
 `(mode-line-buffer-id ((t (:weight bold))))
 `(mode-line-emphasis ((t (:weight bold))))
 `(mode-line-inactive ((t (:background "black" :foreground "brown"))))
 )


(provide 'custom_section_tty)
