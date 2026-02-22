;;; my_ui/whitespace/config.el -*- lexical-binding: t; -*-

;;; CREATED: <Сб фев 21 20:53:20 MSK 2026>
;;; Time-stamp: <Последнее обновление -- Суббота февраля 21 20:53:44 MSK 2026>

;;; Commentary:

;;; Code:

;;; whitespace.el
;; built-in

(use-package! whitespace
  :defer t
  :init
  :config
  (message "Loading built-in \"whitespace\"")
  (setq whitespace-style
        '(face
          empty
          lines
          newline
          newline-mark
          spaces
          space-mark
          tab-mark
          tabs
          trailing))

  (setq whitespace-display-mappings
        '((space-mark 32 [183] [46])
          (space-mark 160 [164] [95])
          (newline-mark 10 [36 10])
          (tab-mark 9 [187 9] [92 9])))
  )
