;;; my_ui/key/config.el -*- lexical-binding: t; -*-

;;; CREATED: <Пн фев 16 19:12:28 MSK 2026>
;;; Time-stamp: <Последнее обновление -- Понедельник февраля 16 19:12:31 MSK 2026>



(use-package! bind-key
  :preface
  ;; my/describe-personal-keybindings ("<f6> b")
  (defun my/describe-personal-keybindings ()
    "Вызывает `describe-personal-keybindings' и перемещается в новое окно. Так
  реально удобнее! (Мне так кажется)."
    (interactive)
    (describe-personal-keybindings)
    (other-window 1))

  :bind (("<f6> b" . my/describe-personal-keybindings))
  :config
  (message "Loading \"bind-key\"")
  (setq bind-key-describe-special-forms t)
  )
