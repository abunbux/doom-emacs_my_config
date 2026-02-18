;;; my_ui/whitespace/config.el -*- lexical-binding: t; -*-

;;; CREATED: <Пн фев 16 19:13:07 MSK 2026>
;;; Time-stamp: <Последнее обновление -- Понедельник февраля 16 19:13:12 MSK 2026>


;;; whitespace.el
;; built-in
;; "M-h h W"  `whitespace-mode'
(use-package! whitespace
  :init
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
  :config
  (whitespace-mode	-1)
  (message "Loading built-in \"whitespace\"")
  )

